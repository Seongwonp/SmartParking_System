package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.FeePolicyDAO;
import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.model.vo.FeePolicyVO;
import org.modelmapper.ModelMapper;

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
        for (FeePolicyVO feePolicyVO : feePolicyVOList) {
            modelMapper.map(feePolicyVO, FeePolicyDTO.class);
        }
        return null;
    }

}
