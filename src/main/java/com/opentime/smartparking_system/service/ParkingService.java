package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.model.vo.ParkingVO;
import com.opentime.smartparking_system.util.MapperUtil;
import org.modelmapper.ModelMapper;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;

public enum ParkingService {
    INSTANCE;

    private final ParkingDAO parkingDAO;
    private final ModelMapper modelMapper;

    ParkingService() {
        parkingDAO = new ParkingDAO();
        modelMapper = MapperUtil.INSTANCE.getModelMapper();
    }

    // 입차 등록
    public boolean registerEntry(ParkingDTO parkingDTO) {
        if (parkingDTO == null || parkingDTO.getCarId() == 0) return false;

        // 이미 입차 중인 차량인지 확인
        ParkingVO activeEntry = parkingDAO.findActiveEntryByCarId(parkingDTO.getCarId());
        if (activeEntry != null && activeEntry.getExitTime() == null) {
            return false; // 이미 입차된 상태이므로 등록하지 않음
        }
 
        // entryTime이 null이면 현재 시간으로 설정
        if (parkingDTO.getEntryTime() == null) {
            parkingDTO.setEntryTime(Timestamp.valueOf(LocalDateTime.now()));
        }

        ParkingVO parkingVO = modelMapper.map(parkingDTO, ParkingVO.class);
        return parkingDAO.insertEntry(parkingVO);
    }

    // 출차 및 요금 계산
    public ParkingDTO processExit(int carId) {
        ParkingVO entry = parkingDAO.findActiveEntryByCarId(carId);

        if (entry == null) return null;

        LocalDateTime exitTime = LocalDateTime.now();
        entry.setExitTime(Timestamp.valueOf(exitTime));

        LocalDateTime entryTime = entry.getEntryTime().toLocalDateTime();
        int minutes = Math.toIntExact(Duration.between(entryTime, exitTime).toMinutes());

        int fee = calculateFee(minutes);
        entry.setFee(fee);

        parkingDAO.updateExitInfo(entry);

        return modelMapper.map(entry, ParkingDTO.class);
    }

    // 요금 계산: 10분당 1000원
    private int calculateFee(int minutes) {
        int unit = 10;
        int rate = 1000;
        return ((minutes + unit - 1) / unit) * rate;
    }
}
