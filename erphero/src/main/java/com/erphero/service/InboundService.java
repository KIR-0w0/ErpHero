package com.erphero.service;

import java.util.List;

import com.erphero.dto.InboundDto;
import com.erphero.vo.Employee;
import com.erphero.vo.Inbound;
import com.erphero.vo.InboundProduct;
import com.erphero.vo.Product;
import com.erphero.vo.Search;

public interface InboundService {

	List<Inbound> searchSavedInbounds(Search search);
	
	/**
	 * 발주적용된 상품에 대해 입고의뢰 작성을 등록하는 서비스
	 * @param inbound
	 */
	void addInbound(List<Inbound> inbound);
	/**
	 * 입고객체의 정보를 변경한다.
	 * @param inbound
	 */
	void modifyInbound(List<InboundDto> allData);

	/**
	 * 입고객체의 상태를 바꾼다.
	 * @param codes
	 */
	void removeInbound(List<String> codes);
	
	/**
	 * 발주적용된 상품에 대해 입고의뢰 정보를 제공하는 서비스
	 * @param code 입고의뢰코드
	 * @return
	 */
	Inbound getInboundByCode(String code);
	
	/**
	 * 입고의뢰등록한 의뢰담당자를 지정한다.
	 * @param name
	 * @return 사원들
	 */
	List<Employee> searchEmployee(String name);
	
	//////////////////////////////////////////////////////////////////////////////////
	List<InboundProduct> searchInboundProducts(Search search);
	void addInboundProduct(String inboundCode, List<InboundProduct> inboundProducts);
	
	List<InboundProduct> getInboundProductsByInboundCode(String inboundCode);
	List<InboundProduct> getInboundProductsByProductCode(String productCode);
	
	void removeInboundProductByInboundCode(String inboundCode);
	InboundProduct getInboundProductByNo(long no);

	/**
	 * 입고객체의 코드로 얻어진 저장된 상품들을 삭제한다. 
	 * @param nos 입고상품번호
	 */
	void removeInboundProducts(List<Long> nos);
	
	/**
	 * 입고처리시 상품들정보를 변경한다.
	 * @param inboundProduct
	 */
	void updateInboundProduct(InboundProduct inboundProduct);
	
	/**
	 * 상품의 정보를 변경한다.
	 * @param product
	 */
	void updateProduct(Product product);
}
