package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.UserDAO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.model.vo.UserVO;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.PasswordUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Log4j2
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


    // 고객 멤버쉽 최신화
    public boolean updateSubscription(int userId, Date subscriptionStart, Date subscriptionEnd){
        if(subscriptionStart == null || subscriptionEnd == null){
            return userDAO.updateSubscription(userId, false, null, null);
        }
        return userDAO.updateSubscription(userId, true, subscriptionStart, subscriptionEnd);
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
        log.info("Updating user info for: {}", userDTO.getUserName());
        // 실제 업데이트 실행되는지 확인
        if (userDTO == null) return false;

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

    // 회원정보 조회 - 비밀번호 검증없이 단순 조회
    public UserDTO getUserInfo(String userName) {
        if (userName == null || userName.isEmpty()) return null;

        UserVO userVO = userDAO.findByUserName(userName);
        if (userVO == null) return null;

        return modelMapper.map(userVO, UserDTO.class);
    }


}
