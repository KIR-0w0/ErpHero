package com.erphero.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Payload {

	String title;	// 수강신청, 수강철회
	String message;	// 홍길동이 등록하였습니다, 발주수량은 입니다.
	Object data;	// OrderProduct객체

	@Builder
	public Payload(String title, String message, Object data) {
		super();
		this.title = title;
		this.message = message;
		this.data = data;
	}

	
}
