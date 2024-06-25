package com.himedia.zoo.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MypageVO {
    private String userid;
    private String nickname;
    private String pwd;
    private String name;
    private String phone;
    private String email;
    private Timestamp createdate;
    private String image;
    private String saveimage;
    private String petname;
}
