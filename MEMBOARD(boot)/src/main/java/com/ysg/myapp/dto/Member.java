package com.ysg.myapp.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {

	private String MId;
	private String MPw;
	private String MName;
	private String MPhone;
	private String MBirth;
	private String MEmail;
	private String MAddr;
	private MultipartFile MProfile;
	private String MProfileName;
	private String addr1;
	private String addr2;
	private String addr3;
}
