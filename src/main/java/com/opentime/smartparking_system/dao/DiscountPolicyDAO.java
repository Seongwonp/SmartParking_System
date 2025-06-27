package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.model.vo.DiscountPolicyVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiscountPolicyDAO {

    public boolean insertDiscount(DiscountPolicyVO discountPolicyVO) {
        String SQL = "INSERT INTO discountPolicy(type, description, rate) VALUES (?, ?, ?)";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, discountPolicyVO.getType());
            preparedStatement.setString(2, discountPolicyVO.getDescription());
            preparedStatement.setInt(3, discountPolicyVO.getRate());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<DiscountPolicyVO> selectAllDiscounts() {
        String SQL = "SELECT * FROM discountPolicy";
        List<DiscountPolicyVO> discountList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DiscountPolicyVO discountPolicyVO = DiscountPolicyVO.builder()
                        .discountId(resultSet.getInt("discountId"))
                        .type(resultSet.getString("type"))
                        .description(resultSet.getString("description"))
                        .rate(resultSet.getInt("rate"))
                        .build();
                discountList.add(discountPolicyVO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return discountList;
    }

    public DiscountPolicyVO selectDiscountById(int id) {
        String SQL = "SELECT * FROM discountPolicy WHERE discountId = ?";
        DiscountPolicyVO discount = null;
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, id);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                discount = DiscountPolicyVO.builder()
                        .discountId(resultSet.getInt("discountId"))
                        .type(resultSet.getString("type"))
                        .description(resultSet.getString("description"))
                        .rate(resultSet.getInt("rate"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return discount;
    }

    public boolean updateDiscount(DiscountPolicyVO discountPolicyVO) {
        String SQL = "UPDATE discountPolicy SET type = ?, description = ?, rate = ? WHERE discountId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, discountPolicyVO.getType());
            preparedStatement.setString(2, discountPolicyVO.getDescription());
            preparedStatement.setInt(3, discountPolicyVO.getRate());
            preparedStatement.setInt(4, discountPolicyVO.getDiscountId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteDiscountById(int id) {
        String SQL = "DELETE FROM discountPolicy WHERE discountId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}