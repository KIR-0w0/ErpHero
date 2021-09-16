package com.erphero.dto;

import java.util.Date;

import com.erphero.vo.InboundProduct;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InboundDto {

	private String code;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date confirmedDate;
	private String stage;
	InboundProduct inboundProduct;
	
	
	
}
