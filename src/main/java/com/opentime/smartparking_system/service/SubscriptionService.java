package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.SubscriptionDAO;
import com.opentime.smartparking_system.model.dto.SubscriptionDTO;
import com.opentime.smartparking_system.model.vo.SubscriptionVO;
import com.opentime.smartparking_system.util.MapperUtil;
import com.opentime.smartparking_system.util.SubscriptionStatus;
import org.modelmapper.ModelMapper;

import static com.opentime.smartparking_system.util.SubscriptionStatus.isValidStatus;

public enum SubscriptionService {
    INSTANCE;
    private final SubscriptionDAO subscriptionDAO;
    private final ModelMapper modelMapper;
    SubscriptionService() {
        this.subscriptionDAO = new SubscriptionDAO();
        this.modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    public boolean addSubscription(SubscriptionDTO subscriptionDTO) {
        if(subscriptionDTO == null) return false;
        if(subscriptionDAO.findSubscriptionByCarId(subscriptionDTO.getCarId())) return false;
        SubscriptionVO subscriptionVO = this.modelMapper.map(subscriptionDTO, SubscriptionVO.class);
        return subscriptionDAO.insertSubscription(subscriptionVO);
    }

    public boolean updateSubscription(SubscriptionDTO subscriptionDTO) {
        if(subscriptionDTO == null) return false;
        if(!subscriptionDAO.findSubscriptionByCarId(subscriptionDTO.getCarId())) return false;
        SubscriptionVO subscriptionVO = this.modelMapper.map(subscriptionDTO, SubscriptionVO.class);
        return subscriptionDAO.updateSubscription(subscriptionVO);
    }

    public boolean updateStatus(int carId, SubscriptionStatus status) {
        if(status == null || !isValidStatus(status.name())) return false;
        if(!subscriptionDAO.findSubscriptionByCarId(carId)) return false;
        return subscriptionDAO.updateStatus(carId, status);
    }


    public SubscriptionDTO getActiveSubscriptionByUserId(int userId) {
        SubscriptionDTO dto = modelMapper.map(subscriptionDAO.getActiveSubscriptionByUserId(userId), SubscriptionDTO.class);
        if(dto == null) return null;
        return dto;
    }




}
