package com.opentime.smartparking_system.util;

import org.mindrot.jbcrypt.BCrypt;

// 비밀번호 암호화
public enum PasswordUtil {
    INSTANCE;

    // 평문 비밀번호를 BCrypt 해시로 변환
    public String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // 입력 비밀번호와 해시된 비밀번호 비교
    public boolean verifyPassword(String plainPassword, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            throw new IllegalArgumentException("Invalid hashed password format");
        }
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
