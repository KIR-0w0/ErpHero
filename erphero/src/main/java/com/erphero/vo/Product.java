package com.erphero.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product {

	private String code;
	private String name;
	private String type;
	private String categoryCode;
	private String status;
	private String stockUnit;
	private long stockUnitAmount;
	private long stock;
	private long defaultAmount;
	private long safeStock;
	private String procureType;
	private long price;
	private String rootCode;
	private long leadTime;
	private String venderCode;
}
