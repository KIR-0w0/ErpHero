package com.erphero.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ParamContract {
	String venderCode;
	String empCode; 
	String mgrCode;
	String esCode;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	Date contractDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	List<Date> shipDate;
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	List<Date> deliveryDate;
	List<Long> amount;
	List<Long> esNo;
	List<String> prCode;

}
