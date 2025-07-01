package com.opentime.smartparking_system.model.dto;

import com.opentime.smartparking_system.util.SubscriptionStatus;
import com.opentime.smartparking_system.util.SubscriptionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SubscriptionDTO {
    private int subscriptionId;
    private int userId;
    private int fee;
    private Date startDate;
    private Date endDate;
    private SubscriptionStatus status; // Enum 객체 (구독 상태)
    private SubscriptionType type; // Enum 객체 (구독 타입)
}