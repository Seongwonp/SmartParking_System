package com.opentime.smartparking_system.model.vo;

import com.opentime.smartparking_system.util.SubscriptionStatus;
import com.opentime.smartparking_system.util.SubscriptionType;
import lombok.*;

import java.sql.Date;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SubscriptionVO {
    private int subscriptionId;
    private int carId;
    private int fee;
    private Date startDate;
    private Date endDate;
    private SubscriptionStatus status; // Enum 객체 (구독 상태)
    private SubscriptionType type; // Enum 객체 (구독 타입)
}