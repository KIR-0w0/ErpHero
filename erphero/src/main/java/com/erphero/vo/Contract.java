package com.erphero.vo;

import java.util.Date;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Contract {

	private String 	code;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date 	contractDate;
	private String 	venderCode;
	private String	venderName;
	private String 	empCode;
	private String 	empName;
	private String 	mgrCode;
	private String	mgrName;
	private String 	status;
	
}
