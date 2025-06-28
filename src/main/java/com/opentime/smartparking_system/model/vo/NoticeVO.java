package com.opentime.smartparking_system.model.vo;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
    private int noticeId;
    private String title;
    private String content;
    private String writer;
    private int view;
    private String createdAt;
    private String updatedAt;
}
