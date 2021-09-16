package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Search {
	//공통 항목 조회
	private String empWorkPlaceCode;
	private String deptCode;
	private String empCode;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate; //"20-03-04"가 아니라-> Timestamp 형식 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String procureType;
	private String productType;
	

}
