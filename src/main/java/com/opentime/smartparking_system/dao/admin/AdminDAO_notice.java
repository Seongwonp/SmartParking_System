package com.opentime.smartparking_system.dao.admin;

import com.opentime.smartparking_system.util.ConnectionUtil;
import com.opentime.smartparking_system.model.vo.NoticeVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO_notice {
    public boolean insertNotice(NoticeVO noticeVO) {
        String SQL = "INSERT INTO notice(title, content, writer) VALUES (?,?,?)";
        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, noticeVO.getTitle());
            preparedStatement.setString(2, noticeVO.getContent());
            preparedStatement.setString(3, noticeVO.getWriter());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<NoticeVO> getListNotice(String keyword) {
        String SQL = "SELECT * FROM notice";
        List<NoticeVO> noticeVOList = new ArrayList<>();

        // 검색 조건
        if (keyword != null && !keyword.trim().isEmpty()) {
            SQL += " WHERE title LIKE ? OR writer LIKE ?";
        }
        SQL += " ORDER BY isPinned DESC, createdAt DESC";

        try {
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement pstmt = connection.prepareStatement(SQL);

            if (keyword != null && !keyword.trim().isEmpty()) {
                String search = "%" + keyword.trim() + "%";
                pstmt.setString(1, search);
                pstmt.setString(2, search);
            }

            @Cleanup ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                NoticeVO noticeVO = NoticeVO.builder()
                        .noticeId(rs.getInt("noticeId"))
                        .title(rs.getString("title"))
                        .writer(rs.getString("writer"))
                        .content(rs.getString("content"))
                        .view(rs.getInt("view"))
                        .createdAt(rs.getString("createdAt"))
                        .updatedAt(rs.getString("updatedAt"))
                        .pinned(rs.getBoolean("isPinned"))
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
                        .pinned(resultSet.getBoolean("isPinned"))
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
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
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
            @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, noticeId);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
