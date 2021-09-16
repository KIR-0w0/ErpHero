package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Employee {

	private String 	code;
	private String 	id;
	private String 	name;
	private String 	deptCode;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	hireDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	resignationDate;
	private String 	status;
	private String 	email;
	private String 	phone;
	private String	password;
	private String 	jobId;
	private String 	workplaceCode;
}
