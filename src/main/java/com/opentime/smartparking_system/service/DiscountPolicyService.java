package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.DiscountPolicyDAO;
import com.opentime.smartparking_system.model.dto.DiscountPolicyDTO;
import com.opentime.smartparking_system.model.vo.DiscountPolicyVO;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public enum DiscountPolicyService {
    INSTANCE;

    private final DiscountPolicyDAO discountPolicyDAO;
    private final ModelMapper modelMapper;

    DiscountPolicyService() {
        discountPolicyDAO = new DiscountPolicyDAO();
        modelMapper = new ModelMapper();
    }

    public List<DiscountPolicyDTO> getAllDiscountPolicies() {
        List<DiscountPolicyVO> discountVOList = discountPolicyDAO.selectAllDiscounts();
        if (discountVOList == null || discountVOList.isEmpty()) {
            return Collections.emptyList();
        }

        List<DiscountPolicyDTO> discountDTOList = new ArrayList<>();
        for (DiscountPolicyVO discountVO : discountVOList) {
            DiscountPolicyDTO discountDTO = modelMapper.map(discountVO, DiscountPolicyDTO.class);
            discountDTOList.add(discountDTO);
        }
        return discountDTOList;
    }

    public DiscountPolicyDTO getDiscountPolicyById(int id) {
        DiscountPolicyVO discountVO = discountPolicyDAO.selectDiscountById(id);
        if (discountVO == null) {
            return null;
        }
        return modelMapper.map(discountVO, DiscountPolicyDTO.class);
    }

    public boolean insertDiscountPolicy(DiscountPolicyDTO discountPolicyDTO) {
        if (discountPolicyDTO == null) {
            return false;
        }
        DiscountPolicyVO discountVO = modelMapper.map(discountPolicyDTO, DiscountPolicyVO.class);
        return discountPolicyDAO.insertDiscount(discountVO);
    }

    public boolean updateDiscountPolicy(DiscountPolicyDTO discountPolicyDTO) {
        if (discountPolicyDTO == null) {
            return false;
        }
        if (discountPolicyDAO.selectDiscountById(discountPolicyDTO.getDiscountId()) == null) {
            return false;
        }
        DiscountPolicyVO discountVO = modelMapper.map(discountPolicyDTO, DiscountPolicyVO.class);
        return discountPolicyDAO.updateDiscount(discountVO);
    }

    public boolean deleteDiscountPolicyById(int id) {
        if (discountPolicyDAO.selectDiscountById(id) == null) {
            return false;
        }
        return discountPolicyDAO.deleteDiscountById(id);
    }
}