package com.opentime.smartparking_system.model.vo;

import lombok.*;

import java.sql.Timestamp;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ParkingVO {
    private int recordId;
    private int carId;
    private String carNumber;
    private Timestamp entryTime;
    private Timestamp exitTime;
    private int fee;
    private boolean isExisted;
    private String carType;
    private String subscriptionType;
}
