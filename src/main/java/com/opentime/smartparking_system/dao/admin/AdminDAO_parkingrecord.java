package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.model.vo.AdminVO_parkingrecord;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_parkingrecord {

    // 전체 주차 기록 목록
    public List<AdminVO_parkingrecord> findAllJoinedRecords(Boolean isExited, String carNumberKeyword, String userNameKeyword) {
        String SQL = "SELECT pr.recordId, pr.entryTime, pr.exitTime, pr.fee, pr.isExited, " +
                "c.carId, c.carNumber, c.carModel, c.carType, u.userId, u.name " +
                "FROM parkingRecord pr " +
                "JOIN car c ON pr.carId = c.carId " +
                "JOIN user u ON c.userId = u.userId " +
                "WHERE 1=1 ";

        if (isExited != null) {
            SQL += "AND pr.isExited = ? ";
        }
        if (carNumberKeyword != null && !carNumberKeyword.isBlank()) {
            SQL += "AND c.carNumber LIKE ? ";
        }
        if (userNameKeyword != null && !userNameKeyword.isBlank()) {
            SQL += "AND u.name LIKE ? ";
        }

        SQL += "ORDER BY pr.entryTime DESC";

        List<AdminVO_parkingrecord> list = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);

            int idx = 1;
            if (isExited != null) {
                pstmt.setBoolean(idx++, isExited);
            }
            if (carNumberKeyword != null && !carNumberKeyword.isBlank()) {
                pstmt.setString(idx++, "%" + carNumberKeyword + "%");
            }
            if (userNameKeyword != null && !userNameKeyword.isBlank()) {
                pstmt.setString(idx++, "%" + userNameKeyword + "%");
            }

            @Cleanup ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                AdminVO_parkingrecord vo = AdminVO_parkingrecord.builder()
                        .recordId(rs.getInt("recordId"))
                        .entryTime(rs.getTimestamp("entryTime"))
                        .exitTime(rs.getTimestamp("exitTime"))
                        .fee(rs.getInt("fee"))
                        .isExited(rs.getBoolean("isExited"))
                        .carId(rs.getInt("carId"))
                        .carNumber(rs.getString("carNumber"))
                        .carModel(rs.getString("carModel"))
                        .carType(rs.getString("carType"))
                        .userId(rs.getInt("userId"))
                        .name(rs.getString("name"))
                        .build();
                list.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    // 최근 주차 기록 목록 5개
    public List<AdminVO_parkingrecord> fiveParkingHistory() {
        String SQL = "SELECT pr.recordId, pr.entryTime, pr.exitTime, pr.fee, pr.isExited, " +
                "c.carId, c.carNumber, c.carModel, c.carType, u.userId, u.name " +
                "FROM parkingRecord pr " +
                "JOIN car c ON pr.carId = c.carId " +
                "JOIN user u ON c.userId = u.userId " +
                "ORDER BY pr.entryTime DESC LIMIT 5";

        List<AdminVO_parkingrecord> list = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);
            @Cleanup ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                AdminVO_parkingrecord vo = AdminVO_parkingrecord.builder()
                        .recordId(rs.getInt("recordId"))
                        .entryTime(rs.getTimestamp("entryTime"))
                        .exitTime(rs.getTimestamp("exitTime"))
                        .fee(rs.getInt("fee"))
                        .isExited(rs.getBoolean("isExited"))
                        .carId(rs.getInt("carId"))
                        .carNumber(rs.getString("carNumber"))
                        .carModel(rs.getString("carModel"))
                        .carType(rs.getString("carType"))
                        .userId(rs.getInt("userId"))
                        .name(rs.getString("name"))
                        .build();
                list.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public int totalTodayCost(Timestamp start, Timestamp end){
        String SQL = "SELECT SUM(fee) FROM parkingRecord WHERE entryTime BETWEEN ? AND ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setTimestamp(1, start);
            preparedStatement.setTimestamp(2, end);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return Math.max(resultSet.getInt(1), 0); // 둘중 큰걸로 반환
            }
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
        return 0;
    }


    public int countTodayParkedRecords(Timestamp start , Timestamp end) {
        String SQL = "SELECT COUNT(*) FROM parkingRecord WHERE entryTime BETWEEN ? AND ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setTimestamp(1, start);
            preparedStatement.setTimestamp(2, end);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getInt(1);
            }
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
        return 0;
    }



    // 주차된 차량 수 구하기
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


}
