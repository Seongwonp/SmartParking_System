package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.FeePolicyDAO;
import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.model.vo.FeePolicyVO;
import com.opentime.smartparking_system.util.MapperUtil;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;


public enum FeePolicyService {
    INSTANCE;
    private final FeePolicyDAO feePolicyDAO;
    private final ModelMapper modelMapper;
    FeePolicyService() {
        feePolicyDAO = new FeePolicyDAO();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    public List<FeePolicyDTO> getAllFeePolicies() {
        List<FeePolicyVO> feePolicyVOList = feePolicyDAO.selectAllFee();
        if (feePolicyVOList == null || feePolicyVOList.isEmpty()) {
            return Collections.emptyList(); // 빈배열 반환
        }
        List<FeePolicyDTO> feePolicyDTOList = new ArrayList<>();
        for (FeePolicyVO feePolicyVO : feePolicyVOList) {
            FeePolicyDTO feePolicyDTO = modelMapper.map(feePolicyVO, FeePolicyDTO.class);
            feePolicyDTOList.add(feePolicyDTO);
        }
        return feePolicyDTOList;
    }

    public FeePolicyDTO getFeePolicyById(int id) {
        FeePolicyVO feePolicyVO = feePolicyDAO.selectFeeById(id);
        if (feePolicyVO == null) {
            return null;
        }
        return modelMapper.map(feePolicyVO, FeePolicyDTO.class);
    }

    public boolean insertFeePolicy(FeePolicyDTO feePolicyDTO) {
        if (feePolicyDTO == null) {
            return false;
        }
        FeePolicyVO feePolicyVO = modelMapper.map(feePolicyDTO, FeePolicyVO.class);
        return feePolicyDAO.insertFee(feePolicyVO);
    }

    public boolean updateFeePolicy(FeePolicyDTO feePolicyDTO) {
        if (feePolicyDTO == null) {
            return false;
        }
        if (feePolicyDAO.selectFeeById(feePolicyDTO.getPolicyId()) == null) {
            return false;
        }
        FeePolicyVO feePolicyVO = modelMapper.map(feePolicyDTO, FeePolicyVO.class);
        return feePolicyDAO.updateFee(feePolicyVO);
    }

    public boolean deleteFeePolicyById(int id) {
        if (feePolicyDAO.selectFeeById(id) == null) {
            return false;
        }
        return feePolicyDAO.deleteFeeById(id);
    }



}
