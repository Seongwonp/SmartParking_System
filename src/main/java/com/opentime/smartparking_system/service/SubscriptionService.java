package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.SubscriptionDAO;
import com.opentime.smartparking_system.model.dto.SubscriptionDTO;
import com.opentime.smartparking_system.model.vo.SubscriptionVO;
import com.opentime.smartparking_system.util.MapperUtil;
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

    public boolean updateStatus(int carId, String status) {
        if(status == null || status.trim().isEmpty()) return false;
        if(!subscriptionDAO.findSubscriptionByCarId(carId)) return false;
        if(!isValidStatus(status)) return false; // status 객체 검사
        return subscriptionDAO.updateStatus(carId, status);
    }





}
