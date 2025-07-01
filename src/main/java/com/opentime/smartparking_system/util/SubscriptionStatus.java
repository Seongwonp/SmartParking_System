package com.opentime.smartparking_system.util;

public enum SubscriptionStatus {
    active,
    inactive,
    paused,
    cancelled;

    public static boolean isValidStatus(String status) {
        try {
            SubscriptionStatus.valueOf(status);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
}
