package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.FeePolicyDAO;
import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.model.vo.FeePolicyVO;
import org.modelmapper.ModelMapper;

import java.util.ArrayList;
import java.util.List;


public enum FeePolicyService {
    INSTANCE;
    private FeePolicyDAO feePolicyDAO;
    private ModelMapper modelMapper;
    FeePolicyService() {
        feePolicyDAO = new FeePolicyDAO();
        modelMapper = new ModelMapper();
    }

    public List<FeePolicyDTO> getAllFeePolicies() {
        List<FeePolicyVO> feePolicyVOList = feePolicyDAO.selectAllFee();
        if (feePolicyVOList == null || feePolicyVOList.isEmpty()) {
            return null;
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
