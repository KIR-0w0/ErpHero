package com.erphero.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Estimate {
	
	private String 	code;				// 견적 번호
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date 	estimateDate;		// 견적일
	private String 	venderCode;			// 거래처 코드
	private String 	mgrCode;			// 담당자
	private String 	reqName;			// 견적 요청자
	private String	wpCode;				// 사업장 코드
	private String	deptCode;			// 부서 코드
	private String 	empName;			// 담당자
	private String  wpName;				// 사업장명
	private String 	venderName;			// 거래처이름
	private String	saveStatus;			// 수주에서 사용여부
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;				// 견적일 조회 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;				// 견적일 조회 마감일
	
	
	
}
