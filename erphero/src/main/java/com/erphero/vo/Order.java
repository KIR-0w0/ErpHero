package com.erphero.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class Order {

	private String code; //발주코드
	@JsonFormat(pattern="yyyy-MM-dd") 
	private Date date; //발주일자
	private String managerCode; //담당자코드
	private String managerName; //담당자이름
	
	private String venderCode; //거래처코드
	private String venderName; //거래처명(주거래처)
	private String locationNo; //지역코드
	private String stage; //마감구분
	private String empCode; //사원코드
	private String empName; //사원이름
	private List<OrderProduct> orderProducts;
	private String status;
	private String saveStatus; //저장상태(입고때)
}
