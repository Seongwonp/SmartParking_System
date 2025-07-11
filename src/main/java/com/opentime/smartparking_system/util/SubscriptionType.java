package com.opentime.smartparking_system.util;

import lombok.Getter;

@Getter
public enum SubscriptionType {
    annual("연정액"),
    monthly("월정액");

    private final String label;

    SubscriptionType(String label) {
        this.label = label;
    }

}
