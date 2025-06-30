package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.dao.ConnectionUtill;
import com.opentime.smartparking_system.model.vo.DiscountPolicyVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_discount {

    // 회원 정책 추가
    public boolean insertDiscount(DiscountPolicyVO discountPolicyVO) {
        String SQL = "INSERT INTO discountPolicy(type, description, rate) VALUES(?,?,?)";
        try{
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, discountPolicyVO.getType());
            preparedStatement.setString(2, discountPolicyVO.getDescription());
            preparedStatement.setDouble(3, discountPolicyVO.getRate());
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    // 할인 정책 삭제
    public boolean deleteDiscount(int discountId) {
        String SQL = "DELETE FROM discountPolicy WHERE discountId = ?";
        try{
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, discountId);
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }




    // 모든 할인정책 조회
    public List<DiscountPolicyVO> selectAllDiscount() {
        String SQL = "SELECT * FROM discountPolicy";
        List<DiscountPolicyVO> discountList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                DiscountPolicyVO vo = DiscountPolicyVO.builder()
                        .discountId(resultSet.getInt("discountId"))
                        .type(resultSet.getString("type"))
                        .description(resultSet.getString("description"))
                        .rate(resultSet.getInt("rate"))
                        .build();
                discountList.add(vo);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return discountList;
    }

    // 할인정책 ID로 단건 조회
    public DiscountPolicyVO selectDiscountById(int discountId) {
        String SQL = "SELECT * FROM discountPolicy WHERE discountId = ?";
        DiscountPolicyVO vo = null;
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, discountId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                vo = DiscountPolicyVO.builder()
                        .discountId(resultSet.getInt("discountId"))
                        .type(resultSet.getString("type"))
                        .description(resultSet.getString("description"))
                        .rate(resultSet.getInt("rate"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vo;
    }

    // 할인정책 수정
    public boolean updateDiscount(DiscountPolicyVO vo) {
        String SQL = "UPDATE discountPolicy SET type = ?, description = ?, rate = ? WHERE discountId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, vo.getType());
            preparedStatement.setString(2, vo.getDescription());
            preparedStatement.setInt(3, vo.getRate());
            preparedStatement.setInt(4, vo.getDiscountId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}