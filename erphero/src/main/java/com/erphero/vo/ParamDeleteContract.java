package com.erphero.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ParamDeleteContract {

	private String contractCode;
	
	List<Long> esPrNo;
	List<Long> prNo;
}
