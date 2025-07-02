package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.model.vo.ParkingVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;
import lombok.extern.log4j.Log4j2;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
public class ParkingDAO {

    // 입차 등록 (출차 전까지는 exitTime, fee는 NULL / isExited=false)
    public boolean insertEntry(ParkingVO parking) {
        String sql = "INSERT INTO parkingRecord (carId, entryTime, isExited) VALUES (?, ?, false)";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, parking.getCarId());
            pstmt.setTimestamp(2, parking.getEntryTime());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 출차 처리
    public boolean updateExitInfo(ParkingVO parking) {
        //*수정내용* 출차시간은 등록시점의 현재로 설정, 조건 - 출차 시간이 Null 인 사용자
        String sql = "UPDATE parkingRecord SET exitTime = NOW(), fee =?, isExited = true WHERE recordId = ? AND exitTime IS NULL";

        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(sql);
            //*수정*시간을 now()로 설정했기 때문에 파라미터에서 시간은 제외
            pstmt.setInt(1, parking.getFee());
            pstmt.setInt(2, parking.getRecordId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 출차되지 않은 최근 입차 기록 조회 (차량 1대 기준)
    public ParkingVO findActiveEntryByCarId(int carId) {
        String sql = "SELECT c.cartype, pr.carId, pr.entryTime, pr.exitTime, pr.fee, s.subscriptionType " +
                " FROM car c JOIN parkingRecord pr ON c.carId = pr.carId LEFT JOIN subscription s ON c.carId = s.carId " +
                " WHERE c.carId = ? AND pr.isExited = false ORDER BY pr.entryTime DESC LIMIT 1";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, carId);
            @Cleanup ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                ParkingVO vo = ParkingVO.builder()
                        .carId(rs.getInt("carId"))
                        .entryTime(rs.getTimestamp("entryTime"))
                        .exitTime(rs.getTimestamp("exitTime"))
                        .fee(rs.getInt("fee"))
                        .carType(rs.getString("carType")) //추가
                        .subscriptionType(rs.getString("subscriptionType")) // 추가
                        .build();

                return vo;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // 전체 주차 기록 목록
    public List<ParkingVO> findAllRecords() {
        String sql = "SELECT * FROM parkingRecord ORDER BY entryTime DESC";
        List<ParkingVO> list = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(sql);
            @Cleanup ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(ParkingVO.builder()
                        .recordId(rs.getInt("recordId"))
                        .carId(rs.getInt("carId"))
                        .entryTime(rs.getTimestamp("entryTime"))
                        .exitTime(rs.getTimestamp("exitTime"))
                        .fee((int) rs.getInt("fee"))
                        .build());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<Map<String, Object>> getParkingStatusList() throws SQLException {
        String sql = "SELECT c.carNumber, pr.entryTime, pr.exitTime " +
                "FROM car c " +
                "JOIN parkingRecord pr ON c.carId = pr.carId " +
                "WHERE pr.isExited = FALSE";

        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery();
            List<Map<String, Object>> list = new ArrayList<>();
            while (resultSet.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("carNumber", resultSet.getString("carNumber"));
                map.put("entryTime", resultSet.getTimestamp("entryTime"));
                map.put("exitTime", resultSet.getTimestamp("exitTime"));
                list.add(map);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int countParkedCars(){
        String SQL = "SELECT COUNT(*) FROM parkingRecord WHERE isExited = FALSE";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int countExitsByDate(LocalDate date) {
        String SQL = "SELECT COUNT(*) FROM parkingRecord WHERE isExited = TRUE AND DATE(exitTime) = ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);
            pstmt.setDate(1, Date.valueOf(date));
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int countEntriesByDate(LocalDate date) {
        String SQL = "SELECT COUNT(*) FROM parkingRecord WHERE DATE(entryTime) = ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);
            pstmt.setDate(1, Date.valueOf(date));
            @Cleanup ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }


}
