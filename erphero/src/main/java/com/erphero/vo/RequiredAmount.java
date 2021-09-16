package com.erphero.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class RequiredAmount {
	
	private long no; //소요량 전개 번호
	private String planningCode;
	private String empCode; 
	private long amountSum; //소요량 취합
	private String procureType; //조달구분
	private String productType; //계정구분
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date date; //소요일자
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date ordersDate; //예정발주일
	private String productCode; //품번
	private String productName; //품명
	private String productStockUnit; //단위
	private long ordersAmount; //예정수량
	
	private String empWorkplaceCode;
	private long productStock; //(현)재고수량
	private long productSafeStock; //안전재고량
	private long productDefaultAmount; //기본주문수량
	private long productLeadTime; //leadtime
	private long neededAmount; //필요수량
	private String status; //객체 상태
	private String venderCode; //거래처코드 (청구등록 때)
	
	public RequiredAmount() {
	}
//service에서 dao 객체 얻어짐 -> sql문 통해 값이 담김 
//dao에서 객체 하나 가져오고, 서비스에서 메소드를 호출한다.
		
	public void calculateRequiredAmount() {
		System.out.println("#################처음 예정수량값: "+ordersAmount);
		System.out.println("#################처음 안전재고량값: "+productSafeStock);
		System.out.println("#################처음 기본주문수량값: "+productDefaultAmount);
		System.out.println("#################처음 필요수량값: "+neededAmount);
		System.out.println("#################처음 현 재고량값: "+productStock);
		if(neededAmount - productStock < 0 && productStock > productSafeStock) {
			this.ordersAmount = 0;
			System.out.println("~~~~~~~~~~~~처음 값 : "+ productType);
			if ("부품".equals(productType) ) {
				this.procureType ="구매";
			}
			System.out.println("############# 예정수량 0, 재고량만 감소해~ "+ this.ordersAmount + this.procureType);
			//영업이 알아서 처리 -> contractAmount 값 그대로 출고, 예정수량 0인거 찾아서
		}
		else { 
			System.out.println("구매 작업 시작");
			if((productSafeStock != 0 && productDefaultAmount != 0) && (productStock < neededAmount || productStock == neededAmount)) {
				this.procureType ="구매";
				if(productDefaultAmount > productSafeStock) {
					this.ordersAmount = productDefaultAmount;
					if (this.ordersAmount <= neededAmount || this.ordersAmount -neededAmount <= productSafeStock) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productDefaultAmount;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount && this.ordersAmount -neededAmount > productSafeStock) {
								break;
							}
						}
					}
					System.out.println("#############기본 주문수량값: "+ this.ordersAmount + this.procureType);
				}
				else if(productDefaultAmount < productSafeStock) {
					this.ordersAmount = neededAmount - productStock + productSafeStock;
					if (this.ordersAmount <= neededAmount || this.ordersAmount -neededAmount <= productSafeStock) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productSafeStock;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount && this.ordersAmount -neededAmount > productSafeStock) {
								break;
							}
						}
					}
					System.out.println("############# MIX 값: "+ this.ordersAmount + this.procureType);
				}
			}
			else if(productSafeStock == 0 && productDefaultAmount == 0) {
				this.procureType ="구매";
				this.ordersAmount = neededAmount - productStock;
				System.out.println("#############단순 뺀 값: "+ this.ordersAmount + this.procureType);
			}
			
			else if (productSafeStock != 0 && productDefaultAmount == 0 && (productStock < neededAmount || productStock == neededAmount)) {
				this.procureType ="구매";
				if ((neededAmount - productStock) < productSafeStock) {
					this.ordersAmount = neededAmount - productStock + productSafeStock;
					if (this.ordersAmount <= neededAmount || this.ordersAmount -neededAmount <= productSafeStock) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productSafeStock;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount && this.ordersAmount -neededAmount > productSafeStock) {
								break;
							}
						}
					}
					System.out.println("#############안전재고량값 MIX: "+ this.ordersAmount + this.procureType);
				}
				else if((neededAmount - productStock) >= productSafeStock) {
					this.ordersAmount = neededAmount - productStock;
					if (this.ordersAmount <= neededAmount || this.ordersAmount -neededAmount <= productSafeStock) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productSafeStock;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount && this.ordersAmount -neededAmount > productSafeStock) {
								break;
							}
						}
					}
					System.out.println("#############뺀 값 MIX: "+ this.ordersAmount + this.procureType);
				}
			}
			else if (productSafeStock == 0 && productDefaultAmount != 0) {
				this.procureType ="구매";
				if ((neededAmount - productStock) < productDefaultAmount) {
					this.ordersAmount = productDefaultAmount;
					if (this.ordersAmount <= neededAmount) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productDefaultAmount;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount) {
								break;
							}
						}
					}
					System.out.println("#############기본수량값 : "+ this.ordersAmount + this.procureType);
				}
				else if((neededAmount - productStock) >= productDefaultAmount) {
					this.ordersAmount = neededAmount - productStock;
					if (this.ordersAmount <= neededAmount) {
						for(int i=1; i<=neededAmount; i++) {
							this.ordersAmount += productDefaultAmount;
							System.out.println("i값이 궁금하군: "+i);
							if(this.ordersAmount > neededAmount) {
								break;
							}
						}
					}
					System.out.println("#############안전재고량 뺀 값 MIX: "+ this.ordersAmount + this.procureType);
				}
			}
		}
		
		
		System.out.println("#################최종 예정수량값: "+this.ordersAmount);
		System.out.println("#################최종 안전재고량값: "+this.productSafeStock);
		System.out.println("#################최종 기본주문수량값: "+this.productDefaultAmount);
		System.out.println("#################최종 필요수량값: "+this.neededAmount);
		System.out.println("#################최종 현 재고량값: "+this.productStock);
	}
	
	
}
