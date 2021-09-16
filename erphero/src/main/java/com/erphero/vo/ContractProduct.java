package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ContractProduct {

	private long 	no;
	private String 	cnCode;
	private String 	prCode;
	private String 	prName;
	private long 	prPrice;
	private String 	stockUnit;
	private	long 	amount;
	private long 	unpaidAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date 	deliveryDate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	shipDate;
	private String 	test;
	private String 	saveStatus;
	private long 	esPrNo; 
	
}
