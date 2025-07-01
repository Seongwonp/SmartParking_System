package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.model.vo.UserSubscriptionVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_subscription {


    // 정기권 삭제
    public void deleteSubscription(int subscriptionId) {
        String sql = "DELETE FROM subscription WHERE subscriptionId = ?";
        try {
            @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, subscriptionId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 통합 검색 리스트
    public List<UserSubscriptionVO> getSubscriptions(String type, String status, Boolean expiredOnly) {
        StringBuilder sql = new StringBuilder(
                "SELECT u.userId, u.userName, u.name, u.phone, u.role, u.joinDate, " +
                        "c.carId, c.carNumber, c.carType, c.carModel, " +
                        "s.subscriptionId, s.fee, s.startDate, s.endDate, s.status, s.subscriptionType " +
                        "FROM user u " +
                        "JOIN car c ON u.userId = c.userId " +
                        "JOIN subscription s ON c.carId = s.carId " +
                        "WHERE 1=1 "
        );

        List<Object> params = new ArrayList<>();

        if (type != null && !type.isEmpty()) {
            sql.append("AND s.subscriptionType = ? ");
            params.add(type);
        }

        if (status != null && !status.isEmpty()) {
            sql.append("AND s.status = ? ");
            params.add(status);
        }

        if (expiredOnly != null) {
            if (expiredOnly) {
                sql.append("AND s.status = 'active' AND s.endDate < CURRENT_DATE ");
            } else {
                sql.append("AND s.status = 'active' AND s.endDate >= CURRENT_DATE ");
            }
        }

        List<UserSubscriptionVO> list = new ArrayList<>();

        try {
            @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            @Cleanup ResultSet rs = pstmt.executeQuery();

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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }


}
