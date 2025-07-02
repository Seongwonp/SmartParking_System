package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.model.vo.ParkingVO;
import com.opentime.smartparking_system.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Log4j2
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
        log.info("Parking exit: {}", entry.getExitTime());
        if (entry == null || entry.getEntryTime() == null) return null;
        LocalDateTime exitTime = LocalDateTime.now();
        entry.setExitTime(Timestamp.valueOf(exitTime));

        LocalDateTime entryTime = entry.getEntryTime().toLocalDateTime();
        int minutes = Math.toIntExact(Duration.between(entryTime, exitTime).toMinutes());

        int fee = calculateFee(minutes, entry.getCarType(), entry.getSubscriptionType());
        entry.setFee(fee);


        boolean updated = parkingDAO.updateExitInfo(entry);
        if (!updated) return null;
        return modelMapper.map(entry, ParkingDTO.class);
    }

    private int calculateFee(int minutes, String carType, String subscriptionType) {
        int baseFee = 2000;             // 기본 1시간 요금
        int additionalUnit = 30;        // 추가 요금 단위 (분)
        int additionalFee = 1000;       // 30분마다 부과 요금
        int dailyMaxFee = 15000;        // 일일 최대 요금

        // 정액제 회원은 무조건 0원 처리
        if ("monthly".equalsIgnoreCase(subscriptionType) || "annual".equalsIgnoreCase(subscriptionType)) {
            return 0;
        }

        // 일반 요금 계산
        int totalFee;
        if (minutes <= 60) {
            totalFee = baseFee;
        } else {
            int extraMinutes = minutes - 60; // 기본시간 이후 추가 시간
            int extraUnits = (extraMinutes + additionalUnit - 1) / additionalUnit; //30분 = 1단위
            totalFee = baseFee + extraUnits * additionalFee;
        }
        totalFee = Math.min(totalFee, dailyMaxFee); // 최대 요금 제한, 15000까지만 부과
         /*
        추가시간 계산
        61분 = (1+29)/30 = 1
        62분 = (2+29)/30 = 1.03
        91분 = (31+29)/30 = 2
        119분 = (59+29)/30 = 2.93
         */

        //차량 유형 할인 적용
        if ("장애인".equals(carType)) {
            totalFee = totalFee / 2;
        } else if ("경차".equals(carType)) {
            totalFee = (int) (totalFee * 0.7);
        }

        return totalFee;
    }

    public int countParkedCars() {
        return parkingDAO.countParkedCars();
    }

    public int countEntriesByDate(LocalDate date) {
        if (date == null) return parkingDAO.countEntriesByDate(LocalDate.now());
        return parkingDAO.countEntriesByDate(date);
    }

    public int countExitsByDate(LocalDate date) {
        if (date == null) return parkingDAO.countExitsByDate(LocalDate.now());
        return parkingDAO.countExitsByDate(date);
    }


}
