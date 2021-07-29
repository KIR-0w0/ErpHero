package com.erphero.vo;

import java.util.Date;

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
	private Date 	hireDate;
	private Date 	resignationDate;
	private String 	status;
	private String 	email;
	private String	password;
	private String 	phone;
	private String 	jobId;
	private String 	workplaceCode;
}
