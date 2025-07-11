package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.model.vo.UserSubscriptionVO;
import com.opentime.smartparking_system.util.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lombok.Cleanup;

public class AdminDAO_userSubscription {
    public List<UserSubscriptionVO> getUserSubscriptionsByUserId(int userId) {
        String SQL = "SELECT u.userId, u.userName, u.name, u.phone, u.role, u.joinDate, " +
                "c.carId, c.carNumber, c.carType, c.carModel, " +
                "s.subscriptionId, s.fee, s.startDate, s.endDate, s.status, s.subscriptionType " +
                "FROM user u " +
                "JOIN car c ON u.userId = c.userId " +
                "JOIN subscription s ON c.carId = s.carId " +
                "WHERE u.isSubscription = 1 AND u.userId = ? " +
                "ORDER BY u.joinDate DESC";

        List<UserSubscriptionVO> list = new ArrayList<>();

        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);
            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    UserSubscriptionVO vo = UserSubscriptionVO.builder()
                            .userId(rs.getInt("userId"))
                            .userName(rs.getString("userName"))
                            .name(rs.getString("name"))
                            .phone(rs.getString("phone"))
                            .role(rs.getString("role"))
                            .joinDate(rs.getTimestamp("joinDate"))
                            .carId(rs.getInt("carId"))
                            .carNumber(rs.getString("carNumber"))
                            .carType(rs.getString("carType"))
                            .carModel(rs.getString("carModel"))
                            .subscriptionId(rs.getInt("subscriptionId"))
                            .fee(rs.getInt("fee"))
                            .startDate(rs.getDate("startDate"))
                            .endDate(rs.getDate("endDate"))
                            .status(rs.getString("status"))
                            .subscriptionType(rs.getString("subscriptionType"))
                            .build();
                    list.add(vo);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }
}
