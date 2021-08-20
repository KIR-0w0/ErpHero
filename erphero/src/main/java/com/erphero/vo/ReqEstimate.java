package com.erphero.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReqEstimate {
	String name;
	String venderName;
	String businessNumber;
	String email;
	String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date deliveryDate;
	List<Long> productsAmount;
	List<String> ProductsCode;
}
