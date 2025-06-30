package com.opentime.smartparking_system.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private int userId; //일년번호
    private String userName; //아이디
    private String password;
    private String name; //이름
    private String phone;
    private String role;
    private boolean isSubscription;
    private Date subscriptionStart;
    private Date subscriptionEnd;
    private Timestamp joinDate;

}
