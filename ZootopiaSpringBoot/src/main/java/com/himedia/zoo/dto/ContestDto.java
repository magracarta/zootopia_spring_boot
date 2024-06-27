package com.himedia.zoo.dto;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.sql.Timestamp;
import java.util.ArrayList;

@Data
public class ContestDto {
    private int cseq;
    private String userid;
    @NotNull(message = "제목을 작성해주세요.")
    @NotEmpty(message = "제목을 작성해주세요.")
    private String subject;

    @NotNull(message = "내용을 작성해주세요.")
    @NotEmpty(message = "내용을 작성해주세요.")
    private String content;

    @NotNull(message = "마감일을 작성해주세요.")
    @NotEmpty(message = "마감일을 작성해주세요.")
    private Timestamp createdate;
    private Timestamp lastdate;
    private int cnt;
    private String useyn;
    private int pcnt;
    private int allpcnt;
    private String nickname;
    private ArrayList<ContestPetDTO> cpdList = null;
    private long plusdays;

}
