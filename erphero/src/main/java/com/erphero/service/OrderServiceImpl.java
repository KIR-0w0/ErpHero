package com.erphero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.erphero.dao.ChargeDao;
import com.erphero.dao.OrderDao;
import com.erphero.dao.OrderProductDao;
import com.erphero.dao.VenderDao;
import com.erphero.vo.Charge;
import com.erphero.vo.Employee;
import com.erphero.vo.Order;
import com.erphero.vo.OrderProduct;
import com.erphero.vo.Payload;
import com.erphero.vo.Search;
import com.erphero.vo.Vender;
import com.erphero.web.utils.JsonUtils;
import com.erphero.websocket.handler.AlarmHandler;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderDao orderDao;
	@Autowired OrderProductDao orderProductDao;
	@Autowired ChargeDao chargeDao;
	@Autowired VenderDao venderDao;
	@Autowired AlarmHandler alarmHandler;
	
	@Override
	public List<Order> searchSavedOrders(Search search) {
		return orderDao.searchSavedOrders(search);
	}

	@Override
	public void addOrder(List<Order> orders) {
		
		try {
			for(Order order: orders) {
				Vender vender = venderDao.getVenderByCode(order.getVenderCode());
				order.setLocationNo(vender.getLocationNo());
				orderDao.insertOrder(order);
				System.out.println("저장할 때 order: "+order);
				
				List<OrderProduct> products = order.getOrderProducts(); //새상품
				for(OrderProduct product: products) {
					product.setOrderCode(order.getCode());
					Charge charge = chargeDao.getChargeByCode(product.getChargeCode());
					charge.setSaveStatus("Y");
					chargeDao.updateCharge(charge);
					
					orderProductDao.insertOrderProduct(product);
					System.out.println("저장할 상품: "+product);
					System.out.println("저장할 때 charge코드: " +product.getChargeCode());
					
					// 클라이언트에게 전달한 메세지 및 데이터를 포함하는 Payload객체를 생성한다.
					Payload payload = Payload.builder()
							.title("발주 등록 수량은")
							.message(product.getQuantity() + " 입니다.")
							.data(product).build();
					// Payload객체를 JSON 형식의 텍스트로 변환한다.
					alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
				}
			}
		} catch (DataAccessException ex) {
			throw new RuntimeException("발주등록 중 오류가 발생하였습니다.");
		}
	}

	@Override
	public void modifyOrder(List<Order> orders) {
		for(Order order: orders) {
			Order savedOrder = orderDao.getOrderByCode(order.getCode());
			savedOrder.setStage("마감");
			savedOrder.setSaveStatus("N");
			savedOrder.setStatus("Y");
			orderDao.updateOrder(savedOrder);
		}
	}

	@Override
	public void removeOrder(List<String> codes) {
		for(String code: codes) {
			Order savedOrder = orderDao.getOrderByCode(code);
			savedOrder.setStatus("N");
			List<OrderProduct> products = orderProductDao.getOrderProductsByOrderCode(code);
			for(OrderProduct product: products) {
				Charge charge = chargeDao.getChargeByCode(product.getChargeCode());
				charge.setSaveStatus("N");
				charge.setStatus("Y");
				chargeDao.updateCharge(charge);
				System.out.println("삭제되는 것 확인: "+product.getChargeCode()+charge.getSaveStatus());
				Payload payload = Payload.builder()
						.title("발주 삭제").message(product.getProductName() + " 제품, "+ product.getQuantity()+" 수량이 삭제되었습니다.")
						.data(product).build();
				alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
			}
			orderProductDao.deleteOrderProductByOrderCode(code);
			orderDao.updateOrder(savedOrder);
		}
	}

	@Override
	public Order getOrderByCode(String code) {
		return orderDao.getOrderByCode(code);
	}
	
	@Override
	public List<Employee> searchEmployee(String name) {
		return orderDao.searchEmployee(name);
	}
///////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public List<OrderProduct> searchOrderProducts(Search search) {
		return orderProductDao.searchOrderProducts(search);
	}

	@Override
	public void addOrderProduct(String orderCode, List<OrderProduct> orderProducts) {
		for (OrderProduct orderProduct: orderProducts) {
			orderProductDao.insertOrderProduct(orderProduct);
		}
		Order order = orderDao.getOrderByCode(orderCode);
		orderDao.updateOrder(order);
	}

	@Override
	public List<OrderProduct> getOrderProductsByOrderCode(String orderCode) {
		return orderProductDao.getOrderProductsByOrderCode(orderCode);
	}

	@Override
	public List<OrderProduct> getOrderProductsByProductCode(String productCode) {
		return orderProductDao.getOrderProductsByProductCode(productCode);
	}

	@Override
	public void removeOrderProductByOrderCode(String orderCode) {
		orderProductDao.deleteOrderProductByOrderCode(orderCode);
	}

	@Override
	public OrderProduct getOrderProductByNo(long no) {
		return orderProductDao.getOrderProductByNo(no);
	}
	
	@Override
	public void removeOrderProducts(List<Long> nos) {
		String orderCode = null;
		for(Long no: nos) {
			OrderProduct orderProduct = orderProductDao.getOrderProductByNo(no);
			if(orderCode == null) {
				orderCode = orderProduct.getOrderCode();
				System.out.println("지금 삭제중인 발주코드: "+orderCode);
			}
			Charge savedCharge = chargeDao.getChargeByCode(orderProduct.getChargeCode());
			savedCharge.setSaveStatus("N");
			savedCharge.setStatus("Y");
			chargeDao.updateCharge(savedCharge);
			orderProductDao.deleteOrderProducts(no);
		}
		List<OrderProduct> orderProducts = orderProductDao.getOrderProductsByOrderCode(orderCode);
		if(orderProducts.isEmpty()) {
			Order order = orderDao.getOrderByCode(orderCode);
			order.setStatus("N");
			orderDao.updateOrder(order);
		}
	}
}
