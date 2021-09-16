package com.erphero.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class InboundProduct {
	
	private long no; 
	private String inboundCode; //입고코드(부모)
	private String orderCode; //발주코드(부모)
	private String productCode; //상품코드
	private String productName; //품명
	private String unit; //입고단위
	private long amount; //입고단위수량
	private long passAmount;//합격수량
	private long failAmount;//불합격수량
	
	private long quantity; //발주수량,발주잔량
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date orderDate; //발주일자
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date inboundDate; //입고예정일
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date deliveryDate; //납기일
	
	private String venderCode;
	private String venderName;
	
	private String empCode;
	private String empName;
	private String managerName;

}
