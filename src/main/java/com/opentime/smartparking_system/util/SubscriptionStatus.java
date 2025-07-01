package com.opentime.smartparking_system.util;

import lombok.Getter;

@Getter
public enum SubscriptionStatus {
    active("사용중"),
    inactive("만료됨"),
    paused("일시중지"),
    cancelled("해지됨");

    private final String label;

    SubscriptionStatus(String label) {
        this.label = label;
    }

    public static boolean isValidStatus(String status) {
        try {
            SubscriptionStatus.valueOf(status);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    @Override
    public String toString() {
        return name();
    }
}