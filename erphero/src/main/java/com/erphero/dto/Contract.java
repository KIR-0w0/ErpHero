package com.erphero.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Contract {

	private String code;
	private Date date;
	private String venderName;
	private String productCode;
	private String productName;
	private String stockUnit;
	private long cpContractAmount;
	private Date cpShipDate;
	private Date cpDeliveryDate;
}
