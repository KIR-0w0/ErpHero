package com.erphero.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
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
	private long amount; //계획수량
	
	private Date startDate;
	private Date endDate; 
	private String empWorkPlaceCode;
	private String deptCode;
	
	private Date targetDate;
	private String productCode; //상품코드
	private String productName;
	private String productStockUnit;
	private Date cpDeliveryDate;
	private Date cpShipDate;
	private long cpContractAmount;
	private String venderName;
	
	public Planning() {
	}
	
	public Planning(String code, String contractCode, Date targetDate, String productCode, long amount) {
	}

	
	
}
