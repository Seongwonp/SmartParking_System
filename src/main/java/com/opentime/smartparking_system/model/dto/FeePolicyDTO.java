package com.opentime.smartparking_system.model.dto;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FeePolicyDTO {
    private int policyId;
    private String policyName;
    private int baseTime;
    private int baseFee;
    private int additionalTime;
    private int additionalFee;
    private int dailyMaxFee;
}