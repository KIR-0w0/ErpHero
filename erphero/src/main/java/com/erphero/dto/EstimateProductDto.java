package com.erphero.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EstimateProductDto {

	private String 	code;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date 	esDate;
	private String 	venderCode;
	private String 	prCode;
	private long 	espNo;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date 	deliveryDate;
	private long 	Amount;
	private String 	prName;
	private String	stockUnit;
	private String	venderName;
	private long	price;
	private String 	empName;
	private String 	empCode;
	 
}
