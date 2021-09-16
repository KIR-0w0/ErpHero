package com.erphero.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Contract {

	private String code;
	private String empCode;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date;
	private String venderName;
	private String productCode;
	private String productName;
	private String stockUnit;
	private long cpContractAmount;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date cpShipDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date cpDeliveryDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date targetDate;
	private long contractProductNo;
	
}
