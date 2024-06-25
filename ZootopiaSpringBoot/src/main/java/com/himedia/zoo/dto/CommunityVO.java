package com.himedia.zoo.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommunityVO {
    int gseq;

    int vcount;

    String userid;

    @NotNull
    @NotEmpty
    String subject;

    @NotNull @NotEmpty
    String content;

    int recommands;

    int kind;

    Timestamp createdate;
}
