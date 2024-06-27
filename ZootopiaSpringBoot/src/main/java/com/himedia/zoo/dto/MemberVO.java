package com.himedia.zoo.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;
@Data
public class MemberVO {

    @NotBlank(message = "아이디는 필수 입력사항입니다")
    private String userid;
    @NotBlank(message = "닉네임는은필수 입력사항입니다")
    private String nickname;
    @NotBlank(message = "비밀번호는 필수 입력사항입니다")
    private String pwd;
    @NotBlank(message = "이름은 필수 입력사항입니다")
    private String name;
    @NotBlank(message = "전화번호는 필수 입력사항입니다")
    private String phone;
    @NotBlank(message = "이메일은 필수 입력사항입니다")
    private String email;
    private Timestamp createdate;
    private String image;
    private String saveimage;
    private String kind;
    private String zip_num;
    private String address1;
    private String address2;
    private String address3;
    private String useyn;
    private String petname;
    private String petgender;
}
