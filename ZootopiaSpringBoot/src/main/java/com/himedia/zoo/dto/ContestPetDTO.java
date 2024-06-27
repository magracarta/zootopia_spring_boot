package com.himedia.zoo.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ContestPetDTO {
    private int cpseq;

    @NotNull(message = "내용을 작성해주세요.")
    @NotEmpty(message = "내용을 작성해주세요.")
    private String content;
    private String userid;
    private String nickname;
    private int cseq;
    private int recommends;
    private String image;

    @NotNull(message = "이미지를 넣어주세요.")
    @NotEmpty(message = "이미지를 넣어주세요.")
    private String saveimage;
    private String petname;
    private String petgender;
    private String kind;
    private String password;
}
