package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
    private int noticeId;
    private String title;
    private String content;
    private String writer;
    private int view;
    private String createdAt;
    private String updatedAt;
    private boolean pinned;
}
