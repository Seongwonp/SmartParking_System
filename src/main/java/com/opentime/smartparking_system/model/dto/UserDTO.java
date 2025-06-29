package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
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
