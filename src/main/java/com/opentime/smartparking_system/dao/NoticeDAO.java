package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.model.vo.NoticeVO;
import com.opentime.smartparking_system.util.ConnectionUtil;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {

    public List<NoticeVO> getListNotice(int offset, int limit) {
        String SQL = "SELECT * FROM notice ORDER BY isPinned DESC, createdAt DESC LIMIT ?,?";
        List<NoticeVO> noticeVOList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, offset);
            preparedStatement.setInt(2, limit);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                NoticeVO noticeVO = NoticeVO.builder()
                        .noticeId(resultSet.getInt("noticeId"))
                        .title(resultSet.getString("title"))
                        .writer(resultSet.getString("writer"))
                        .content(resultSet.getString("content"))
                        .view(resultSet.getInt("view"))
                        .createdAt(resultSet.getString("createdAt"))
                        .updatedAt(resultSet.getString("updatedAt"))
                        .pinned(resultSet.getBoolean("isPinned"))
                        .build();
                noticeVOList.add(noticeVO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return noticeVOList;
    }

    public NoticeVO getNoticeById(int noticeId) {
        String SQL = "SELECT * FROM notice WHERE noticeId = ?";
        NoticeVO noticeVO = null;
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, noticeId);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                noticeVO = NoticeVO.builder()
                        .noticeId(resultSet.getInt("noticeId"))
                        .title(resultSet.getString("title"))
                        .writer(resultSet.getString("writer"))
                        .content(resultSet.getString("content"))
                        .view(resultSet.getInt("view"))
                        .createdAt(resultSet.getString("createdAt"))
                        .updatedAt(resultSet.getString("updatedAt"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return noticeVO;
    }


    public List<NoticeVO> searchNotice(int offset, int limit, String text) {
        String SQL = "SELECT * FROM notice WHERE title LIKE ? ORDER BY isPinned DESC, createdAt DESC LIMIT ?, ?";
        List<NoticeVO> noticeVOList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, "%" + text + "%");
            preparedStatement.setInt(2, offset);
            preparedStatement.setInt(3, limit);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                NoticeVO noticeVO = NoticeVO.builder()
                        .noticeId(resultSet.getInt("noticeId"))
                        .title(resultSet.getString("title"))
                        .writer(resultSet.getString("writer"))
                        .content(resultSet.getString("content"))
                        .view(resultSet.getInt("view"))
                        .createdAt(resultSet.getString("createdAt"))
                        .updatedAt(resultSet.getString("updatedAt"))
                        .pinned(resultSet.getBoolean("isPinned"))
                        .build();
                noticeVOList.add(noticeVO);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return noticeVOList;
    }

    public int getNoticeCount() {
        String SQL = "SELECT COUNT(*) FROM notice";
        try{
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int getSearchNoticeCount(String text) {
        String SQL = "SELECT COUNT(*) FROM notice WHERE title LIKE ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, "%" + text + "%");
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }


    public void addView(int noticeId) {
        String SQL = "UPDATE notice SET view = view + 1 WHERE noticeId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, noticeId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
