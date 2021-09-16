package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkPlace {

	private String code;
	private String name;
	private String type;
	private String regNum; //사업자등록번호
	private String repName; //대표자명
	private String businessType;
	private String businessCategory;
	private String address;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deletedDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date madeDate;

}
