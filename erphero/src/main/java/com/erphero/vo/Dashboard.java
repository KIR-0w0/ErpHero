package com.erphero.vo;





import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Dashboard {

	private String date;
	private long cnt;
	private long quantity;
	private long price; //공급가
	private long afterStock; //입고후 재고량
	private long beforeStock; //입고전 재고량
	private long totalStock; //총 재고량
	private float passRate;
	private float failRate;
	private long passAmount;
	private long failAmount;
	private String locationName; //지역이름
	private String productName; //품명
	private String categoryName; //카테고리명
	
}
