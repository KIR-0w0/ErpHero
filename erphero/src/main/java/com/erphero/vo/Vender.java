package com.erphero.vo;

import java.util.Date;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data
public class Vender {

	private String name;
	private String code;
	private String repName;
	private String regNum;
	private String businessType;
	private String businessCategory;
	private String locationNo; //지역번호
	private String locationName; //시도명
	private String address;
	private String email;
	private String phone;
	private String type;
	private String grade;
	private String status;

	private Date tradingStartDate;
	private Date tradingEndDate;

}
