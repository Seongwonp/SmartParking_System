package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserSubscriptionDTO {
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
