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
<title>발주 등록</title>
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
						<div id="now" class="text-end mb-3"></div>
						<div class="col-10">
							<h2><strong>발주 등록/마감</strong></h2>
						</div>
						<div class="col-2">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button class="btn btn-outline-primary btn" id="btn-open-order-modal">청구 적용</button>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="hidden" name="code" id="charge-code"> <!-- 자동시퀀스로 생성된값 -->
							<div style="padding:10px;">
								사업장 <input type="text" style='text-align:center; margin-right: 15px' name="empWorkPlaceCode" id="emp-workPlace-code" value="">
								부서 <input type="text" style='text-align:center; margin-right: 15px' name="deptCode" id="dept-code" value="">
								사원 <input type="text" style='text-align:center; margin-right: 15px' name="empCode" id="emp-code" value="${LOGINED_EMPLOYEE.code }">
								발주기간 <input type="date" style='text-align:center;' style='text-align:center;' id="order-start-date" name="startDate"> ~ 
										<input type="date" style='text-align:center; margin-right: 15px' style='text-align:center;' id="order-end-date" name="endDate">
								<button type="button" class="btn btn-primary btn-sm" id="btn-get-allOrders">조회</button>
								<button type="button" class="btn btn-primary btn-sm" id="btn-post-orders">저장</button>
								<button type="button" class="btn btn-success btn-sm rm-2" id="btn-stage-orders" disabled>발주마감</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-delete-orders" disabled>삭제</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-remove-orders" disabled>비우기</button>
							</div>
							<form id="form-order">
								<table class="table" id="table-order">
									<colgroup>
										<col width="5%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="ono" id="allOrdersSelect" value="20"></th>
											<th class="text-center">발주번호</th>
											<th class="text-center">발주일자</th>
											<th class="text-center">거래처</th>
											<th class="text-center">담당자</th>
											<th class="text-center">마감구분</th>
										</tr>
									</thead>
										<tbody>
											<!-- <tr>
												<td><input type="checkbox" name="ocode" value="20"></td>
												<td>발주번호</td> ajax로 가능?
												
											</tr> -->
										</tbody>
								</table>
								<table class="table" id="table-order-product">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="10%">
										<col width="*%">
										<col width="5%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="15%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="opno" id="allOrderProductsSelect" value="20"></th>
											<th class="text-center">No</th>
											<th class="text-center">품번</th>
											<th class="text-center">품명</th>
											<th class="text-center">단위</th>
											<th class="text-center">납기일</th>
											<th class="text-center">입고예정일</th>
											<th class="text-center">발주수량</th>
											<th class="text-center">단가</th>
											<th class="text-center">공급가</th>
										</tr>
									</thead>
										<tbody>
											<!-- <tr>
											</tr> -->
										</tbody>
								</table>
							</form>
						</div>
					</div>
						<div class="modal fade" id="form-order-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">청구적용창</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row px-2 mb-2">
										<div>청구기간 <input type="date" id="charge-start-date" name="startDate" value=""/>~
										<input type="date" id="charge-end-date" name="endDate" value=""/>
										<button type="button" class="btn btn-primary btn-sm" id="btn-get-charges">조회</button>
										</div>
									</div>
									<div class="row px-2 mb-2">
										<div class="col">
											<table class="table" id="table-charge">
												<colgroup>
													<col width="5%">
													<col width="10%">
													<col width="10%">
													<col width="10%">
													<col width="*%">
													<col width="10%">
													<col width="5%">
													<col width="8%">
													<col width="8%">
													<col width="8%">
													<col width="15%">
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox" name="cno" id='allChargesSelect'></th>
														<th class="text-center">청구번호</th>
														<th class="text-center">청구일자</th>
														<th class="text-center">품번</th>
														<th class="text-center">품명</th>
														<th class="text-center">요청일</th>
														<th class="text-center">단위</th>
														<th class="text-center">청구수량</th>
														<th class="text-center">발주수량</th>
														<th class="text-center">청구잔량</th>
														<th class="text-center">주거래처</th>
													</tr>
												</thead>
												<tbody>
													<!-- 값뿌림 
														localhost/order/list?no=1&startDate=2021-07-01&endDate=2021-07-28
													-->
												</tbody>
											</table>
											
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary" id="btn-select-order">적용</button>
									<button type="button" class="btn btn-primary" id="btn-select-order-vender">일괄적용</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 거래처 -->
					<div id="modal-vender-detail" class="modal" tabindex="-1">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">거래처 상세정보</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row px-2 mb-2">
										<div> 검색 <input type="text" id="vender-name-search" name="venderName" value=""/>
										<button type="button" class="btn btn-primary btn-sm" id="btn-get-venders">조회</button>
										</div>
									</div>
									<table class="table table-bordered" id="table-vender-detail">
										<colgroup>
											<col width="20%">
											<col width="40%">
											<col width="20%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">코드</th>
												<th class="text-center">거래처명</th>
												<th class="text-center">사업자번호</th>
												<th class="text-center">대표자명</th>
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
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/ws.jsp" %>
</div>
<script>
$(function (){
	$(function() {
    	$("#now").text(new Date());
			setInterval(function() {
              $("#now").text(new Date().toLocaleString());
    	}, 1000);
    });
	$("#btn-remove-orders").hide();
	var orderModal = new bootstrap.Modal(document.getElementById("form-order-modal"), {
		keyboard: false
	})
	var venderDetailModal = new bootstrap.Modal(document.getElementById("modal-vender-detail"), {
		keyboard: false
	})
	var managerDetailModal = new bootstrap.Modal(document.getElementById("modal-manager-detail"), {
		keyboard: false
	})
	//화면상단의 청구적용 버튼 클릭시 실행
	$("#btn-open-order-modal").click(function() {
		$("#allChargesSelect").prop('checked', false);
		$("#table-charge tbody").empty();
		orderModal.show();
	});
	
	
	//일반창에서 거래처 수정
	var clickedVenderTd;
	$("#table-order tbody").on("click", ".btn-link[data-btn-vender-code]", function(){
		event.preventDefault();
		console.log("거래처 상세보기")
		clickedVenderTd = this;
		venderDetailModal.show();
	})
	$("#btn-get-venders").click(function () {
		
		var venderName = $("#vender-name-search").val();
		var $tbody = $("#table-vender-detail tbody").empty();
		$.ajax({
			url:"/vender/detail",
			data:{name: venderName},
			dataType: "json",
			success: function (response) {
				var venders = response.items;
				if (response.success && response.items != null) {
					
					$.each(venders, function(index, vender){
						var row = '';
						row += '<tr class="align-middle">';
						row +=		'<td class="text-center" id="vender-code-modal">'+vender.code+'</td>'
						row +=		'<td class="text-center" id="vender-name-modal"><button type="button" class="btn btn-link" data-vender-code-modal="'+vender.code+'">'+vender.name+'</button></td>';
						row +=		'<td class="text-center" id="vender-regNum-modal">'+vender.regNum+'</td>';
						row +=		'<td class="text-center" id="vender-repName-modal">'+vender.repName+'</td>';
						row += '</tr>';
						
						$tbody.append(row);
					})
				}
				
			}
		})
		
	})
	$("#table-vender-detail tbody").on("click", ".btn-link", function(){
		//일반창의 거래처명을 바꾼다.
		var secondVenderName = $(this).text();
		var venderCode = $(this).data('vender-code-modal');
		$(clickedVenderTd).text(secondVenderName);
		$(clickedVenderTd).attr('data-btn-vender-code', venderCode);
		venderDetailModal.hide();
		
		console.log("이제 코드까지 바뀌었나?? ", $(clickedVenderTd).attr('data-btn-vender-code'));
	})
	//일반창에서 담당자 변경하기!!
	var clickedManagerTd;
	$("#table-order tbody").on("click", ".btn-link[data-btn-manager-code]", function(){
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
	
	
	//일반창에서 발주마감 버튼 클릭시 실행
	$("#btn-stage-orders").click(function () {
		if($(':checkbox[name=ocode]:checked').length == 0){
			alert("목록이 선택되지 않았습니다.");
			return false;
		}
		var obj = [{code: $(':checkbox[name=ocode]:checked').val()}]
		$.ajax({
			type: "post",
			url: "/order/modifyOrder",
			data:JSON.stringify(obj),
			contentType:"application/json",   
			success: function () {
				$(':checkbox[name=ocode]:checked').closest('tr').remove()
				$(':checkbox[name=chargeToOrderProduct]').closest('tr').remove()
				alert("선택한 발주가 마감되었습니다.")
			}
		});
	})
	
	
	//일반창에서 조회버튼 클릭시 실행 -> 상단표만 출력
	$("#btn-get-allOrders").click(function () {
		var $tbody = $("#table-order-product tbody").empty();
		$("#allOrdersSelect").prop('checked', false);
		//버튼숨기기 -> update 계획일 가능하면 다시 풀기
		$("#btn-post-orders").hide();
		$("#btn-remove-orders").hide();
		$("#btn-update-orders").show();
		$("#btn-delete-orders").show().prop("disabled", false);
		$("#btn-stage-orders").show().prop("disabled", false);
		$('#table-order th').eq(1).text("발주번호")
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
		if ($("#charge-start-date").val() != "") {
			param["startDate"] = $("#charge-start-date").val();
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
			url: '/order/list/search',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function(orders) {
				var $tbody = $("#table-order tbody").empty();
				console.log("응답됐나??", orders);
				
				$.each(orders, function(index, order) {
					var rowUp = "<tr id='charge-"+order.code+"'>"
					rowUp += "<td><input type='checkbox' name='ocode' value='"+order.code+"'/></td>";
					rowUp += "<td class='text-center'>"+order.code+"</td>";
					rowUp += "<td class='text-center'><button type='button' class='btn btn-link' data-order-product-no='"+order.code+"'>"+order.date+"</button></td>"; 
					rowUp += "<td class='text-center'>"+order.venderName+"</td>";
					rowUp += "<td class='text-center'>"+order.managerName+"</td>";
					rowUp += "<td class='text-center'>"+order.stage+"</td>";
					rowUp += "</tr>";
					
					$tbody.append(rowUp);
					
				});
			}
		})
	})
	//index별로 누르면 조회되게 하기
	$("#table-order tbody").on('click', '.btn-link[data-order-product-no]', function(event) {
		event.preventDefault();
		$("#table-order-product tbody").empty();
		console.log('call function');
		//하단 표
		var orderCode = $(this).data("order-product-no");//버튼
	   	$.ajax({
	   		type:'get',
			url: 'list/searchOrderProduct',
			data: { orderCode:orderCode },
			contentType: 'application/json',
			dataType: 'json',		
			success: function(orderProducts) {
				console.log("이제 상품들 응답됐나??", orderProducts);
				$.each(orderProducts, function(index, orderProduct) {
					
					var formattedPrice = new Number(orderProduct.price).toLocaleString();
					var formattedSum = new Number((orderProduct.quantity)*(orderProduct.price)).toLocaleString();
					
					var rowDown = "<tr id='sampleOrderProduct-"+index+"'>"
					rowDown += "<td><input type='checkbox' name='chargeToOrderProduct' value='"+orderProduct.no+"'/></td>";
					rowDown += "<td class='text-center'></td>";
					rowDown += "<td class='text-center'>"+orderProduct.productCode+"</td>";
					rowDown += "<td class='text-center'>"+orderProduct.productName+"</td>";
					rowDown += "<td class='text-center'>"+orderProduct.unit+"</td>";
					rowDown += "<td class='text-center'>"+orderProduct.deliveryDate+"</td>";
					rowDown += "<td class='text-center'>"+orderProduct.inboundDate+"</td>";
					rowDown += "<td class='text-center'>"+orderProduct.quantity+"</td>";
					rowDown += "<td class='text-center'>"+formattedPrice+"</td>";
					rowDown += "<td class='text-center'><strong>"+formattedSum+"</strong></td>";
					rowDown += "</tr>";
					
					$("#table-order-product tbody").append(rowDown);
				})
			}
	
	   	})
		
	})
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	//삭제구현
	
	//삭제1 -> row만 삭제 remove
	$("#btn-remove-orders").click(function(){
		$(':checkbox[name=codeToSave]:checked').closest('tr').remove()
		$(':checkbox[name=chargeToOrderProduct]:checked').closest('tr').remove()
	})
	//삭제2 -> db삭제
	$("#btn-delete-orders").click(function(){
		if($(':checkbox[name=ocode]').is(":checked")){
			$.ajax({
				type: "post",
				url: "/order/removeOrder",
				data: $("#form-order").serialize(),
				success: function () {
					if($(':checkbox[name=ocode]').is(":checked")){
						$(':checkbox[name=ocode]:checked').closest('tr').remove()
						$(':checkbox[name=chargeToOrderProduct]').closest('tr').remove()
					} 
					alert("선택한 발주 작성 내용이 삭제되었습니다.")
				}
			});
		} else {
			$.ajax({
				type: "post",
				url: "/order/removeOrderProducts",
				data: $("#form-order").serialize(),
				success: function () {
					if($(':checkbox[name=ocode]').is(":checked")){
						$(':checkbox[name=ocode]:checked').closest('tr').remove()
					} else if ($(':checkbox[name=chargeToOrderProduct]').is(":checked")) {
						$(':checkbox[name=chargeToOrderProduct]:checked').closest('tr').remove()
					}
					alert("선택한 발주 상품이 삭제되었습니다.")
				}
			});
		}
	})
	///////////////////////////////////////////////////////////////////////////////////////////////
	var param = {};
	//모달창에서 조회버튼 클릭시 실행
	$("#btn-get-charges").click(function() {
		
		$("#table-charge tbody").empty();
		
		if ($("#charge-start-date").val() != "") {
			param["startDate"] = $("#charge-start-date").val();
		}
		if ($("#charge-end-date").val() != "") {
			param["endDate"] = $("#charge-end-date").val();
		}
		if (($("#charge-start-date").val() != "") && ($("#charge-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#charge-start-date").val() == "") && ($("#charge-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url: '/order/list/json',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function (orderProducts){
				var $tbody = $('#table-charge tbody'); 
				
				$.each(orderProducts, function(index, orderProduct) {
					
					var $tr = $("<tr id='charge-"+index+"'></tr>").attr('class', 'align-middle'); 
					var $td0 = $("<td><input type='checkbox' name='charge' value='"+index+"'/></td>")
					var $td1 = $("<td></td>").text(orderProduct.chargeCode).attr('class','text-center'); 
					var $td2 = $("<td></td>").text(orderProduct.chargeDate).attr('class','text-center'); 
					var $td3 = $("<td></td>").text(orderProduct.productCode).attr('class','text-center');
					var $td4 = $("<td></td>").text(orderProduct.productName).attr('class','text-center');
					var $td5 = $("<td></td>").text(orderProduct.requiredDate).attr('class','text-center');
					var $td6 = $("<td></td>").text(orderProduct.unit).attr('class','text-center');
					var $td7 = $("<td></td>").text(orderProduct.requiredOrdersAmount).attr('class','text-center');
					var $td8 = $("<td></td>").text("0").attr('class','text-center'); //발주수량
					var $td9 = $("<td></td>").text(orderProduct.requiredOrdersAmount).attr('class','text-center'); //청구잔량
					var $td10 = $("<td></td>").text(orderProduct.venderName).attr('class','text-center'); 
					
					var $td11 = $("<td></td>").text(orderProduct.deliveryDate).attr('class','text-center'); 
					var $td12 = $("<td></td>").text(orderProduct.requiredOrdersAmount).attr('class','text-center');
					var $td13 = $("<td></td>").text(new Number(orderProduct.price).toLocaleString()).attr('class','text-center'); 
					var $td14 = $("<td></td>").text(orderProduct.empName).attr('class','text-center'); 
					var $td15 = $("<td></td>").text(orderProduct.venderCode).attr('class','text-center'); 
					var $td16 = $("<td></td>").text(orderProduct.empCode).attr('class','text-center'); 
					
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
					$tr.append($td13);
					$tr.append($td14);
					$tr.append($td15);
					$tr.append($td16);
					
					$tbody.append($tr);
					$td11.hide();
					$td12.hide();
					$td13.hide();
					$td14.hide();
					$td15.hide();
					$td16.hide();
					
				})
				
			}
		})
		
	})
		
	//전체선택/해제하기
	$('#allChargesSelect').change( function(){
       	$(':checkbox[name=charge]').prop('checked', $(this).prop("checked"))
	});
	//개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-charge tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxInModal();
	});
	$('#allOrdersSelect').change( function(){
       	$(':checkbox[name=chargeToOrder]').prop('checked', $(this).prop("checked")) 
	});
	
	$('#allOrdersSelect').change( function(){
       	$(':checkbox[name=ocode]').prop('checked', $(this).prop("checked")) 
       	$(':checkbox[name=codeToSave]').prop('checked', $(this).prop("checked"))
       	changeAllCheckedCheckbox();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-order tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckbox();
	});
	$('#allOrderProductsSelect').change( function(){
       	$(':checkbox[name=chargeToOrderProduct]').prop('checked', $(this).prop("checked")) 
       	changeAllCheckedCheckboxProduct();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-order-product tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxProduct();
	});
	
	
	//체크박스상태 변경1
	function changeAllCheckedCheckbox() {
		var checkboxAllCount = $('#table-order tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allOrdersSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-order tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allOrdersSelect').prop("checked", false);
			$("#btn-post-orders").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-orders").prop("disabled")==true){
				$("#btn-post-orders").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allOrdersSelect').prop("checked", false)
		} else {
			$('#allOrdersSelect').prop("checked", true)
			
		}
	}
	//체크박스상태 변경1 - 상품
	function changeAllCheckedCheckboxProduct() {
		var checkboxAllCount = $('#table-order-product tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allOrderProductsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-order-product tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allOrderProductsSelect').prop("checked", false);
			$("#btn-post-orders").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-orders").prop("disabled")==true){
				$("#btn-post-orders").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allOrderProductsSelect').prop("checked", false)
		} else {
			$('#allOrderProductsSelect').prop("checked", true)
			
		}
	}
	
	//체크박스상태 변경2(모달창 안)
	function changeAllCheckedCheckboxInModal() {
		var checkboxAllCount = $('#table-charge tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allChargesSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-charge tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allChargesSelect').prop("checked", false);
			return;
		} 
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allChargesSelect').prop("checked", false)
		} else {
			$('#allChargesSelect').prop("checked", true)
			
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
	//모달창 안의 일괄적용버튼 클릭하면
	var param = {};
	var groupNo = 1000;
	var prevItem;
	$('#btn-select-order-vender').click(function() {
		$("#btn-post-orders").show();
		$("#btn-update-orders").hide();
		$("#btn-delete-orders").hide();
		$("#btn-stage-orders").hide();
		$("#btn-remove-orders").show().prop("disabled", false);
		$(':checkbox[name=ocode]').closest('tbody tr').remove();
		$(':checkbox[name=codeToSave]').closest('tbody tr').show();
		$('#table-order th').eq(1).text("No")
		console.log("체크박스의미없당...");
		$("#table-order tbody").empty();
		
		if ($("#charge-start-date").val() != "") {
			param["startDate"] = $("#charge-start-date").val();
		}
		if ($("#charge-end-date").val() != "") {
			param["endDate"] = $("#charge-end-date").val();
		}
		if (($("#charge-start-date").val() != "") && ($("#charge-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#charge-start-date").val() == "") && ($("#charge-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url: '/order/list/json',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function(orderProducts) {
				var $tbody = $("#table-order tbody").empty();
				var date = getToday();
				console.log("응답됐나??", orderProducts);
				$.each(orderProducts, function(index, orderProduct) {
					if (!prevItem || prevItem.venderCode != orderProduct.venderCode) {
						groupNo++;
						var topRow = "<tr>"
							topRow += "<td><input type='checkbox' name='codeToSave' value='"+groupNo+"' checked></td>"
							topRow += "<td class='text-center'>"+groupNo+"</td>"
							topRow += "<td class='text-center'><input type='date' value='"+date+"' name='day-"+groupNo+"'></td>";
							topRow += "<td class='text-center'><button type='button' class='btn btn-link' data-btn-vender-code='"+orderProduct.venderCode+"'>"+orderProduct.venderName+"</button></td>"
							topRow += "<td class='text-center'><button type='button' class='btn btn-link' data-btn-manager-code='"+orderProduct.empCode+"'>"+orderProduct.empName+"</button></td>"
							topRow += "<td class='text-center'>진행</td>"
							topRow += "</tr>";
						$("#table-order tbody").append(topRow);
					}
					var downRow = "<tr id='sampleChargeProduct-"+groupNo+"'>"
						downRow += "<td><input type='checkbox' name='chargeToOrderProduct' value='"+groupNo+"' checked/></td>";
						downRow += "<td class='text-center'>"+groupNo+"</td>";
						downRow += "<td class='text-center'>"+orderProduct.productCode+"</td>";
						downRow += "<td class='text-center'>"+orderProduct.productName+"</td>";
						downRow += "<td class='text-center'>"+orderProduct.unit+"</td>";
						downRow += "<td class='text-center'>"+orderProduct.deliveryDate+"</td>";
						downRow += "<td class='text-center'><input type='date' value='"+date+"' name='inboundDay-"+groupNo+"'></td></td>";
						downRow += "<td class='text-center'><input type='number' min='0' value='"+orderProduct.requiredOrdersAmount+"' name='quantity-"+groupNo+"'></td></td>";
						downRow += "<td class='text-center' data-price='"+orderProduct.price+"'>"+new Number(orderProduct.price).toLocaleString()+"</td>"
						downRow += "<td class='text-center'><input type='text' min='0' value='"+new Number(orderProduct.price*orderProduct.requiredOrdersAmount).toLocaleString()+"' name='sum-"+groupNo+"'></td></td>";
						downRow += "<td class='text-center' style='display: none'>"+orderProduct.chargeCode+"</td>";
						downRow += "</tr>";
				
					$("#table-order-product tbody").append(downRow);
					
					prevItem = orderProduct;
				});
			}
		})		
		orderModal.hide();
	});
	//모달창 안의 적용버튼클릭하면
	var groupNo = 1000;
	$('#btn-select-order').click(function() {
		
		$("#btn-post-orders").show();
		$("#btn-update-orders").hide();
		$("#btn-delete-orders").hide();
		$("#btn-stage-orders").hide();
		$("#btn-remove-orders").show().prop("disabled", false);
		$(':checkbox[name=ocode]').closest('tbody tr').remove();
		$(':checkbox[name=codeToSave]').closest('tbody tr').show();
			
		
		$(":checkbox[name=charge]:checked").each(function (index, checkbox) {
			var selectedIndex = $(checkbox).val();
			var $tds = $("#charge-"+selectedIndex).find("td"); //find는 자식을 찾음
			//그 행에 해당하는 값만 가져옴
			var date = getToday();
			var venderName = $tds.eq(10).text();
			var chargeCode = $tds.eq(1).text();
			var productCode = $tds.eq(3).text();
			var productName = $tds.eq(4).text();
			var unit = $tds.eq(6).text();
			var deliveryDate = $tds.eq(11).text(); 
			var quantity = $tds.eq(12).text(); 
			var formattedPrice = $tds.eq(13).text(); 
	        var price = formattedPrice.replace(/,/g, '');
			var empName = $tds.eq(14).text();
			var venderCode = $tds.eq(15).text();
			var empCode = $tds.eq(16).text();
			var sum = price*quantity;
			var formattedSum = new Number(price*quantity).toLocaleString();
			console.log("오늘? 어느? 날짜 값: ", date);
			console.log("담당자: ", empName);
			console.log("총 값: ", quantity, price, sum);
			$('#table-order th').eq(1).text("No")
			
			var date = getToday();
			var topRow = "<tr>"
				topRow += "<td><input type='checkbox' name='codeToSave' value='"+groupNo+"' checked></td>"
				topRow += "<td class='text-center'>"+groupNo+"</td>"
				topRow += "<td class='text-center'><input type='date' value='"+date+"' name='day-"+groupNo+"'></td>";
				topRow += "<td class='text-center'><button type='button' class='btn btn-link' data-btn-vender-code='"+venderCode+"'>"+venderName+"</button></td>"
				topRow += "<td class='text-center'><button type='button' class='btn btn-link' data-btn-manager-code='"+empCode+"'>"+empName+"</button></td>"
				topRow += "<td class='text-center'>진행</td>"
				topRow += "</tr>";
			$("#table-order tbody").append(topRow);
			
			var downRow = "<tr id='sampleChargeProduct-"+groupNo+"'>"
				downRow += "<td><input type='checkbox' name='chargeToOrderProduct' value='"+groupNo+"' checked/></td>";
				downRow += "<td class='text-center'>"+groupNo+"</td>";
				downRow += "<td class='text-center'>"+productCode+"</td>";
				downRow += "<td class='text-center'>"+productName+"</td>";
				downRow += "<td class='text-center'>"+unit+"</td>";
				downRow += "<td class='text-center'>"+deliveryDate+"</td>";
				downRow += "<td class='text-center'><input type='date' value='"+date+"' name='inboundDay-"+groupNo+"'></td></td>";
				downRow += "<td class='text-center'><input type='number' min='0' value='"+quantity+"' name='quantity-"+groupNo+"'></td></td>";
				downRow += "<td class='text-center' data-price='"+price+"'>"+formattedPrice+"</td>"
				downRow += "<td class='text-center'><input type='text' min='0' value='"+formattedSum+"' name='sum-"+groupNo+"'></td></td>";
				downRow += "<td class='text-center' style='display: none'>"+chargeCode+"</td>";
				downRow += "</tr>";
			
			$("#table-order-product tbody").append(downRow);
			groupNo++;
		})
		console.log("그룹 번호:",groupNo);
		orderModal.hide();
		
	})
	//가격변경
	$("#table-order-product tbody").on('keyup change', ':input[name^=quantity]', function() {
		
	   	var quantity = $(this).val();
	   	var price = $(this).parent().next().data('price');
	
	  	var sum = quantity * price;
	   	$(this).parent().next().next().find(":input[name^=sum]").val(new Number(sum).toLocaleString());
	})

	//상단과 하단을 연결
	$("#table-order tbody :checkbox").change(function () {
		var isDisabled = $(this).prop('checked'); //T or F
		var groupNo = $(this).val(); //1000
		
		$('#table-order-product tbody :checkbox[value='+groupNo+']').prop('checked', isDisabled);
	})
	
	
	//일반창에서 저장버튼 클릭시 실행	
	$('#btn-post-orders').click(function () { 
		console.log("실행됨");
		var orders = []; 
		
		$("#table-order :checkbox:checked").each(function (index, checkbox) {
			var groupNo = $(checkbox).val();
			var $topTr = $(checkbox).closest("tr");
			var empCode = '${LOGINED_EMPLOYEE.code}'; 
			var order = {
					empCode: empCode,
					date: $topTr.find(':input[name=day-'+groupNo+']').val(),
					venderCode: $topTr.find('button[data-btn-vender-code]').data('btn-vender-code'),
					managerCode: $topTr.find('button[data-btn-manager-code]').data('btn-manager-code'),
					orderProducts: []
			}
			//1:1
			//1:n
			$("#table-order-product tbody :checkbox[value='"+groupNo+"']:checked").each(function (index, checkbox) {
				var selectedIndexValue = $(checkbox).val();
				console.log("체크박스 index 값이 index가 아니고 groupNo일껄?? : ", selectedIndexValue);
				var $downTds = $(checkbox).closest("tr").find('td');
				var orderProduct = {
						productCode: $downTds.eq(2).text(),
						inboundDate: $downTds.find(':input[name=inboundDay-'+groupNo+']').val(),
						quantity: $downTds.find(':input[name=quantity-'+groupNo+']').val(),
						sum: $downTds.find(':input[name=sum-'+groupNo+']').val().replace(/,/g, ''),
						chargeCode: $downTds.eq(10).text(),
						deliveryDate: $downTds.eq(5).text()
				}
				console.log("잘담겨라좀 1대n: ", orderProduct);
				order.orderProducts.push(orderProduct);
				
				
			})
			orders.push(order);
		})
		console.log("add될 값들: ", orders)
		
	
		$.ajax({
			type: "post",
			url: '/order/addOrder',
			data: JSON.stringify(orders),
		  	contentType: 'application/json',
		 	dataType: 'json', 
			success: function (returnData) {
				var sizeOfData = returnData.length;
				if (sizeOfData != 0) {
					alert("발주등록이 완료되었습니다.");
					$("table-order-product tr").remove();
					$("table-order tr").remove();
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

