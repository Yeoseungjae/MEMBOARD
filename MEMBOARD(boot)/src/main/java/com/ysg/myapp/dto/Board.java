package com.ysg.myapp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {

	private int BNo;
	private String BWriter;
	private String BTitle;
	private String BContent;
	private Date BDate;
	private int BHit;
	private MultipartFile BFile;
	private String BFileName;
}
