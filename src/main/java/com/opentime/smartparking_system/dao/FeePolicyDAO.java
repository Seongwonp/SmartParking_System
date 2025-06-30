package com.opentime.smartparking_system.dao;


import com.opentime.smartparking_system.model.vo.FeePolicyVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FeePolicyDAO {

    public boolean insertFee(FeePolicyVO feePolicyVO) {
        String SQL = "INSERT INTO feePolicy(policyName, baseTime, baseFee, additionalTime, additionalFee, dailyMaxFee)" +
                " VALUES (?,?,?,?,?,?)";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, feePolicyVO.getPolicyName());
            preparedStatement.setLong(2, feePolicyVO.getBaseTime());
            preparedStatement.setLong(3, feePolicyVO.getBaseFee());
            preparedStatement.setLong(4, feePolicyVO.getAdditionalTime());
            preparedStatement.setLong(5, feePolicyVO.getAdditionalFee());
            preparedStatement.setLong(6, feePolicyVO.getDailyMaxFee());
            return preparedStatement.executeUpdate() > 0;
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }


    public List<FeePolicyVO> selectAllFee() {
        String SQL = "SELECT * FROM feePolicy";
        List<FeePolicyVO> feeList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
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


    public FeePolicyVO selectFeeById(int id) {
        String SQL = "SELECT * FROM feePolicy WHERE policyId = ?";
        FeePolicyVO fee = null;
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, id);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                fee = FeePolicyVO.builder()
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
        return fee;
    }
    public boolean updateFee(FeePolicyVO feePolicyVO) {
        String SQL = "UPDATE feePolicy SET baseTime = ? , baseFee = ?, additionalTime = ?, " +
                "additionalFee = ?, dailyMaxFee = ? WHERE policyId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, feePolicyVO.getBaseTime());
            preparedStatement.setInt(2, feePolicyVO.getBaseFee());
            preparedStatement.setInt(3, feePolicyVO.getAdditionalTime());
            preparedStatement.setInt(4, feePolicyVO.getAdditionalFee());
            preparedStatement.setInt(5, feePolicyVO.getDailyMaxFee());
            preparedStatement.setInt(6, feePolicyVO.getPolicyId());
            return preparedStatement.executeUpdate() > 0;
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public boolean deleteFeeById(int id) {
        String SQL = "DELETE FROM feePolicy WHERE policyId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

}
