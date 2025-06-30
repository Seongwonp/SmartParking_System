package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.admin.*;
import com.opentime.smartparking_system.model.dto.*;
import com.opentime.smartparking_system.model.vo.*;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.PasswordUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;
@Log4j2
public enum AdminService {
    INSTANCE;

    private final ModelMapper modelMapper;
    private final AdminDAO_user adminDAOUser;
    private final AdminDAO_fee adminDAOFee;
    private final AdminDAO_discount adminDAODiscount;
    private final AdminDAO_notice adminDAONotice;

    AdminService() {
        adminDAOUser = new AdminDAO_user();
        adminDAOFee = new AdminDAO_fee();
        adminDAODiscount = new AdminDAO_discount();
        adminDAONotice = new AdminDAO_notice();
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




    /* *********************** 요금제 관리 ******************************* */

    public boolean insertFee(FeePolicyDTO feePolicyDTO) {
        if(feePolicyDTO == null) return false;
        FeePolicyVO feePolicyVO = modelMapper.map(feePolicyDTO, FeePolicyVO.class);
        return adminDAOFee.insertFee(feePolicyVO);
    }

    public List<FeePolicyDTO> getListFeePolicy() {
        List<FeePolicyVO> ListVO = adminDAOFee.selectAllFee();
        if (ListVO == null || ListVO.isEmpty()) {
            return new ArrayList<>();
        }
        List<FeePolicyDTO> dtoList = new ArrayList<>();
        for (FeePolicyVO vo : ListVO) {
            FeePolicyDTO dto = modelMapper.map(vo, FeePolicyDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }


    public FeePolicyDTO getFeePolicyById(int policyId) {
        FeePolicyVO vo = adminDAOFee.selectFeePolicyById(policyId);
        if (vo == null) {
            return null;
        }
        return modelMapper.map(vo, FeePolicyDTO.class);
    }

    public boolean updateFeePolicy(FeePolicyDTO feePolicyDTO) {
        if(feePolicyDTO == null) return false;
        return adminDAOFee.updateFeePolicy(modelMapper.map(feePolicyDTO, FeePolicyVO.class));
    }




    /* *********************** 할인 정책 관리 ******************************* */

    public List<DiscountPolicyDTO> getListDiscountPolicy() {
        List<DiscountPolicyVO> listVO = adminDAODiscount.selectAllDiscount();
        if (listVO == null || listVO.isEmpty()) {
            return new ArrayList<>();
        }
        List<DiscountPolicyDTO> dtoList = new ArrayList<>();
        for (DiscountPolicyVO vo : listVO) {
            DiscountPolicyDTO dto = modelMapper.map(vo, DiscountPolicyDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    public DiscountPolicyDTO getDiscountPolicyById(int discountId) {
        DiscountPolicyVO vo = adminDAODiscount.selectDiscountById(discountId);
        if (vo == null) {
            return null;
        }
        return modelMapper.map(vo, DiscountPolicyDTO.class);
    }

    public boolean updateDiscountPolicy(DiscountPolicyDTO discountPolicyDTO) {
        if(discountPolicyDTO == null) return false;
        return adminDAODiscount.updateDiscount(modelMapper.map(discountPolicyDTO, DiscountPolicyVO.class));
    }

    public boolean insertDiscountPolicy(DiscountPolicyDTO discountPolicyDTO) {
        if (discountPolicyDTO == null) return false;
        return adminDAODiscount.insertDiscount(modelMapper.map(discountPolicyDTO, DiscountPolicyVO.class));
    }

    public boolean deleteDiscountPolicy(int discountId) {
        if (discountId == 1) {
            return false;
        }
        return adminDAODiscount.deleteDiscount(discountId);
    }



    /* *********************** 공지사항 관리 ******************************* */
    // 전체 혹은 검색된 공지 리스트
    public List<NoticeDTO> getNoticeList(String keyword) {
        List<NoticeVO> voList = adminDAONotice.getListNotice(keyword);
        if (voList == null) {
            return new ArrayList<>();
        }
        List<NoticeDTO> dtoList = new ArrayList<>();
        for (NoticeVO vo : voList) {
            NoticeDTO dto = modelMapper.map(vo, NoticeDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    // 공지 단건 조회
    public NoticeVO getNoticeById(int noticeId) {
        return adminDAONotice.getNoticeById(noticeId);
    }

    // 공지 등록
    public boolean insertNotice(NoticeDTO noticeDTO) {
        if(noticeDTO == null) return false;
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        return adminDAONotice.insertNotice(noticeVO);
    }

    // 공지 수정
    public boolean updateNotice(NoticeDTO noticeDTO) {
        if(noticeDTO == null) return false;
        NoticeVO noticeVO = modelMapper.map(noticeDTO, NoticeVO.class);
        return adminDAONotice.updateNotice(noticeVO);
    }

    // 공지 삭제
    public boolean deleteNotice(int noticeId) {
        return adminDAONotice.deleteNotice(noticeId);
    }

}