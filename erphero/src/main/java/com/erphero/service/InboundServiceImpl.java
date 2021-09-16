package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.erphero.dao.InboundDao;
import com.erphero.dao.InboundProductDao;
import com.erphero.dao.OrderDao;
import com.erphero.dao.OrderProductDao;
import com.erphero.dao.ProductDao;
import com.erphero.dao.VenderDao;
import com.erphero.dto.InboundDto;
import com.erphero.vo.Employee;
import com.erphero.vo.Inbound;
import com.erphero.vo.InboundProduct;
import com.erphero.vo.Order;
import com.erphero.vo.OrderProduct;
import com.erphero.vo.Payload;
import com.erphero.vo.Product;
import com.erphero.vo.Search;
import com.erphero.vo.Vender;
import com.erphero.web.utils.JsonUtils;
import com.erphero.websocket.handler.AlarmHandler;

@Service
public class InboundServiceImpl implements InboundService{


	@Autowired InboundDao inboundDao;
	@Autowired InboundProductDao inboundProductDao;
	@Autowired OrderDao orderDao;
	@Autowired OrderProductDao orderProductDao;
	@Autowired VenderDao venderDao;
	@Autowired ProductDao productDao;
	@Autowired AlarmHandler alarmHandler;
	
	@Override
	public List<Inbound> searchSavedInbounds(Search search) {
		return inboundDao.searchSavedInbound(search);
	}
	@Override
	public void addInbound(List<Inbound> inbounds) {
		
		try {
			for(Inbound inbound: inbounds) {
				Vender vender = venderDao.getVenderByCode(inbound.getVenderCode());
				inbound.setLocationNo(vender.getLocationNo());
				inboundDao.insertInbound(inbound);
				System.out.println("저장할 때 order: "+inbound);
				
				List<InboundProduct> products = inbound.getInboundProducts();
				for(InboundProduct product: products) {
					product.setInboundCode(inbound.getCode());
					Order order = orderDao.getOrderByCode(product.getOrderCode());
					order.setSaveStatus("Y");
					order.setStatus("Y");
					orderDao.updateOrder(order);
					
					inboundProductDao.insertInboundProduct(product);
					System.out.println("저장할 상품: "+product);
					System.out.println("저장할 때 inbound코드: " +product.getInboundCode());
					
					Payload payload = Payload.builder()
							.title("입고의뢰 등록")
							.message("제품: "+product.getProductName() + ", "+"수량: "+product.getQuantity()+" 등록되었습니다.")
							.data(product).build();
					// Payload객체를 JSON 형식의 텍스트로 변환한다.
					alarmHandler.sendMessage(JsonUtils.toJsonText(payload)); //그냥 객체
					System.out.println("값 확인: "+JsonUtils.toJsonText(payload));
				}
			}
		} catch (DataAccessException ex) {
			throw new RuntimeException("입고의뢰 중 오류가 발생하였습니다.");
		}
	}
	@Override
	public void modifyInbound(List<InboundDto> allData) {
		System.out.println("리스트는 존재?"+allData);
		//할게 많음 합격, 불합격 수량, 재고량변경값 마감처리 입력받아야 함, 모달창 하나 필요
				
		for(InboundDto inboundDto: allData) {
			System.out.println("여기는 뭐야?? "+inboundDto); //-> 2개가 나와야 하는데..나중에 나오겟지?
			Inbound savedInbound = inboundDao.getInboundByCode(inboundDto.getCode());
			System.out.println("저장된 inbound코드값: "+inboundDto.getCode());
			
		try {
			
			System.out.println("저장된 값1: "+inboundDto.getStage());
			System.out.println("저장된 값2: "+savedInbound.getStage());
			if("검사".equals(inboundDto.getStage()) && "처리".equals(savedInbound.getStage())) {
				System.out.println("처리-> 진행으로 오면 변경하지 말아야지...아무것도...,값 다시 롤백");
				
				List<InboundProduct> inboundProducts = inboundProductDao.getInboundProductByInboundCode(inboundDto.getCode());
				for(InboundProduct inboundProduct: inboundProducts) {
					InboundProduct savedInboundProduct = inboundProductDao.getInboundProductByNo(inboundProduct.getNo());
					inboundProductDao.updateInboundProduct(savedInboundProduct);
					System.out.println("저장된 입고상품: "+savedInboundProduct);
					System.out.println("if절 들어감?: "+inboundDto.getStage());
					
					
					System.out.println("왜 실행이 안돼~~~~~~~~~");
					Product initialProduct = productDao.getProductByCode(savedInboundProduct.getProductCode());
					initialProduct.setStock(initialProduct.getStock() + savedInboundProduct.getPassAmount()); //합격수량만큼 증가, 합격수량만큼 발주수량 감소
					productDao.updateProduct(initialProduct);
					List<OrderProduct> orderProducts = orderProductDao.getOrderProductsByOrderCode(savedInboundProduct.getOrderCode());
					System.out.println("상품들 얻어지나?: "+savedInboundProduct.getOrderCode());
					for(OrderProduct orderProduct: orderProducts) {
						System.out.println("발주상품: "+orderProduct);
						System.out.println("if절 만족? a: "+orderProduct.getProductCode());
						System.out.println("if절 만족? b: "+savedInboundProduct.getProductCode());
						if(orderProduct.getProductCode() == savedInboundProduct.getProductCode()) {
							System.out.println("발주상품: "+orderProduct);
							
							OrderProduct savedOrderProduct = orderProductDao.getOrderProductByNo(orderProduct.getNo());
							orderProductDao.updateOrderProduct(savedOrderProduct.getNo(), (savedOrderProduct.getQuantity() + savedInboundProduct.getPassAmount()));
							System.out.println("변화된 값: "+(savedOrderProduct.getQuantity() + savedInboundProduct.getPassAmount()));
						}
					}
				}
				
			} else if( "처리".equals(inboundDto.getStage()) && "검사".equals(savedInbound.getStage()) ) { //처리 문자열로 조건절 넣으면 조건에 안들어가짐...
				
				savedInbound.setConfirmedDate(inboundDto.getConfirmedDate());
				savedInbound.setStage(inboundDto.getStage());
				savedInbound.setStatus("Y");
				inboundDao.updateInbound(savedInbound);
				System.out.println("저장된 입고객체: "+savedInbound);
				
				InboundProduct product = inboundDto.getInboundProduct();
				List<InboundProduct> inboundProducts = inboundProductDao.getInboundProductByInboundCode(inboundDto.getCode());
				for(InboundProduct inboundProduct: inboundProducts) {
					InboundProduct savedInboundProduct = inboundProductDao.getInboundProductByNo(inboundProduct.getNo());
					savedInboundProduct.setPassAmount(product.getPassAmount());
					savedInboundProduct.setFailAmount(product.getFailAmount());
					savedInboundProduct.setAmount(product.getAmount());
					inboundProductDao.updateInboundProduct(savedInboundProduct);
					System.out.println("저장된 입고상품: "+savedInboundProduct);
					System.out.println("if절 들어감?: "+inboundDto.getStage());
					
					
					System.out.println("왜 실행이 안돼~~~~~~~~~");
					Product initialProduct = productDao.getProductByCode(savedInboundProduct.getProductCode());
					initialProduct.setStock(initialProduct.getStock() + savedInboundProduct.getPassAmount()); //합격수량만큼 증가, 합격수량만큼 발주수량 감소
					productDao.updateProduct(initialProduct);
					List<OrderProduct> orderProducts = orderProductDao.getOrderProductsByOrderCode(savedInboundProduct.getOrderCode());
					System.out.println("상품들 얻어지나?: "+savedInboundProduct.getOrderCode());
					for(OrderProduct orderProduct: orderProducts) {
						System.out.println("발주상품: "+orderProduct);
						System.out.println("if절 만족? a: "+orderProduct.getProductCode());
						System.out.println("if절 만족? b: "+savedInboundProduct.getProductCode());
						if( savedInboundProduct.getProductCode().equals(orderProduct.getProductCode()) ) {
							System.out.println("발주상품: "+orderProduct);
							
							OrderProduct savedOrderProduct = orderProductDao.getOrderProductByNo(orderProduct.getNo());
							orderProductDao.updateOrderProduct(savedOrderProduct.getNo(), (savedOrderProduct.getQuantity() - savedInboundProduct.getPassAmount()));
							System.out.println("변화된 값: "+(savedOrderProduct.getQuantity() - savedInboundProduct.getPassAmount()));
							
							Payload payload = Payload.builder()
									.title("입고처리")
									.message("제품: "+savedInboundProduct.getProductName() + ", "+"발주잔량: "+(savedOrderProduct.getQuantity() - savedInboundProduct.getPassAmount())+" 입니다.")
									.data(savedInboundProduct).build();
							// Payload객체를 JSON 형식의 텍스트로 변환한다.
							alarmHandler.sendMessage(JsonUtils.toJsonText(payload)); //그냥 객체
							System.out.println("값 확인: "+JsonUtils.toJsonText(payload));
							
						}
					}
				}
			}
		} catch (DataAccessException ex) {
			throw new RuntimeException("입고처리 중 오류가 발생하였습니다.");
		}
				
			
		}
	}
	@Override
	public void removeInbound(List<String> codes) {
		for(String code: codes) {
			Inbound savedInbound = inboundDao.getInboundByCode(code);
			savedInbound.setStatus("N");
			List<InboundProduct> products = inboundProductDao.getInboundProductByInboundCode(code);
			for(InboundProduct product: products) {
				Order order = orderDao.getOrderByCode(product.getOrderCode());
				order.setSaveStatus("N");
				order.setStatus("Y");
				orderDao.updateOrder(order);
				System.out.println("삭제 확인~~~~~: "+product.getOrderCode()+order.getSaveStatus());
				Payload payload = Payload.builder()
						.title("입고의뢰 삭제").message(product.getProductName() + " 제품, "+ product.getQuantity()+" 수량이 삭제되었습니다.")
						.data(product).build();
				alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
			}
			inboundProductDao.deleteInboundProductByInboundCode(code);
			inboundDao.updateInbound(savedInbound);
		}
	}
	@Override
	public Inbound getInboundByCode(String code) {
		return inboundDao.getInboundByCode(code);
	}
	@Override
	public List<Employee> searchEmployee(String name) {
		return inboundDao.searchEmployee(name);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<InboundProduct> searchInboundProducts(Search search) {
		return inboundProductDao.searchInboundProducts(search);
	}
	@Override
	public void addInboundProduct(String inboundCode, List<InboundProduct> inboundProducts) {
		for(InboundProduct inboundProduct: inboundProducts) {
			inboundProductDao.insertInboundProduct(inboundProduct);
		}
		Inbound inbound = inboundDao.getInboundByCode(inboundCode);
		inboundDao.updateInbound(inbound);
	}
	@Override
	public List<InboundProduct> getInboundProductsByInboundCode(String inboundCode) {
		return inboundProductDao.getInboundProductByInboundCode(inboundCode);
	}
	@Override
	public List<InboundProduct> getInboundProductsByProductCode(String productCode) {
		return inboundProductDao.getInboundProductsByProductCode(productCode);
	}
	@Override
	public void removeInboundProductByInboundCode(String inboundCode) {
		inboundProductDao.deleteInboundProductByInboundCode(inboundCode);
	}
	@Override
	public InboundProduct getInboundProductByNo(long no) {
		return inboundProductDao.getInboundProductByNo(no);
	}
	@Override
	public void removeInboundProducts(List<Long> nos) {
		String inboundCode = null;
		for(Long no: nos) {
			InboundProduct inboundProduct = inboundProductDao.getInboundProductByNo(no);
			if(inboundCode == null) {
				inboundCode = inboundProduct.getInboundCode();
			}
			Order savedOrder = orderDao.getOrderByCode(inboundProduct.getOrderCode());
			savedOrder.setSaveStatus("N");
			savedOrder.setStatus("Y");
			orderDao.updateOrder(savedOrder);
			inboundProductDao.deleteInboundProducts(no);
		}
		List<InboundProduct> inboundProducts = inboundProductDao.getInboundProductByInboundCode(inboundCode);
		if(inboundProducts.isEmpty()) {
			Inbound inbound = inboundDao.getInboundByCode(inboundCode);
			inbound.setStatus("N");
			inboundDao.updateInbound(inbound);
		}
	}
	@Override
	public void updateInboundProduct(InboundProduct inboundProduct) {
		inboundProductDao.updateInboundProduct(inboundProduct);
	}
	/**
	 * 전체 상품들이 있는 테이블에서 상품의 정보들을 변경한다.
	 */
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
	
}
