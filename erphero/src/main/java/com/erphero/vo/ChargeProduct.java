package com.erphero.vo;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChargeProduct {


	private long no; //청구상품번호
	private String chargeCode; //청구코드
	private String productCode; //품번
	private String procureType; //청구구분
	private long amount; //청구단위수량 = 재고단위수량
	private String unit; //청구단위 = 재고단위
	private long productStockUnitAmount; //청구단위수량 = 재고단위수량
	private String productStockUnit; //청구단위 = 재고단위
	private long productStock; //(현)재고수량
	private long productSafeStock; //안전재고량
	
	private String productName; //품명
	private String venderName; //거래처명(주거래처)
	private String venderCode; //거래처코드
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date chargeDate; //청구일자
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date requiredDate; //소요일자(요청일)
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date requiredOrdersDate; //예정발주일
	private long requiredNo; //소요량 전개번호
	private long requiredOrdersAmount; //소요량
	
}
