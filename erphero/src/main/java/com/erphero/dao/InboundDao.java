package com.erphero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erphero.vo.Employee;
import com.erphero.vo.Inbound;
import com.erphero.vo.Search;

public interface InboundDao {

	List<Inbound> searchSavedInbound (Search search);
	
	/**
	 * 새 입고의뢰등록을 DB에 저장한다.
	 * @param inbound
	 */
	void insertInbound(Inbound inbound);
	
	/**
	 * 입고코드에 해당하는 입고의뢰 객체를 조회한다.
	 * @param code
	 * @return
	 */
	Inbound getInboundByCode(@Param("code") String code);
	
	/**
	 * 입고의뢰등록의 내용을 변경해서 DB에 저장한다.
	 * @param inbound
	 */
	void updateInbound (Inbound inbound);
	
	/**
	 * 사원을 찾아서 실적담당자로 지정한다.
	 * @param name
	 * @return 사원들
	 */
	List<Employee> searchEmployee (String name);
}
