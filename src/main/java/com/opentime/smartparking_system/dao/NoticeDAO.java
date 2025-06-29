package com.opentime.smartparking_system.dao;

import com.opentime.smartparking_system.model.vo.NoticeVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {

    public boolean insertNotice(NoticeVO noticeVO) {
        String SQL = "INSERT INTO notice(title, content, writer) VALUES (?,?,?)";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, noticeVO.getTitle());
            preparedStatement.setString(2, noticeVO.getContent());
            preparedStatement.setString(3, noticeVO.getWriter());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<NoticeVO> getListNotice(int offset, int limit) {
        String SQL = "SELECT * FROM notice ORDER BY isPinned DESC, createdAt DESC LIMIT ?,?";
        List<NoticeVO> noticeVOList = new ArrayList<>();
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
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
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
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


    public boolean updateNotice(NoticeVO noticeVO) {
        String SQL = "UPDATE notice SET  title = ?, content = ? WHERE noticeId=?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, noticeVO.getTitle());
            preparedStatement.setString(2, noticeVO.getContent());
            preparedStatement.setLong(3, noticeVO.getNoticeId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteNotice(int noticeId) {
        String SQL = "DELETE FROM notice WHERE noticeId = ?";
        try {
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, noticeId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getNoticeCount() {
        String SQL = "SELECT COUNT(*) FROM notice";
        try{
            @Cleanup Connection connection = ConnectionUtill.INSTANCE.getConnection();
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

}
