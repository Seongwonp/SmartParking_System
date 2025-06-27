package com.opentime.smartparking_system.model.vo;

import lombok.*;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DiscountPolicyVO {
    private int discountId;
    private String type;
    private String description;
    private int rate;
}
