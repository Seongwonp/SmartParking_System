package com.opentime.smartparking_system.dao;


import com.opentime.smartparking_system.model.vo.SubscriptionVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import com.opentime.smartparking_system.util.SubscriptionStatus;
import com.opentime.smartparking_system.util.SubscriptionType;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SubscriptionDAO {
    public boolean insertSubscription(SubscriptionVO subscriptionVO) {
        String SQL = "INSERT INTO subscription(carId, fee, startDate, endDate, status, subscriptionType) VALUES (?,?,?,?,?,?)";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, subscriptionVO.getCarId());
            preparedStatement.setInt(2, subscriptionVO.getFee());
            preparedStatement.setDate(3, subscriptionVO.getStartDate());
            preparedStatement.setDate(4, subscriptionVO.getEndDate());
            preparedStatement.setString(5, subscriptionVO.getStatus().name());
            preparedStatement.setString(6, subscriptionVO.getType().name());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateSubscription(SubscriptionVO subscriptionVO){
        String SQL = "UPDATE subscription SET fee = ? , startDate = ?, endDate = ?, subscriptionType=? WHERE carId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, subscriptionVO.getFee());
            preparedStatement.setDate(2, subscriptionVO.getStartDate());
            preparedStatement.setDate(3, subscriptionVO.getEndDate());
            preparedStatement.setString(4, subscriptionVO.getType().name());
            preparedStatement.setInt(5, subscriptionVO.getCarId());
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateStatus(int carId, SubscriptionStatus status){
        String SQL = "UPDATE subscription SET status = ? WHERE carId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, status.name());
            preparedStatement.setInt(2, carId);
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public boolean findSubscriptionByCarId(int carId){
        String SQL = "SELECT COUNT(*) FROM subscription WHERE carId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, carId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                return resultSet.getInt(1) > 0;
            }
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public SubscriptionVO getActiveSubscriptionByUserId(int userId) {
        String sql = "SELECT s.*" +
                "FROM subscription s " +
                "JOIN car c ON s.carId = c.carId " +
                "WHERE c.userId = ? AND s.status = 'active'";

        try (Connection conn = ConnectionUtil.INSTANCE.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return SubscriptionVO.builder()
                        .subscriptionId(rs.getInt("subscriptionId"))
                        .carId(rs.getInt("carId"))
                        .fee(rs.getInt("fee"))
                        .startDate(rs.getDate("startDate"))
                        .endDate(rs.getDate("endDate"))
                        .status(SubscriptionStatus.valueOf(rs.getString("status")))
                        .type(SubscriptionType.valueOf(rs.getString("subscriptionType")))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
