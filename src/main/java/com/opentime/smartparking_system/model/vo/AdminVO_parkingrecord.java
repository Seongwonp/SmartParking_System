package com.opentime.smartparking_system.model.vo;

import lombok.*;

import java.sql.Timestamp;

@Getter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO_parkingrecord {

    //parking
    private int recordId;
    private Timestamp entryTime;
    private Timestamp exitTime;
    private int fee;
    private boolean isExited;

    // car
    private int carId;
    private String carNumber;
    private String carModel;
    private String carType;

    //user
    private int userId;
    private String name;
}
