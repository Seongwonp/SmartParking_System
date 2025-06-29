package com.opentime.smartparking_system.model.vo;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    private int userId;
    private String userName;
    private String password;
    private String name;
    private String phone;
    private String role;
    private boolean isSubscription;
    private Date subscriptionStart;
    private Date subscriptionEnd;
    private Timestamp joinDate;
}
