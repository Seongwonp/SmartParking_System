package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.SubscriptionDAO;
import com.opentime.smartparking_system.model.dto.SubscriptionDTO;
import com.opentime.smartparking_system.model.vo.SubscriptionVO;
import com.opentime.smartparking_system.util.MapperUtil;
import org.modelmapper.ModelMapper;

public enum SubscriptionService {
    INSTANCE;
    private final SubscriptionDAO subscriptionDAO;
    private final ModelMapper modelMapper;
    SubscriptionService() {
        this.subscriptionDAO = new SubscriptionDAO();
        this.modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    public boolean addSubscription(SubscriptionDTO subscriptionDTO) {
        SubscriptionVO subscriptionVO = this.modelMapper.map(subscriptionDTO, SubscriptionVO.class);
        return false;
    }



}
