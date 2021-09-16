package com.erphero.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class Inbound {

	private String code;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date;
	private String managerCode;
	private String managerName;
	private String empCode;
	private String venderCode;
	private String venderName;
	private String stage; //마감구분(검사, 처리)
	private String status;
	private String saveStatus;
	private String locationNo;
	private long quantity;
	private List<InboundProduct> inboundProducts;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date finishDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date confirmedDate;
}
