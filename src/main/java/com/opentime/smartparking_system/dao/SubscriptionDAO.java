package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.model.vo.SubscriptionVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SubscriptionDAO {
    public boolean insertSubscription(SubscriptionVO subscriptionVO) {
        String SQL = "INSERT INTO subscription(memberId, fee, startDate, endDate, status, subscriptionType) VALUES (?,?,?,?,?,?)";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, subscriptionVO.getUserId());
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

    public boolean deleteSubscription(int memberId){
        String SQL = "DELETE FROM subscription WHERE memberId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, memberId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateSubscription(SubscriptionVO subscriptionVO){
        String SQL = "UPDATE subscription SET fee = ? , startDate = ?, endDate = ?, subscriptionType=? WHERE memberId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, subscriptionVO.getFee());
            preparedStatement.setDate(2, subscriptionVO.getStartDate());
            preparedStatement.setDate(3, subscriptionVO.getEndDate());
            preparedStatement.setString(4, subscriptionVO.getType().name());
            preparedStatement.setInt(5, subscriptionVO.getUserId());
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
