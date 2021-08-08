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
	private String category;
	private String status;
	private String stockUnit;
	private int stockUnitAmount;
	private int stock;
	private int defaultAmount;
	private int safeStock;
	private String procureType;
	private int price;
	private String rootCode;
	private int leadTime;
	private String venderCode;
}
