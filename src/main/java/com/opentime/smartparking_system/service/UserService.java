package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.UserDAO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.model.vo.UserVO;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.PasswordUtil;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;

public enum UserService {
    INSTANCE;

    private final UserDAO userDAO;
    private final ModelMapper modelMapper;

    UserService() {
        userDAO = new UserDAO();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    //회원가입
    public boolean addUser(UserDTO userDTO) {
        if(userDTO == null) return false;
        if(userDAO.isUserIdDuplicate(userDTO.getUserName())){
           return false;
        }

        // 비밀번호 암호화
        String hashedPassword = PasswordUtil.INSTANCE.hashPassword(userDTO.getPassword());
        userDTO.setPassword(hashedPassword);

        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        return userDAO.insertUser(userVO);
    }


    //로그인
    public UserDTO loginUser(String userName, String inputPassword) {
        UserVO vo = userDAO.findByUserName(userName);

        if (vo != null && PasswordUtil.INSTANCE.verifyPassword(inputPassword, vo.getPassword())) {
            return modelMapper.map(vo, UserDTO.class);
        }
        return null;
    }



    // 회원 정보 수정
    public boolean updateUser(UserDTO userDTO) {
        if (userDTO == null || userDAO.isUserIdDuplicate(userDTO.getUserName())) return false;

        // 비밀번호 암호화
        String hashedPassword = PasswordUtil.INSTANCE.hashPassword(userDTO.getPassword());
        userDTO.setPassword(hashedPassword);

        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        return userDAO.updateUser(userVO);
    }


    // 회원 탈퇴
    public boolean deleteUser(String userName) {
        return userDAO.deleteUser(userName);
    }



    // 총 회원 수
    public int getTotalMemberCount() {
        return userDAO.getTotalMemberCount();
    }

    // 월정액 회원 수
    public int getSubscriptionMemberCount() {
        return userDAO.getSubscriptionMemberCount();
    }

    // 최근 가입 회원 리스트 (DTO 리스트 반환)
    public List<UserDTO> getRecentMembers() {
        List<UserVO> voList = userDAO.getRecentMembers();
        List<UserDTO> dtoList = new ArrayList<>();
        for (UserVO vo : voList) {
            UserDTO dto = modelMapper.map(vo, UserDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }


}
