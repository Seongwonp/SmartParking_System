package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarDTO {
    private int carId; //차량 고유 번호
    private int userId; //등록 사용자 ID
    private String carNumber; //차량 번호
    private String carModel; //차량 모델
    private String carType; //차량 타입

}
