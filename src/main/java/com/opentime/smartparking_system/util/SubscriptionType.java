package com.opentime.smartparking_system.util;

public enum SubscriptionType {
    annual,
    monthly;



    public static boolean isValidType(String type) {
        try {
            SubscriptionType.valueOf(type);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
}
