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
    private Timestamp entryTime;
    private Timestamp exitTime;
    private int fee;
    private boolean isExisted;
}