<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>입고 의뢰/처리</title>
<style>
      html,
      body {
        width: 100%;
        height: 100%;
      }
      .container {
        width: 100%;
        height: 100%;
        background: pink;
      }
</style>
</head>
<body>
<%@ include file="../common/navemployee.jsp" %>
<div class="container-fluid my-3">
	<div class="row">
		<div class="col-2">
			<%@ include file="../common/sidebar.jsp" %>
		</div>
		<div class="col-10 border-1">
			<div class="row mb-3">
				<div class="col-12">
					<div class="row mb-3">
						<div class="col-10">
							<h2><strong>입고 의뢰/처리</strong></h2>
						</div>
						<div class="col-2">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button class="btn btn-outline-primary btn me-md-2" id="btn-open-inbound-modal">발주 적용</button>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div style="padding:10px;">
								사업장 <input type="text" style='text-align:center; margin-right: 15px' name="empWorkPlaceCode" id="emp-workPlace-code" value="">
								부서 <input type="text" style='text-align:center; margin-right: 15px' name="deptCode" id="dept-code" value="">
								사원 <input type="text" style='text-align:center; margin-right: 15px' name="empCode" id="emp-code" value="EP210001">
								의뢰기간 <input type="date" style='text-align:center;' id="inbound-start-date" name="startDate"> ~ 
										<input type="date" style='text-align:center; margin-right: 15px' id="inbound-end-date" name="endDate">
								<button type="button" class="btn btn-primary btn-sm" id="btn-get-allInbounds">조회</button>
								<button type="button" class="btn btn-primary btn-sm" id="btn-post-inbounds">저장</button>
								<button type="button" class="btn btn-success btn-sm" id="btn-update-inbounds">입고처리</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-delete-inbounds" disabled>삭제</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-remove-inbounds" disabled>비우기</button>
							</div>
							<form id="form-inbound">
								<table class="table" id="table-inbound">
									<colgroup>
										<col width="5%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="ino" id="allInboundsSelect" value="20"></th>
											<th class="text-center">의뢰번호</th>
											<th class="text-center">의뢰일자</th>
											<th class="text-center">거래처</th>
											<th class="text-center">의뢰담당자</th>
											<th class="text-center">요청마감일</th>
											<th class="text-center">처리구분</th>
											<th class="text-center"></th>
										</tr>
									</thead>
										<tbody>
											<!--  -->
										</tbody>
								</table>
								<table class="table" id="table-inbound-product">
									<colgroup>
										<col width="5%">
										<col width="3%">
										<col width="15%">
										<col width="*%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="ipno" id="allInboundProductsSelect" value="20"></th>
											<th class="text-center">No</th>
											<th class="text-center">품번</th>
											<th class="text-center">품명</th>
											<th class="text-center">납기일</th>
											<th class="text-center">입고예정일</th>
											<th class="text-center">단위</th>
											<th class="text-center">의뢰수량</th>
										</tr>
									</thead>
										<tbody>
											<!-- <tr>
												<td><input type="checkbox" name="pcode" value="20"></td>
												<td>품번</td> ajax로 가능?
												<td>품명</td>
												<td>요청일</td>
												<td>재고단위</td>
												<td>재고단위수량</td>
												<td>청구단위</td>
												<td>청구단위수량</td>
												<td>주거래처</td>
											</tr> -->
										</tbody>
								</table>
							</form>
						</div>
					</div>
					<div class="modal fade" id="form-inbound-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">발주 적용</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row px-2 mb-2">
									<div>소요예정일 <input type="date" id="order-start-date" name="startDate" value=""/>~
									<input type="date" id="order-end-date" name="endDate" value=""/>
									<button type="button" class="btn btn-primary btn-sm" id="btn-get-orders">조회</button>
									</div>
								</div>
								<div class="row px-2 mb-2">
									<div class="col">
										<table class="table" id="table-order">
											<colgroup>
												<col width="5%">
												<col width="15%">
												<col width="15%">
												<col width="15%">
												<col width="10%">
												<col width="*%">
												<col width="8%">
												<col width="8%">
											</colgroup>
											<thead>
												<tr>
													<th><input type="checkbox" name="ono" id='allOrdersSelect'></th>
													<th class="text-center">발주번호</th>
													<th class="text-center">발주일자</th>
													<th class="text-center">거래처</th>
													<th class="text-center">품번</th>
													<th class="text-center">품명</th>
													<th class="text-center">단위</th>
													<th class="text-center">발주잔량</th>
												</tr>
											</thead>
											<tbody>
												<!-- 값뿌림 
												-->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" id="btn-select-inbound">적용</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 담당자 -->
				<div id="modal-manager-detail" class="modal" tabindex="-1">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">실적담당자 상세정보</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row px-2 mb-2">
									<div> 검색 <input type="text" id="manager-name-search" name="managerName" value=""/>
									<button type="button" class="btn btn-primary btn-sm" id="btn-get-managers">조회</button>
									</div>
								</div>
								<table class="table table-bordered" id="table-manager-detail">
									<colgroup>
										<col width="30%">
										<col width="60%">
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">실적담당자 코드</th>
											<th class="text-center">실적담당자명</th>
										</tr>
									</thead>
									<tbody>
									<!-- 값뿌림 -->
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								 <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>	
					<div class="modal fade" id="form-inbound-update-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">입고 처리</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<form id="form-inbound-update">
								
								<div class="modal-body">
									<div class="row px-2 mb-2">
										<div class="col">
											<table class="table" id="table-update">
												<colgroup>
													<col width="15%">
													<col width="35%">
													<col width="15%">
													<col width="35%">
												</colgroup>
												<tbody>
													<tr>
														<th>입고일자</th>
														<td><input type="date" class="form-control" id="inbound-confirmed-date" name="confirmedDate"  style="text-align:center; width:300px; height:30px;" value=""/></td>
														<th>처리구분</th>
														<td>
															<div class="form-check">
																<div class="form-check form-check-inline">
																  <input class="form-check-input" type="radio" name="stage" id="inbound-stage-processing" value="검사">
																  <label class="form-check-label" for="inbound-stage-processing"> 검사</label>
																</div>
																<div class="form-check form-check-inline">
																  <input class="form-check-input" type="radio" name="stage" id="inbound-stage-closing" value="처리">
																  <label class="form-check-label" for="inbound-stage-closing"> 처리</label>
																</div>
															</div>
														</td>	
													</tr>
													<tr>
														<th>합격수량</th>
														<td><input type="number" min='0' class="form-control" id="inbound-pass" name="inboundPass" style="text-align:center; width:300px; height:30px;" value=""/></td>
														<th>불합격수량</th>
														<td><input type="number" min='0' class="form-control" id="inbound-fail" name="inboundFail" style="text-align:center; width:300px; height:30px;" value=""/></td>
													</tr>
													<tr>
														<th>입고단위수량</th>
														<td colspan="4"><input type="number" min='0' class="form-control" id="inbound-amount" name="inboundAmount" style="text-align:center; width:300px; height:30px;" value="1" /></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary" id="btn-modify-inbound">적용</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/ws.jsp" %>
</div>
<script>
$(function (){
	$("#btn-remove-inbounds").hide();
	var inboundModal = new bootstrap.Modal(document.getElementById("form-inbound-modal"), {
		keyboard: false
	})
	var inboundUpdateModal = new bootstrap.Modal(document.getElementById("form-inbound-update-modal"), {
		keyboard: false
	})
	var managerDetailModal = new bootstrap.Modal(document.getElementById("modal-manager-detail"), {
		keyboard: false
	})
	//화면상단의 발주 적용 버튼 클릭시 실행
	$("#btn-open-inbound-modal").click(function() {
		$("#allOrdersSelect").prop('checked', false);
		$("#table-order tbody").empty();
		inboundModal.show();
	});
	
	//일반창에서 입고처리 버튼 클릭시
	$("#btn-update-inbounds").click(function() {
		if($(':checkbox[name=icode]:checked').length == 0){
			alert("목록이 선택되지 않았습니다.");
			return false;
		}
		inboundUpdateModal.show();
	});
	
	
	//일반창에서 담당자 변경하기!!
	var clickedManagerTd;
	$("#table-inbound tbody").on("click", ".btn-link[data-btn-manager-code]", function(){
		event.preventDefault();
		console.log("실적담당자 상세보기")
		clickedManagerTd = this;
		managerDetailModal.show();
	})
	$("#btn-get-managers").click(function () {
		
		var empName = $("#manager-name-search").val();
		var $tbody = $("#table-manager-detail tbody").empty();
		$.ajax({
			url:"list/empDetail",
			data:{name: empName},
			dataType: "json",
			success: function (response) {
				var managers = response.items;
				if (response.success && response.items != null) {
					
					$.each(managers, function(index, manager){
						var row = '';
						row += '<tr class="align-middle">';
						row +=		'<td class="text-center" id="manager-code-modal">'+manager.code+'</td>'
						row +=		'<td class="text-center" id="manager-name-modal"><button type="button" class="btn btn-link" data-manager-code-modal="'+manager.code+'">'+manager.name+'</button></td>';
						row += '</tr>';
						
						$tbody.append(row);
					})
				}
				
			}
		})
		
	})
	$("#table-manager-detail tbody").on("click", ".btn-link", function(){
		//일반창의 담당자명을 바꾼다.
		var managerName = $(this).text();
		var managerCode = $(this).data('manager-code-modal');
		$(clickedManagerTd).text(managerName);
		$(clickedManagerTd).attr('data-btn-manager-code', managerCode);
		managerDetailModal.hide();
		
		console.log("이제 코드까지 바뀌었나?? ", $(clickedManagerTd).attr('data-btn-manager-code'));
	})
	
	//일반창에서 조회버튼 클릭시 실행 -> 상단표만 출력
	$("#btn-get-allInbounds").click(function () {
		var $tbody = $("#table-inbound-product tbody").empty();
		$("#allInboundsSelect").prop('checked', false);
		//버튼숨기기 -> update 계획일 가능하면 다시 풀기
		$("#btn-post-inbounds").hide();
		$("#btn-remove-inbounds").hide();
		$("#btn-update-inbounds").show();
		$("#btn-delete-inbounds").show().prop("disabled", false);
		$('#table-inbound th').eq(1).text("의뢰번호")
		var param = {};
		if ($("#emp-workPlace-code").val() != "") {
			param.empWorkPlaceCode = $("#emp-workPlace-code").val();
		}
		if ($("#dept-code").val() != "") {
			param.deptCode = $("#dept-code").val();
		}
		if ($("#emp-code").val() != "") {
			param.empCode = $("#emp-code").val();
		}
		if ($("#inbound-start-date").val() != "") {
			param["startDate"] = $("#inbound-start-date").val();
		}
		if ($("#inbound-end-date").val() != "") {
			param["endDate"] = $("#inbound-end-date").val();
		}
		if (($("#inbound-start-date").val() != "") && ($("#inbound-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#inbound-start-date").val() == "") && ($("#inbound-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		$.ajax({
			type:'post',
			url: '/inbound/list/search',
			data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
			contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
			dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
			success: function(inbounds) {
				var $tbody = $("#table-inbound tbody").empty();
				console.log("응답됐나??", inbounds);
				
				$.each(inbounds, function(index, inbound) {
					var rowUp = "<tr id='inbound-"+index+"'>"
					rowUp += "<td><input type='checkbox' name='icode' value='"+inbound.code+"'/></td>";
					rowUp += "<td class='text-center'>"+inbound.code+"</td>";
					rowUp += "<td class='text-center'><button type='button' class='btn btn-link' data-inbound-product-no='"+inbound.code+"'>"+inbound.date+"</button></td>"; 
					rowUp += "<td class='text-center'>"+inbound.venderName+"</td>";
					rowUp += "<td class='text-center'>"+inbound.managerName+"</td>";
					rowUp += "<td class='text-center'>"+inbound.finishDate+"</td>";
					rowUp += "<td class='text-center'>"+inbound.stage+"</td>";
					rowUp += "<td class='text-center'></td>";
					rowUp += "</tr>";
					
					$tbody.append(rowUp);
					
				});
			}
		})
	})
	//ajax 한동작에 대해 하나의 일만 실행 (윗조회화 버튼 조회는 다른 동작이다. )
	//index별로 누르면 조회되게 하기
	$("#table-inbound tbody").on('click', '.btn-link[data-inbound-product-no]', function(event) {
		event.preventDefault();
		$("#table-inbound-product tbody").empty();
		console.log('call function');
		//하단 표
		var inboundCode = $(this).data("inbound-product-no");//버튼
	   	$.ajax({
	   		type:'get',
			url: 'list/searchInboundProduct',
			data: { inboundCode:inboundCode },
			contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
			dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
			success: function(inboundProducts) {
				console.log("이제 상품들 응답됐나??", inboundProducts);
				$.each(inboundProducts, function(index, inboundProduct) {
					var rowDown = "<tr id='sampleChargeProduct-"+index+"'>"
					rowDown += "<td><input type='checkbox' name='orderToInboundProduct' value='"+inboundProduct.no+"'/></td>";
					rowDown += "<td class='text-center'></td>";
					rowDown += "<td class='text-center'>"+inboundProduct.productCode+"</td>";
					rowDown += "<td class='text-center'>"+inboundProduct.productName+"</td>";
					rowDown += "<td class='text-center'>"+inboundProduct.deliveryDate+"</td>";
					rowDown += "<td class='text-center'>"+inboundProduct.inboundDate+"</td>";
					rowDown += "<td class='text-center'>"+inboundProduct.unit+"</td>";
					rowDown += "<td class='text-center'>"+inboundProduct.quantity+"</td>";
					rowDown += "</tr>";
					
					$("#table-inbound-product tbody").append(rowDown);
				})
			}
	
	   	})
		
	})
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	//삭제구현
	
	//삭제1 -> row만 삭제 remove
	$("#btn-remove-inbounds").click(function(){
		$(':checkbox[name=codeToSave]:checked').closest('tr').remove()
		$(':checkbox[name=orderToInboundProduct]:checked').closest('tr').remove()
	})
	//삭제2 -> db삭제
	$("#btn-delete-inbounds").click(function(){
		if($(':checkbox[name=icode]').is(":checked")){
			$.ajax({
				type: "post",
				url: "/inbound/removeInbound",
				data: $("#form-inbound").serialize(),
				success: function () {
					if($(':checkbox[name=icode]').is(":checked")){
						$(':checkbox[name=icode]:checked').closest('tr').remove()
						$(':checkbox[name=orderToInboundProduct]').closest('tr').remove()
					} 
					alert("선택한 입고의뢰 작성 내용이 삭제되었습니다.")
				}
			});
		} else{
			$.ajax({
				type: "post",
				url: "/inbound/removeInboundProducts",
				data: $("#form-inbound").serialize(),  //같이 처리되서 parameter 값이 있는거 아닌가?
				success: function () {
					if($(':checkbox[name=icode]').is(":checked")){
						$(':checkbox[name=icode]:checked').closest('tr').remove()
					} else if ($(':checkbox[name=orderToInboundProduct]').is(":checked")) {
						$(':checkbox[name=orderToInboundProduct]:checked').closest('tr').remove()
					}
					alert("선택한 입고의뢰 상품이 삭제되었습니다.")
				}
			});
		}
	})
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	var param = {};
	//모달창에서 조회버튼 클릭시 실행
	$("#btn-get-orders").click(function() {
		
		$("#table-order tbody").empty();
		
		if ($("#order-start-date").val() != "") {
			param["startDate"] = $("#order-start-date").val();
		}
		if ($("#order-end-date").val() != "") {
			param["endDate"] = $("#order-end-date").val();
		}
		if (($("#order-start-date").val() != "") && ($("#order-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#order-start-date").val() == "") && ($("#order-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url: '/inbound/list/json',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function (inboundProducts){
				var $tbody = $('#table-order tbody'); 
				
				$.each(inboundProducts, function(index, inboundProduct) {
					
					var $tr = $("<tr id='order-"+index+"'></tr>").attr('class', 'align-middle'); 
					var $td0 = $("<td><input type='checkbox' name='order' value='"+index+"'/></td>")
					var $td1 = $("<td></td>").text(inboundProduct.orderCode).attr('class','text-center'); 
					var $td2 = $("<td></td>").text(inboundProduct.orderDate).attr('class','text-center');
					var $td3 = $("<td></td>").text(inboundProduct.venderName).attr('class','text-center');
					var $td4 = $("<td></td>").text(inboundProduct.productCode).attr('class','text-center');
					var $td5 = $("<td></td>").text(inboundProduct.productName).attr('class','text-center');
					var $td6 = $("<td></td>").text(inboundProduct.unit).attr('class','text-center');
					var $td7 = $("<td></td>").text(inboundProduct.quantity).attr('class','text-center');
					var $td8 = $("<td></td>").text(inboundProduct.venderCode).attr('class','text-center');
					var $td9 = $("<td></td>").text(inboundProduct.empCode).attr('class','text-center');
					var $td10 = $("<td></td>").text(inboundProduct.empName).attr('class','text-center');
					var $td11 = $("<td></td>").text(inboundProduct.deliveryDate).attr('class','text-center');
					var $td12 = $("<td></td>").text(inboundProduct.inboundDate).attr('class','text-center');
					
					$tr.append($td0);
					$tr.append($td1);
					$tr.append($td2);
					$tr.append($td3);
					$tr.append($td4);
					$tr.append($td5);
					$tr.append($td6);
					$tr.append($td7);
					$tr.append($td8);
					$tr.append($td9);
					$tr.append($td10);
					$tr.append($td11);
					$tr.append($td12);
					
					$tbody.append($tr);
					$td8.hide();
					$td9.hide();
					$td10.hide();
					$td11.hide();
					$td12.hide();
				})
				
			}
		})
		
	})
		
	//전체선택/해제하기
	$('#allOrdersSelect').change( function(){
       	$(':checkbox[name=order]').prop('checked', $(this).prop("checked"))
	});
	//개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-order tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxInModal();
	});
	$('#allInboundsSelect').change( function(){
       	$(':checkbox[name=orderToInbound]').prop('checked', $(this).prop("checked")) 
	});
	
	$('#allInboundsSelect').change( function(){
       	$(':checkbox[name=icode]').prop('checked', $(this).prop("checked")) 
       	$(':checkbox[name=codeToSave]').prop('checked', $(this).prop("checked"))
       	changeAllCheckedCheckbox();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-inbound tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckbox();
	});
	$('#allInboundProductsSelect').change( function(){
       	$(':checkbox[name=orderToInboundProduct]').prop('checked', $(this).prop("checked")) 
       	changeAllCheckedCheckboxProduct();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-inbound-product tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxProduct();
	});
	
	
	//체크박스상태 변경1
	function changeAllCheckedCheckbox() {
		var checkboxAllCount = $('#table-inbound tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allChargesSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-inbound tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allInboundsSelect').prop("checked", false);
			$("#btn-post-inbounds").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-inbounds").prop("disabled")==true){
				$("#btn-post-inbounds").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allInboundsSelect').prop("checked", false)
		} else {
			$('#allInboundsSelect').prop("checked", true)
			
		}
	}
	//체크박스상태 변경1 - 상품
	function changeAllCheckedCheckboxProduct() {
		var checkboxAllCount = $('#table-inbound-product tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allChargeProductsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-inbound-product tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allInboundProductsSelect').prop("checked", false);
			$("#btn-post-inbounds").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-inbounds").prop("disabled")==true){
				$("#btn-post-inbounds").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allInboundProductsSelect').prop("checked", false)
		} else {
			$('#allInboundProductsSelect').prop("checked", true)
			
		}
	}
	
	//체크박스상태 변경2(모달창 안)
	function changeAllCheckedCheckboxInModal() {
		var checkboxAllCount = $('#table-order tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allOrdersSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-order tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#alOordersSelect').prop("checked", false);
			return;
		} 
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allOrdersSelect').prop("checked", false)
		} else {
			$('#allOrdersSelect').prop("checked", true)
			
		}
	}
	//오늘날짜
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//입고처리(수정) 모달창 안의 적용버튼클릭하면
	$('#btn-modify-inbound').click(function() {
		var allData = [];
		var inboundProduct = {
				passAmount: $("[name=inboundPass]").val(),
				failAmount: $("[name=inboundFail]").val(),
				amount: $("[name=inboundAmount]").val()
		};
		$("#table-inbound :checkbox[name=icode]:checked").each(function (index, checkbox) {
			var inboundDtos = {
					code: $(checkbox).closest("tr").find(":checkbox").val(),
					confirmedDate: $("[name=confirmedDate]").val(),
					stage: $(":radio[name=stage]:checked").val(),
					inboundProduct: inboundProduct
			};
			console.log("바뀔값들: ", inboundDtos);
			allData.push(inboundDtos);	
			console.log("보내져랏: ", allData);
			
		})
		$.ajax({
			type: "post",
			url: '/inbound/modifyInbound',
			data: JSON.stringify(allData),
		  	contentType: 'application/json',
		 	dataType: 'json', 
			success: function () {
				alert("입고의뢰 처리가 완료되었습니다.");
			}
		})
	})
	//모달창 안의 적용버튼클릭하면
	var groupNo = 1000;
	$('#btn-select-inbound').click(function() {
		
		$("#btn-post-inbounds").show();
		$("#btn-update-inbounds").hide();
		$("#btn-delete-inbounds").hide();
		$("#btn-remove-inbounds").show().prop("disabled", false);
		$(':checkbox[name=icode]').closest('tbody tr').remove();
		$(':checkbox[name=codeToSave]').closest('tbody tr').show();
		
		$(":checkbox[name=order]:checked").each(function (index, checkbox) {
			var selectedIndex = $(checkbox).val();
			var $tds = $("#order-"+selectedIndex).find("td");
			//그 행에 해당하는 값만 가져옴
			var date = $("#table-inbound tbody tr").find(":input[name=day-"+groupNo+"]").val();
			var orderCode = $tds.eq(1).text();
			var productCode = $tds.eq(4).text();
			var productName = $tds.eq(5).text();
			var unit = $tds.eq(6).text();
			var quantity = $tds.eq(7).text();
			var venderName = $tds.eq(3).text();
			
			var venderCode = $tds.eq(8).text(); 
			var empCode = $tds.eq(9).text();
			var empName = $tds.eq(10).text();
			var deliveryDate = $tds.eq(11).text();
			var inboundDate = $tds.eq(12).text();
			
			console.log("거래처 코드값: ", venderCode);
			
			$('#table-inbound th').eq(1).text("No")
			var date = getToday();
			var topRow = "<tr>"
				topRow += "<td><input type='checkbox' name='codeToSave' value='"+groupNo+"' checked></td>"
				topRow += "<td class='text-center'>"+groupNo+"</td>"
				topRow += "<td class='text-center'><input type='date' value='"+date+"' name='day-"+groupNo+"'></td>";
				topRow += "<td class='text-center' data-vender-code='"+venderCode+"'>"+venderName+"</td>"
				topRow += "<td class='text-center'><button type='button' class='btn btn-link' data-btn-manager-code='"+empCode+"'>"+empName+"</button></td>"
				topRow += "<td class='text-center'><input type='date' value='"+date+"' name='finishDay-"+groupNo+"'></td>"
				topRow += "<td class='text-center'>검사</td>"
				topRow += "<td class='text-center'></td>"
				topRow += "</tr>";
				$("#table-inbound tbody").append(topRow);
			
			var downRow = "<tr id='sampleChargeProduct-"+groupNo+"'>"
				downRow += "<td><input type='checkbox' name='orderToInboundProduct'value='"+groupNo+"' checked/></td>";
				downRow += "<td class='text-center'>"+groupNo+"</td>";
				downRow += "<td class='text-center'>"+productCode+"</td>";
				downRow += "<td class='text-center'>"+productName+"</td>";
				downRow += "<td class='text-center'>"+deliveryDate+"</td>";
				downRow += "<td class='text-center'>"+inboundDate+"</td>";
				downRow += "<td class='text-center'>"+unit+"</td>";
				downRow += "<td class='text-center'>"+quantity+"</td>";
				downRow += "<td class='text-center' style='display: none'>"+orderCode+"</td>";
				downRow += "</tr>";
			
			$("#table-inbound-product tbody").append(downRow);
			groupNo++;
		})
		console.log("그룹 번호:",groupNo);
		inboundModal.hide();
	})
	
	//상단과 하단을 연결
	$("#table-inbound tbody :checkbox").change(function () {
		var isDisabled = $(this).prop('checked'); //T or F
		var groupNo = $(this).val(); //1000
		
		$('#table-inbound-product tbody :checkbox[value='+groupNo+']').prop('checked', isDisabled);
	})
	
	
	//일반창에서 저장버튼 클릭시 실행	
	$('#btn-post-inbounds').click(function () { 
		console.log("실행됨");
		var arr = []; 
		
		$("#table-inbound :checkbox:checked").each(function (index, checkbox) {
			var groupNo = $(checkbox).val();
			var $topTr = $(checkbox).closest("tr");
			var empCode = '${LOGINED_EMPLOYEE.code}'; 
			var inbound = {
					empCode: empCode,
					date: $topTr.find(':input[name=day-'+groupNo+']').val(),
					venderCode: $topTr.find('td').eq(3).data('vender-code'),
					managerCode: $topTr.find('button[data-btn-manager-code]').data('btn-manager-code'),
					finishDate: $topTr.find(':input[name=finishDay-'+groupNo+']').val(),
					inboundProducts: []
			}
			//1:1
			//1:n
			$("#table-inbound-product tbody :checkbox[value='"+groupNo+"']:checked").each(function (index, checkbox) {
				var selectedIndexValue = $(checkbox).val();
				console.log("체크박스 index 값이 index가 아니고 groupNo일껄?? : ", selectedIndexValue);
				var $downTds = $(checkbox).closest("tr").find('td');
				var inboundProduct = {
						productCode: $downTds.eq(2).text(),
						productName: $downTds.eq(3).text(),
						unit: $downTds.eq(6).text(),
						quantity: $downTds.eq(7).text(),
						orderCode: $downTds.eq(8).text()
						
				}
				console.log("잘담겨라좀 1대n: ", inboundProduct);
				inbound.inboundProducts.push(inboundProduct);
			})
			arr.push(inbound);
		})
		console.log("add될 값들: ", arr)

		$.ajax({
			type: "post",
			url: '/inbound/addInbound',
			data: JSON.stringify(arr),
		  	contentType: 'application/json',
		 	dataType: 'json', 
			success: function (returnData) {
				var sizeOfData = returnData.length;
				if (sizeOfData != 0) {
					alert("입고의뢰등록이 완료되었습니다.");
					$("#table-inbound-product tbody :checkbox:checked").closest('tr').remove();
					$("#table-inbound tbody :checkbox:checked").closest('tr').remove();
				} else {
					alert("다시 시도하여 주세요");
				}
			}
		})
	}); 
})
</script>
</body>
</html>


	