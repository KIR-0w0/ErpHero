package com.erphero.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class OrderProduct {

	private long no; 
	private String orderCode; //발주코드(부모)
	private String productCode; //상품코드
	private String unit; //발주단위
	private long amount; //발주단위수량
	private long quantity; //발주수량
	private String chargeCode; //청구코드
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date inboundDate; //입고예정일
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date deliveryDate; //납기일
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date chargeDate; //청구일자
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date requiredDate; //요청일
	
	private String venderCode;
	
	private String productName; //품명
	
	private long price; //단가
	private long sum; //공급가
	private long requiredOrdersAmount; //예정수량
	private String venderName;
	private String empCode;
	private String empName;
	private String writerName;
	
}
