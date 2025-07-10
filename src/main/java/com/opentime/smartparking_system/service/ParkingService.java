package com.opentime.smartparking_system.service;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.AdminDTO_parkingrecord;
import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.model.vo.AdminVO_parkingrecord;
import com.opentime.smartparking_system.model.vo.ParkingVO;
import com.opentime.smartparking_system.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Log4j2
public enum ParkingService {
    INSTANCE;

    private final ParkingDAO parkingDAO;
    private final ModelMapper modelMapper;
    private ParkingDAO parkingService;

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

    public ParkingDTO processExit(int carId) {
        ParkingVO entry = parkingDAO.findActiveEntryByCarId(carId);

        if (entry == null) {
            log.warn("출차 시도: carId {} 에 대한 활성화된 입차 기록이 없습니다.", carId);
            return null;
        }

        if (entry.getExitTime() != null) {
            log.warn("출차 시도: carId {} 는 이미 출차가 완료된 차량입니다.", carId);
            return null;
        }

        if (entry.getEntryTime() == null) {
            log.warn("출차 시도: carId {} 의 입차 시간이 null 입니다.", carId);
            return null;
        }

        log.info("Parking exit 처리 진행: carId={}, entryTime={}", carId, entry.getEntryTime());

        LocalDateTime exitTime = LocalDateTime.now();
        entry.setExitTime(Timestamp.valueOf(exitTime));

        LocalDateTime entryTime = entry.getEntryTime().toLocalDateTime();
        int minutes = Math.toIntExact(Duration.between(entryTime, exitTime).toMinutes());

        int fee = calculateFee(minutes, entry.getCarType(), entry.getSubscriptionType());
        entry.setFee(fee);

        boolean updated = parkingDAO.updateExitInfo(entry);
        if (!updated) {
            log.error("출차 정보 업데이트 실패: carId={}", carId);
            return null;
        }
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
        int totalFee = 0;
        int totalMinutes = minutes;

        // 하루(1440분) 단위로 요금 계산
        while (totalMinutes > 0) {
            int todayMinutes = Math.min(totalMinutes, 1440); // 하루 최대 1440분
            int dayFee;

            if (todayMinutes <= 60) {
                dayFee = baseFee;
            } else {
                int extraMinutes = todayMinutes - 60; // 기본시간 이후 추가 시간
                int extraUnits = (extraMinutes + additionalUnit - 1) / additionalUnit;
                dayFee = baseFee + extraUnits * additionalFee;
            }

            dayFee = Math.min(dayFee, dailyMaxFee); // 하루 최대 요금 제한
            totalFee += dayFee;
            totalMinutes -= 1440;

        }
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

    public List<AdminDTO_parkingrecord> existCarList(String carId) {
        List<AdminVO_parkingrecord> voList = parkingDAO.findAllJoinedRecords(true, carId);
        List<AdminDTO_parkingrecord> dtoList = new ArrayList<>();
        for (AdminVO_parkingrecord vo : voList) {
            dtoList.add(modelMapper.map(vo, AdminDTO_parkingrecord.class));
        }
        return dtoList;
    }

    public List<Map<String, Object>> getParkingStatusList(int userId) throws SQLException {
        if(userId < 0) return null;
        return parkingDAO.getParkingStatusList(userId);
    }


    // 최근 주차기록 조회
    public List<AdminDTO_parkingrecord> historicalCarList(String carId, int limit) {
        if (carId == null || carId.trim().isEmpty()) {
            return new ArrayList<>();
        }
        limit = (limit < 1) ? 5 : limit;

        return parkingDAO.ParkingHistoryByCarId(carId, limit).stream()
                .map(vo -> modelMapper.map(vo, AdminDTO_parkingrecord.class))
                .toList();
    }
}
