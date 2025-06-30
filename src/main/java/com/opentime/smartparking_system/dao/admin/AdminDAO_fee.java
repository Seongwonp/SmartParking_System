package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.dao.ConnectionUtill;
import com.opentime.smartparking_system.model.vo.FeePolicyVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_fee {

    public List<FeePolicyVO> selectAllFee() {
        String SQL = "SELECT * FROM feePolicy";
        List<FeePolicyVO> feeList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                FeePolicyVO feePolicyVO = FeePolicyVO.builder()
                        .policyId(resultSet.getInt("policyId"))
                        .policyName(resultSet.getString("policyName"))
                        .baseTime(resultSet.getInt("baseTime"))
                        .baseFee(resultSet.getInt("baseFee"))
                        .additionalTime(resultSet.getInt("additionalTime"))
                        .additionalFee(resultSet.getInt("additionalFee"))
                        .dailyMaxFee(resultSet.getInt("dailyMaxFee"))
                        .build();
                feeList.add(feePolicyVO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return feeList;
    }

    public FeePolicyVO selectFeePolicyById(int policyId) {
        String SQL = "SELECT * FROM feePolicy WHERE policyId = ?";
        FeePolicyVO feePolicyVO = null;
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, policyId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                feePolicyVO = FeePolicyVO.builder()
                        .policyId(resultSet.getInt("policyId"))
                        .policyName(resultSet.getString("policyName"))
                        .baseTime(resultSet.getInt("baseTime"))
                        .baseFee(resultSet.getInt("baseFee"))
                        .additionalTime(resultSet.getInt("additionalTime"))
                        .additionalFee(resultSet.getInt("additionalFee"))
                        .dailyMaxFee(resultSet.getInt("dailyMaxFee"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return feePolicyVO;
    }


    public boolean updateFeePolicy(FeePolicyVO feePolicyVO) {
        String SQL = "UPDATE feePolicy SET policyName = ?, baseTime = ?, baseFee = ?, " +
                "additionalTime = ?, additionalFee = ?, dailyMaxFee = ? WHERE policyId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, feePolicyVO.getPolicyName());
            preparedStatement.setInt(2, feePolicyVO.getBaseTime());
            preparedStatement.setInt(3, feePolicyVO.getBaseFee());
            preparedStatement.setInt(4, feePolicyVO.getAdditionalTime());
            preparedStatement.setInt(5, feePolicyVO.getAdditionalFee());
            preparedStatement.setInt(6, feePolicyVO.getDailyMaxFee());
            preparedStatement.setInt(7, feePolicyVO.getPolicyId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
