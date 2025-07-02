package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminDTO_parkingrecord {
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
