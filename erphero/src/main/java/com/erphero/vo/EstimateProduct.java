package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class EstimateProduct {
	private long 	no;
	private String 	estimateCode;
	private String 	productCode;
	private long 	estimateAmount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date	deliveryDate;
	private String	saveStatus;
}
