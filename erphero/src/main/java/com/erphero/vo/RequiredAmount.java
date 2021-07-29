package com.erphero.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class RequiredAmount {
	
	private String empCode;
	private long no;
	private long amountSum; //소요량 취합
	private String procureType; //조달구분
	private String productType; //계정구분
	private String productCode; //상품코드
	private Date ordersDate; //예정발주일
	private long ordersAmount; //예정수량
	
	private String empWorkplaceCode;
	private Date startDate; //주계획기간 조회용
	private Date eneDate;  //주계획기간 조회용
	private long productStock; //(현)재고수량
	private long productDefaultAmount; //기본주문수량
	private long productSafeStock; //안전재고량

	public RequiredAmount() {
	}
//service에서 dao 객체 얻어짐 -> sql문 통해 값이 담김 
//dao에서 객체 하나 가져오고, 서비스에서 메소드를 호출한다.
	public void claculateRequiredAmount(long ordersAmount) {
		Planning planning = new Planning();
		long neededAmount = planning.getAmount();
		if((neededAmount - productStock == 0) || (neededAmount - productStock < 0)) {
			this.ordersAmount = 0;
		}else {
			if(productSafeStock != 0 && productDefaultAmount != 0) {
				
				if(productDefaultAmount > productSafeStock) {
					this.ordersAmount = productDefaultAmount;
				}
				else if(productDefaultAmount < productSafeStock) {
					this.ordersAmount = neededAmount - productStock + productSafeStock;
				}
			}
			if (productSafeStock != 0 && productDefaultAmount == 0) {
				if ((neededAmount - productStock) < productSafeStock) {
					this.ordersAmount = neededAmount - productStock + productSafeStock;
				}
				else if((neededAmount - productStock) >= productSafeStock) {
					this.ordersAmount = neededAmount - productStock;
				}
			}
			if (productSafeStock == 0 && productDefaultAmount != 0) {
				if ((neededAmount - productStock) < productDefaultAmount) {
					this.ordersAmount = productDefaultAmount;
				}
				else if((neededAmount - productStock) >= productDefaultAmount) {
					this.ordersAmount = neededAmount - productStock;
				}
			}
		}
	}
	
}
