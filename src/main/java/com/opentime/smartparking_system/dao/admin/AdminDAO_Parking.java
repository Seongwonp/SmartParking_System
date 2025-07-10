package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.model.vo.AdminVO_parkingrecord;
import com.opentime.smartparking_system.model.vo.ParkingVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_Parking {

    public boolean adminExitCar(int recordId, int fee) {
        String sql = "UPDATE parkingRecord SET exitTime = NOW(), fee = ?, isExited = true WHERE recordId = ? AND exitTime IS NULL";
        try (Connection conn = ConnectionUtil.INSTANCE.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, fee);
            pstmt.setInt(2, recordId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // 주차중 차량 리스트 출력
    public List<AdminVO_parkingrecord> findParkingList(String carNumberKeyword, String userNameKeyword) {
        String SQL = "SELECT pr.recordId, pr.entryTime, pr.exitTime, pr.fee, pr.isExited, " +
                "c.carId, c.carNumber, c.carModel, c.carType, u.userId, u.name " +
                "FROM parkingRecord pr " +
                "JOIN car c ON pr.carId = c.carId " +
                "JOIN user u ON c.userId = u.userId " +
                "WHERE pr.isExited = FALSE ";

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
            if (carNumberKeyword != null && !carNumberKeyword.isBlank()) {
                pstmt.setString(idx++, "%" + carNumberKeyword + "%");
            }
            if (userNameKeyword != null && !userNameKeyword.isBlank()) {
                pstmt.setString(idx, "%" + userNameKeyword + "%");
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




    // 출차되지 않은 최근 입차 기록 조회 (차량 1대 기준)
    public ParkingVO findActiveEntryByCarId(int carId) {
        String sql = "SELECT c.carNumber,c.cartype, pr.carId, pr.entryTime, pr.exitTime, pr.fee, s.subscriptionType,pr.recordId " +
                " FROM car c JOIN parkingRecord pr ON c.carId = pr.carId LEFT JOIN subscription s ON c.carId = s.carId " +
                " WHERE c.carId = ? AND pr.isExited = false ORDER BY pr.entryTime DESC LIMIT 1";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, carId);
            @Cleanup ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                ParkingVO vo = ParkingVO.builder()
                        .recordId(rs.getInt("recordId"))
                        .carNumber(rs.getString("carNumber"))
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




}
