package com.himedia.zoo.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberVO {
    @NotNull(message = "id를 입력하세요")
    @NotEmpty(message = "id를 입력하세요")
    private String userid;
    @NotNull(message = "닉네임을 입력하세요")
    @NotEmpty(message = "닉네임을 입력하세요")
    private String nickname;
    @NotNull(message = "비밀번호를 입력하세요")
    @NotEmpty(message = "비밀번호를 입력하세요")
    private String pwd;
    @NotNull(message = "이름을 입력하세요")
    @NotEmpty(message = "이름을 입력하세요")
    private String name;
    @NotNull(message = "전화번호를 입력하세요")
    @NotEmpty(message = "전화번호를 입력하세요")
    private String phone;
    @NotNull(message = "이메일을 입력하세요")
    @NotEmpty(message = "이메일을 입력하세요")
    private String email;
    private Timestamp createdate;
    private String image;
    private String saveimage;
    private String kind;
    @NotNull
    private String useyn;
    private String petname;
    private String petgender;
}
