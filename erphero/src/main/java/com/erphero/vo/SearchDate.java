package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SearchDate {


	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
}
