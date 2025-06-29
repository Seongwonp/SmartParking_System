package com.opentime.smartparking_system.model.vo;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FeePolicyVO {
    private int policyId;
    private String policyName;
    private int baseTime;
    private int baseFee;
    private int additionalTime;
    private int additionalFee;
    private int dailyMaxFee;
}
