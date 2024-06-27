package com.himedia.zoo.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaDto {
    private Integer qseq;
    private String subject;
    private String content;
    private String reply;
    private String userid;
    private Integer category;
    private Timestamp Createdate;

}
