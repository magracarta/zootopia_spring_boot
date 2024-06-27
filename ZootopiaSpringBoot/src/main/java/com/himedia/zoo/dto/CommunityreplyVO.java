package com.himedia.zoo.dto;


import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommunityreplyVO {

    @NotEmpty
    @NotNull
    private String userid;

    private int gseq;

    private int grseq;

    @NotEmpty
    @NotNull
    private String content;

    private Timestamp createdate;

    private String nickname;

    private String saveImage;

}
