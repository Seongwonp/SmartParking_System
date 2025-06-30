package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.util.ConnectionUtil;
import com.opentime.smartparking_system.model.vo.UserVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_user {

    /*----------------------  회원 관리 ------------------------------ */
    // 총 회원수
    public int getTotalMemberCount() {
        String SQL = "SELECT COUNT(*) FROM user";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    // 월정액 회원수
    public int getSubscriptionMemberCount() {
        String SQL = "SELECT COUNT(*) FROM user WHERE isSubscription = TRUE";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }


    // 최근 가입 회원 5명 조회
    public List<UserVO> getRecentMembers() {
        String SQL = "SELECT userId, userName, name, phone, role, isSubscription, subscriptionStart, subscriptionEnd, joinDate FROM user ORDER BY joinDate DESC LIMIT 5";
        List<UserVO> list = new ArrayList<>();

        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                UserVO user = UserVO.builder()
                        .userId(resultSet.getInt("userId"))
                        .userName(resultSet.getString("userName"))
                        .name(resultSet.getString("name"))
                        .phone(resultSet.getString("phone"))
                        .role(resultSet.getString("role"))
                        .isSubscription(resultSet.getBoolean("isSubscription"))
                        .subscriptionStart(resultSet.getDate("subscriptionStart"))
                        .subscriptionEnd(resultSet.getDate("subscriptionEnd"))
                        .joinDate(resultSet.getTimestamp("joinDate"))
                        .build();
                list.add(user);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }


    // 관리자 목록
    public List<UserVO> getAdminList() {
        String SQL = "SELECT userId, userName, name, phone, role, isSubscription, subscriptionStart, subscriptionEnd, joinDate FROM user WHERE role = 'ADMIN' ORDER BY joinDate";
        List<UserVO> list = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                UserVO user = UserVO.builder()
                        .userId(resultSet.getInt("userId"))
                        .userName(resultSet.getString("userName"))
                        .name(resultSet.getString("name"))
                        .phone(resultSet.getString("phone"))
                        .role(resultSet.getString("role"))
                        .isSubscription(resultSet.getBoolean("isSubscription"))
                        .subscriptionStart(resultSet.getDate("subscriptionStart"))
                        .subscriptionEnd(resultSet.getDate("subscriptionEnd"))
                        .joinDate(resultSet.getTimestamp("joinDate"))
                        .build();
                list.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;
    }


    public List<UserVO> searchAdmin(String keyword) {
        String SQL = "SELECT userId, userName, name, phone, role, isSubscription, subscriptionStart, subscriptionEnd, joinDate FROM user " +
                "WHERE role = 'ADMIN' AND (userName LIKE ? OR name LIKE ?) ORDER BY joinDate";
        List<UserVO> list = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, "%" + keyword + "%");
            preparedStatement.setString(2, "%" + keyword + "%");
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                UserVO user = UserVO.builder()
                        .userId(resultSet.getInt("userId"))
                        .userName(resultSet.getString("userName"))
                        .name(resultSet.getString("name"))
                        .phone(resultSet.getString("phone"))
                        .role(resultSet.getString("role"))
                        .isSubscription(resultSet.getBoolean("isSubscription"))
                        .subscriptionStart(resultSet.getDate("subscriptionStart"))
                        .subscriptionEnd(resultSet.getDate("subscriptionEnd"))
                        .joinDate(resultSet.getTimestamp("joinDate"))
                        .build();
                list.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return list;

    }


    // 관리자 가져오기 ( 회원정보 수정시에 사용)
    public UserVO getUserById(int userId) {
        String SQL = "SELECT * FROM user WHERE userId = ? AND role = 'ADMIN'";
        UserVO user = null;
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, userId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = UserVO.builder()
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
        return user;
    }


    // 관리자 추가
    public boolean insertAdmin(UserVO userVO) {
        String SQL = "INSERT INTO user (userName, password, name, phone, role) " +
                "VALUES (?, ?, ?, ?, 'ADMIN')";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userVO.getUserName());
            preparedStatement.setString(2, userVO.getPassword());
            preparedStatement.setString(3, userVO.getName());
            preparedStatement.setString(4, userVO.getPhone());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 관리자 삭제
    public boolean deleteAdmin(int userId) {
        String SQL = "DELETE FROM user WHERE userId = ? AND role = 'ADMIN'";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, userId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 관리자 정보 수정
    public boolean updateAdmin(UserVO userVO) {
        String SQL = "UPDATE user SET userName = ?, password = ?, name = ?, phone = ? WHERE userId = ? AND role = 'ADMIN'";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
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

    // 중복검사
    public boolean isUserIdDuplicate(String userName) {
        String sql = "SELECT COUNT(*) FROM user WHERE userName = ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
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


}
