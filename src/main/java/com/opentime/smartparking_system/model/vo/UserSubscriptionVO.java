package com.opentime.smartparking_system.model.vo;

import lombok.*;

import java.sql.Date;
import java.sql.Timestamp;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserSubscriptionVO {
    // user
    private int userId;
    private String userName;
    private String name;
    private String phone;
    private String role;
    private Timestamp joinDate;

    // car
    private int carId;
    private String carNumber; 
    private String carType;
    private String carModel;

    // subscription
    private int subscriptionId;
    private int fee;
    private Date startDate;
    private Date endDate;
    private String status;
    private String subscriptionType;
}