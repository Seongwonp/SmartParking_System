package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.admin.AdminDAO_user;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.model.vo.UserVO;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.PasswordUtil;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;

public enum AdminService {
    INSTANCE;

    private final ModelMapper modelMapper;
    private final AdminDAO_user adminDAOUser;

    AdminService() {
        adminDAOUser = new AdminDAO_user();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    // 총 회원 수
    public int getTotalMemberCount() {
        return adminDAOUser.getTotalMemberCount();
    }

    // 월정액 회원 수
    public int getSubscriptionMemberCount() {
        return adminDAOUser.getSubscriptionMemberCount();
    }

    // 최근 가입 회원 리스트
    public List<UserDTO> getRecentMembers() {
        List<UserVO> voList = adminDAOUser.getRecentMembers();
        List<UserDTO> dtoList = new ArrayList<>();
        for (UserVO vo : voList) {
            UserDTO dto = modelMapper.map(vo, UserDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    // 관리자 목록 가져오기
    public List<UserDTO> getAdminList() {
        List<UserVO> voList = adminDAOUser.getAdminList();
        List<UserDTO> dtoList = new ArrayList<>();
        for (UserVO userVO : voList) {
            UserDTO dto = modelMapper.map(userVO, UserDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    // 관리자 검색 목록 가져오기
    public List<UserDTO> searchUser(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAdminList();
        }
        List<UserVO> voList = adminDAOUser.searchAdmin(keyword);
        if (voList == null || voList.isEmpty()) {
            return new ArrayList<>();
        }
        List<UserDTO> dtoList = new ArrayList<>();
        for (UserVO userVO : voList) {
            UserDTO dto = modelMapper.map(userVO, UserDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    public UserDTO getAdminById(int id) {
        UserVO userVO = adminDAOUser.getUserById(id);
        if (userVO == null) {
            return null;
        }
        return modelMapper.map(userVO, UserDTO.class);
    }

    // 관리자 추가
    public boolean insertAdmin(UserDTO userDTO) {
        if(userDTO == null) return false;
        if(adminDAOUser.isUserIdDuplicate(userDTO.getUserName())) return false;

        // 비밀번호 암호화
        String hashedPassword = PasswordUtil.INSTANCE.hashPassword(userDTO.getPassword());
        userDTO.setPassword(hashedPassword);

        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        return adminDAOUser.insertAdmin(userVO);
    }

    // 관리자 수정
    public boolean updateAdmin(UserDTO userDTO) {
        if(userDTO == null) return false;
        if(adminDAOUser.isUserIdDuplicate(userDTO.getUserName())) return false;
        // 비밀번호 암호화
        String hashedPassword = PasswordUtil.INSTANCE.hashPassword(userDTO.getPassword());
        userDTO.setPassword(hashedPassword);

        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        return adminDAOUser.updateAdmin(userVO);
    }

    // 관리자 삭제
    public boolean deleteAdmin(int userId) {
        return adminDAOUser.deleteAdmin(userId);
    }
}