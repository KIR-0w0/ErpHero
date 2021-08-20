package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Estimate {
	
	private String 	code;				// 견적 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	estimateDate;		// 견적일
	private String 	venderCode;			// 거래처 코드
	private String 	mgrCode;			// 담당자
	private String 	reqName;			// 견적 요청자
	private String	wpCode;				// 사업장 코드
	private String	deptCode;			// 부서 코드
	private String	mngCode;			// 관리 구분
	
}
