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
public class Charge {

	private String code; //청구코드
	private String empCode; 
	private String productCode; //품번
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date; //청구일자
	private String procureType; //청구구분
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date requiredDate; //소요일자(요청일)
	
	private List<ChargeProduct> chargeProducts;
	private String empName; 
	private long requiredOrdersAmount; //소요수량(소요량전개의 예정수량)
	private String productName; //품명
	private String productStockUnit; //재고단위
	private String status;
	private String saveStatus; //저장상태 (청구부터 신규)
	private String writerName; //청구자
	

}
