package com.opentime.smartparking_system.dao;


import com.opentime.smartparking_system.model.vo.UserVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {


    // 회원가입 - 신규 사용자 추가
    public boolean insertUser(UserVO user) {
        String sql = "INSERT INTO user (userName, password, name, phone,joinDate) VALUES (?, ?, ?, ?, NOW())";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getName());
            preparedStatement.setString(4, user.getPhone());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // 로그인 시
    public UserVO findByUserName(String userName) {
        String sql = "SELECT * FROM user WHERE userName = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return UserVO.builder()
                        .userId(resultSet.getInt("userId"))
                        .userName(resultSet.getString("userName"))
                        .password(resultSet.getString("password"))
                        .name(resultSet.getString("name"))
                        .phone(resultSet.getString("phone"))
                        .role(resultSet.getString("role"))
                        .isSubscription(resultSet.getBoolean("isSubscription"))
                        .subscriptionStart(resultSet.getDate("subscriptionStart"))
                        .subscriptionEnd(resultSet.getDate("subscriptionEnd"))
                        .joinDate(resultSet.getTimestamp("joinDate"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    // 중복검사
    public boolean isUserIdDuplicate(String userName) {
        String sql = "SELECT COUNT(*) FROM user WHERE userName = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }



    // 회원 정보 수정
    public boolean updateUser(UserVO userVO) {
        String sql = "UPDATE user SET userName= ?, password = ?, name = ?, phone = ? WHERE userId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userVO.getUserName());
            preparedStatement.setString(2, userVO.getPassword());
            preparedStatement.setString(3, userVO.getName());
            preparedStatement.setString(4, userVO.getPhone());
            preparedStatement.setInt(5, userVO.getUserId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    // 회원 탈퇴
    public boolean deleteUser(String userName) {
        String sql = "DELETE FROM user WHERE userName = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
