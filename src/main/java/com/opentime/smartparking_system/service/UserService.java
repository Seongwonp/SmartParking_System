package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.UserDAO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.model.vo.UserVO;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.PasswordUtil;
import org.modelmapper.ModelMapper;


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
        UserVO userVO = userDAO.findByUserName(userName);

        if (userVO != null && PasswordUtil.INSTANCE.verifyPassword(inputPassword, userVO.getPassword())) {
            return modelMapper.map(userVO, UserDTO.class);
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

}
