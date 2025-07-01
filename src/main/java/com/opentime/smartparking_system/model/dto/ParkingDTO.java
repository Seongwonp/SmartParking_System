package com.opentime.smartparking_system.model.dto;

import lombok.*;
import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ParkingDTO {
    private int recordId;
    private int carId;
    private String carNumber;
    private Timestamp entryTime;
    private Timestamp exitTime;
    private int fee;
    private boolean isExisted;
}