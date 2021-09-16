package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Planning {
	//dto 가 되겠는걸?? 모든 vo가...
	private String code;
	private String contractCode;
	private String empCode;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date endDate; 
	private String empWorkPlaceCode;
	private String deptCode;
	
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date targetDate; //계획일
	private String productCode; //상품코드
	private String productName;
	private String productStockUnit;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date cpShipDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date cpDeliveryDate;
	private long cpContractAmount; //계획수량
	private String venderName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date madeDate;
	private long contractProductNo;
	
	public Planning() {
	}

	
}
