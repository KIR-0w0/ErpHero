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
<title>청구 등록</title>
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
							<h2><strong>청구 등록</strong></h2>
						</div>
						<div class="col-2">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button class="btn btn-outline-primary btn me-md-2" id="btn-open-charge-modal">소요량 적용</button>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div style="padding:10px;">
								사업장 <input type="text" style="text-align:center; margin-right: 15px" name="empWorkPlaceCode" id="emp-workPlace-code" value="">
								부서 <input type="text" style="text-align:center; margin-right: 15px" name="deptCode" id="dept-code" value="">
								사원 <input type="text" style="text-align:center; margin-right: 15px" name="empCode" id="emp-code" value="${LOGINED_EMPLOYEE.code }">
								요청일자 <input type="date" style="text-align:center;" id="planning-start-date" name="startDate"> ~ 
										<input type="date" style="text-align:center; margin-right: 15px" id="planning-end-date" name="endDate">
								<button type="button" class="btn btn-primary btn-sm" id="btn-get-allCharges">조회</button>
								<button type="button" class="btn btn-primary btn-sm" id="btn-post-charges">저장</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-delete-charges" disabled>삭제</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-remove-charges" disabled>비우기</button>
							</div>
							<form id="form-charge">
								<table class="table" id="table-charge">
									<colgroup>
										<col width="5%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="cno" id="allChargesSelect" value="20"></th>
											<th class="text-center">청구번호</th>
											<th class="text-center">청구일자</th>
											<th class="text-center">청구자</th>
											<th class="text-center"></th>
											<th class="text-center"></th>
											<th class="text-center"></th>
											<th class="text-center"></th>
											<th class="text-center"></th>
											<th class="text-center"></th>
											<th class="text-center"></th>
										</tr>
									</thead>
										<tbody>
											<!-- <tr>
												<td><input type="checkbox" name="pcode" value="20"></td>
												<td>청구번호</td> ajax로 가능?
												<td>청구일자</td>
												<td>청구자</td>
											</tr> -->
										</tbody>
								</table>
								<table class="table" id="table-charge-product">
									<colgroup>
										<col width="5%">
										<col width="3%">
										<col width="10%">
										<col width="*%">
										<col width="10%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="15%">
									</colgroup>
									<thead class="table-warning">
										<tr>
											<th><input type="checkbox" name="cpno" id="allChargeProductsSelect" value="20"></th>
											<th class="text-center">No</th>
											<th class="text-center">품번</th>
											<th class="text-center">품명</th>
											<th class="text-center">요청일</th>
											<th class="text-center">재고단위</th>
											<th class="text-center">재고단위수량</th>
											<th class="text-center">청구단위</th>
											<th class="text-center">청구단위수량</th>
											<th class="text-center">청구구분</th>
											<th class="text-center">주거래처</th>
											<th class="text-center"></th>
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
					<div class="modal fade" id="form-charge-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">소요량 적용</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row px-2 mb-2">
									<div>소요예정일 <input type="date" id="reqAmount-start-date" name="startDate" value=""/>~
									<input type="date" id="reqAmount-end-date" name="endDate" value=""/>
									<button type="button" class="btn btn-primary btn-sm" id="btn-get-reqAmounts">조회</button>
									</div>
								</div>
								<div class="row px-2 mb-2">
									<div class="col">
										<table class="table" id="table-reqAmount">
											<colgroup>
												<col width="5%">
												<col width="15%">
												<col width="15%">
												<col width="15%">
												<col width="*%">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<thead>
												<tr>
													<th><input type="checkbox" name="rno" id='allReqAmountsSelect'></th>
													<th class="text-center">소요일자</th>
													<th class="text-center">발주예정일</th>
													<th class="text-center">품번</th>
													<th class="text-center">품명</th>
													<th class="text-center">단위</th>
													<th class="text-center">소요수량</th>
												</tr>
											</thead>
											<tbody>
												<!-- 값뿌림 
													localhost/planning/list?no=1&startDate=2021-07-01&endDate=2021-07-28
												-->
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" id="btn-select-charge">적용</button>
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
					<div class="modal fade" id="form-charge-update-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">청구수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row px-2 mb-2">
										<label>청구일자</label>
										<input type="date" class="form-control" id="charge-date" name="chargeDate" value=""/>
										<label>청구자</label>
										<input type="text" class="form-control" id="charge-empName" name="empName" value=""/>
									</div>
									<div class="row px-2 mb-2">
										<div class="col">
											<table class="table" id="table-reqAmount-update">
												<colgroup>
													<col width="5%">
													<col width="15%">
													<col width="15%">
													<col width="15%">
													<col width="*%">
													<col width="10%">
													<col width="15%">
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox" name="rno" id='allReqAmountsSelect'></th>
														<th class="text-center">소요일자</th>
														<th class="text-center">발주예정일</th>
														<th class="text-center">품번</th>
														<th class="text-center">품명</th>
														<th class="text-center">단위</th>
														<th class="text-center">소요수량</th>
													</tr>
												</thead>
												<tbody>
													<!-- 값뿌림 
														localhost/planning/list?no=1&startDate=2021-07-01&endDate=2021-07-28
													-->
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary" id="btn-select-charge">적용</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function (){
	$("#btn-remove-charges").hide();
	var chargeModal = new bootstrap.Modal(document.getElementById("form-charge-modal"), {
		keyboard: false
	})
	var chargeUpdateModal = new bootstrap.Modal(document.getElementById("form-charge-update-modal"), {
		keyboard: false
	})
	var venderDetailModal = new bootstrap.Modal(document.getElementById("modal-vender-detail"), {
		keyboard: false
	})
	//화면상단의 소요량적용 버튼 클릭시 실행
	$("#btn-open-charge-modal").click(function() {
		$("#allReqAmountsSelect").prop('checked', false);
		$("#table-reqAmount tbody").empty();
		chargeModal.show();
	});
	
	//일반창에서 수정 버튼 클릭시
	$("#btn-update-charges").click(function() {
		chargeUpdateModal.show();
	});
	
	//일반창에서 거래처 수정
	var clickedVenderTd;
	$("#table-charge-product tbody").on("click", ".btn-link", function(){
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
		$(clickedVenderTd).attr('data-vender-code', venderCode);
		venderDetailModal.hide();
		
		console.log("이제 코드까지 바뀌었나?? ", $(clickedVenderTd).attr('data-vender-code'));
	})
	//일반창에서 조회버튼 클릭시 실행 -> 상단표만 출력
	$("#btn-get-allCharges").click(function () {
		var $tbody = $("#table-charge-product tbody").empty();
		$("#allChargesSelect").prop('checked', false);
		//버튼숨기기 -> update 계획일 가능하면 다시 풀기
		$("#btn-post-charges").hide();
		$("#btn-remove-charges").hide();
		$("#btn-update-charges").show();
		$("#btn-delete-charges").show().prop("disabled", false);
		$('#table-charge th').eq(1).text("청구번호")
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
			url: '/charge/list/search',
			data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
			contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
			dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
			success: function(charges) {
				var $tbody = $("#table-charge tbody").empty();
				console.log("응답됐나??", charges);
				
				$.each(charges, function(index, charge) {
					var rowUp = "<tr id='charge-"+charge.code+"'>"
					rowUp += "<td><input type='checkbox' name='ccode' value='"+charge.code+"'/></td>";
					rowUp += "<td class='text-center'>"+charge.code+"</td>";
					rowUp += "<td class='text-center'><button type='button' class='btn btn-link' data-charge-product-no='"+charge.code+"'>"+charge.date+"</button></td>"; 
					rowUp += "<td class='text-center'>"+charge.writerName+"</td>";
					rowUp += "</tr>";
					
					$tbody.append(rowUp);
				
				});
			}
		})
	})
	//ajax 한동작에 대해 하나의 일만 실행 (윗조회화 버튼 조회는 다른 동작이다. )
	//index별로 누르면 조회되게 하기
	$("#table-charge tbody").on('click', '.btn-link', function(event) {
		event.preventDefault();
		$("#table-charge-product tbody").empty();
		console.log('call function');
		//하단 표
		var chargeCode = $(this).data("charge-product-no");//버튼
	   	$.ajax({
	   		type:'get',
			url: 'list/searchChargeProduct',
			data: { chargeCode:chargeCode },
			contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
			dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
			success: function(chargeProducts) {
				console.log("이제 상품들 응답됐나??", chargeProducts);
				$.each(chargeProducts, function(index, chargeProduct) {
					var rowDown = "<tr id='sampleChargeProduct-"+index+"'>"
					rowDown += "<td><input type='checkbox' name='reqAmountToChargeProduct' value='"+chargeProduct.no+"'/></td>";
					rowDown += "<td class='text-center'></td>";
					rowDown += "<td class='text-center'>"+chargeProduct.productCode+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.productName+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.requiredDate+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.unit+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.requiredOrdersAmount+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.unit+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.requiredOrdersAmount+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.procureType+"</td>";
					rowDown += "<td class='text-center'>"+chargeProduct.venderName+"</td>";
					rowDown += "<td class='text-center'></td>";
					rowDown += "</tr>";
					
					$("#table-charge-product tbody").append(rowDown);
				})
			}
	
	   	})
		
	})
	
   
	///////////////////////////////////////////////////////////////////////////////////////////////
	//삭제구현
	
	//삭제1 -> row만 삭제 remove
	$("#btn-remove-charges").click(function(){
		$(':checkbox[name=codeToSave]:checked').closest('tr').remove()
		$(':checkbox[name=reqAmountToChargeProduct]:checked').closest('tr').remove()
	})
	//삭제2 -> db삭제
	$("#btn-delete-charges").click(function(){
		if($(':checkbox[name=ccode]').is(":checked")){
			$.ajax({
				type: "post",
				url: "/charge/removeCharge",
				data: $("#form-charge").serialize(),
				success: function () {
					if($(':checkbox[name=ccode]').is(":checked")){
						$(':checkbox[name=ccode]:checked').closest('tr').remove()
						$(':checkbox[name=reqAmountToChargeProduct]').closest('tr').remove()
					} 
					alert("선택한 청구 작성 내용이 삭제되었습니다.")
				}
			});
		} else {
			$.ajax({
				type: "post",
				url: "/charge/removeChargeProducts",
				data: $("#form-charge").serialize(),
				success: function () {
					if($(':checkbox[name=ccode]').is(":checked")){
						$(':checkbox[name=ccode]:checked').closest('tr').remove()
					} else if ($(':checkbox[name=reqAmountToChargeProduct]').is(":checked")) {
						$(':checkbox[name=reqAmountToChargeProduct]:checked').closest('tr').remove()
					}
					alert("선택한 청구 상품이 삭제되었습니다.")
				}
			});
		}
	})
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	var param = {};
	//모달창에서 조회버튼 클릭시 실행
	$("#btn-get-reqAmounts").click(function() {
		
		$("#table-reqAmount tbody").empty();
		
		if ($("#reqAmount-start-date").val() != "") {
			param["startDate"] = $("#reqAmount-start-date").val();
		}
		if ($("#reqAmount-end-date").val() != "") {
			param["endDate"] = $("#reqAmount-end-date").val();
		}
		if (($("#reqAmount-start-date").val() != "") && ($("#reqAmount-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#reqAmount-start-date").val() == "") && ($("#reqAmount-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url: '/charge/list/json',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function (chargeProducts){
				var $tbody = $('#table-reqAmount tbody'); 
				
				$.each(chargeProducts, function(index, chargeProduct) {
					
					var $tr = $("<tr id='reqAmount-"+index+"'></tr>").attr('class', 'align-middle'); 
					var $td0 = $("<td><input type='checkbox' name='reqAmount' value='"+index+"'/></td>")
					var $td1 = $("<td></td>").text(chargeProduct.requiredDate).attr('class','text-center'); 
					var $td2 = $("<td></td>").text(chargeProduct.requiredOrdersDate).attr('class','text-center');
					var $td3 = $("<td></td>").text(chargeProduct.productCode).attr('class','text-center');
					var $td4 = $("<td></td>").text(chargeProduct.productName).attr('class','text-center');
					var $td5 = $("<td></td>").text(chargeProduct.unit).attr('class','text-center');
					var $td6 = $("<td></td>").text(chargeProduct.requiredOrdersAmount).attr('class','text-center');
					var $td7 = $("<td></td>").text(chargeProduct.procureType).attr('class','text-center');
					var $td8 = $("<td></td>").text(chargeProduct.requiredNo).attr('class','text-center');
					var $td9 = $("<td></td>").text(chargeProduct.venderCode).attr('class','text-center');
					var $td10 = $("<td></td>").text(chargeProduct.requiredOrdersAmount).attr('class','text-center');
					var $td11 = $("<td></td>").text(chargeProduct.venderCode).attr('class','text-center');
					var $td12 = $("<td></td>").text(chargeProduct.venderName).attr('class','text-center');
					var $td13 = $("<td></td>").text(chargeProduct.empCode).attr('class','text-center');
					
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
					
					$tbody.append($tr);
					$td7.hide();
					$td8.hide();
					$td9.hide();
					$td10.hide();
					$td11.hide();
					$td12.hide();
					$td13.hide();
				})
				
			}
		})
		
	})
		
	//전체선택/해제하기
	$('#allReqAmountsSelect').change( function(){
       	$(':checkbox[name=reqAmount]').prop('checked', $(this).prop("checked"))
	});
	//개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-reqAmount tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxInModal();
	});
	$('#allChargesSelect').change( function(){
       	$(':checkbox[name=reqAmountToCharge]').prop('checked', $(this).prop("checked")) 
	});
	
	$('#allChargesSelect').change( function(){
       	$(':checkbox[name=ccode]').prop('checked', $(this).prop("checked")) 
       	$(':checkbox[name=codeToSave]').prop('checked', $(this).prop("checked"))
       	changeAllCheckedCheckbox();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-charge tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckbox();
	});
	$('#allChargeProductsSelect').change( function(){
       	$(':checkbox[name=reqAmountToChargeProduct]').prop('checked', $(this).prop("checked")) 
       	changeAllCheckedCheckboxProduct();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-charge-product tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxProduct();
	});
	
	
	//체크박스상태 변경1
	function changeAllCheckedCheckbox() {
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
			$("#btn-post-charges").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-charges").prop("disabled")==true){
				$("#btn-post-charges").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allChargesSelect').prop("checked", false)
		} else {
			$('#allChargesSelect').prop("checked", true)
			
		}
	}
	//체크박스상태 변경1 - 상품
	function changeAllCheckedCheckboxProduct() {
		var checkboxAllCount = $('#table-charge-product tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allChargeProductsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-charge-product tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allChargeProductsSelect').prop("checked", false);
			$("#btn-post-charges").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-charges").prop("disabled")==true){
				$("#btn-post-charges").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allChargeProductsSelect').prop("checked", false)
		} else {
			$('#allChargeProductsSelect').prop("checked", true)
			
		}
	}
	
	//체크박스상태 변경2(모달창 안)
	function changeAllCheckedCheckboxInModal() {
		var checkboxAllCount = $('#table-reqAmount tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allReqAmountsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-reqAmount tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allReqAmountsSelect').prop("checked", false);
			return;
		} 
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allReqAmountsSelect').prop("checked", false)
		} else {
			$('#allReqAmountsSelect').prop("checked", true)
			
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
	//모달창 안의 적용버튼클릭하면
	var groupNo = 1000;
	$('#btn-select-charge').click(function() {
		
		$("#btn-post-charges").show();
		$("#btn-update-charges").hide();
		$("#btn-delete-charges").hide();
		$("#btn-remove-charges").show().prop("disabled", false);
		$(':checkbox[name=ccode]').closest('tbody tr').remove();
		$(':checkbox[name=codeToSave]').closest('tbody tr').show();
		
		var writerName = '${LOGINED_EMPLOYEE.name}'; 
		(function () {
			$('#table-charge th').eq(1).text("No")
			var date = getToday();
			var topRow = "<tr>"
				topRow += "<td><input type='checkbox' name='codeToSave' value='"+groupNo+"' checked></td>"
				topRow += "<td class='text-center'>"+groupNo+"</td>"
				topRow += "<td class='text-center'><input type='date' style='text-align:center;' value='"+date+"' name='day-"+groupNo+"'></td>";
				topRow += "<td class='text-center'>"+writerName+"</td>"
				topRow += "</tr>";
				$("#table-charge tbody").append(topRow);
		})();
		
		
		$(":checkbox[name=reqAmount]:checked").each(function (index, checkbox) {
			var selectedIndex = $(checkbox).val();
			var $tds = $("#reqAmount-"+selectedIndex).find("td"); //find는 자식을 찾음
			//그 행에 해당하는 값만 가져옴
			var date = $("#table-charge tbody tr").find(":input[name=day-"+groupNo+"]").val();
			var productCode = $tds.eq(3).text();
			var productName = $tds.eq(4).text();
			var unit = $tds.eq(5).text();
			var amount = $tds.eq(10).text();
			var requiredDate = $tds.eq(1).text();
			var venderName = $tds.eq(12).text();
			
			var venderCode = $tds.eq(9).text(); 
			var empCode = $tds.eq(13).text();
			var procureType = $tds.eq(7).text();
			var requiredNo = $tds.eq(8).text();
			
			console.log("청구구분 값: ", procureType);
			console.log("오늘? 어느? 날짜 값: ", date);
			console.log("거래처 코드값: ", venderCode);
			
			
			var downRow = "<tr id='sampleChargeProduct-"+groupNo+"'>"
				downRow += "<td><input type='checkbox' name='reqAmountToChargeProduct'value='"+groupNo+"' checked/></td>";
				downRow += "<td class='text-center'>"+groupNo+"</td>";
				downRow += "<td class='text-center'>"+productCode+"</td>";
				downRow += "<td class='text-center'>"+productName+"</td>";
				downRow += "<td class='text-center'>"+requiredDate+"</td>";
				downRow += "<td class='text-center'>"+unit+"</td>";
				downRow += "<td class='text-center'>"+amount+"</td>";
				downRow += "<td class='text-center'>"+unit+"</td>";
				downRow += "<td class='text-center'>"+amount+"</td>";
				downRow += "<td class='text-center'>"+procureType+"</td>";
				downRow += "<td class='text-center'><button type='button' class='btn btn-link' data-vender-code='"+venderCode+"'>"+venderName+"</button></td>";
				downRow += "<td class='text-center' style='display: none'>"+venderCode+"</td>";
				downRow += "<td class='text-center' style='display: none'>"+requiredNo+"</td>";
				downRow += "</tr>";
			
			$("#table-charge-product tbody").append(downRow);
			
		})
		groupNo++;
		console.log("그룹 번호:",groupNo);
		chargeModal.hide();
	})
	
	//상단과 하단을 연결
	$("#table-charge tbody :checkbox").change(function () {
		var isDisabled = $(this).prop('checked'); //T or F
		var groupNo = $(this).val(); //1000
		
		$('#table-charge-product tbody :checkbox[value='+groupNo+']').prop('checked', isDisabled);
	})
	
	
	//일반창에서 저장버튼 클릭시 실행	
	$('#btn-post-charges').click(function () { 
		console.log("실행됨");
		var arr = []; 
		
		$("#table-charge :checkbox:checked").each(function (index, checkbox) {
			var groupNo = $(checkbox).val();
			var $topTr = $(checkbox).closest("tr");
			var empcode = '${LOGINED_EMPLOYEE.code }';
			var empName = '${LOGINED_EMPLOYEE.name }';
			console.log("세션 저장된 사원이름:" , empName);
			var charge = {
					empCode: empcode,
					date: $topTr.find(':input[name=day-'+groupNo+']').val(),
					writerName: empName,
					chargeProducts: []
			}
			//1:1
			//1:n
			$("#table-charge-product tbody :checkbox[value='"+groupNo+"']:checked").each(function (index, checkbox) {
				var selectedIndexValue = $(checkbox).val();
				console.log("체크박스 index 값이 index가 아니고 groupNo일껄?? : ", selectedIndexValue);
				var $downTds = $(checkbox).closest("tr").find('td');
				var chargeProduct = {
						productCode: $downTds.eq(2).text(),
						requiredDate: $downTds.eq(4).text(),
						unit: $downTds.eq(7).text(),
						amount: $downTds.eq(8).text(),
						
						venderCode: $downTds.eq(10).find('button').data('vender-code'), 
						procureType: $downTds.eq(9).text(),
						requiredNo: $downTds.eq(12).text()
						
				}
				console.log("잘담겨라좀 1대n: ", chargeProduct);
				charge.chargeProducts.push(chargeProduct);
			})
			arr.push(charge);
		})
		console.log("add될 값들: ", arr)
		

		$.ajax({
			type: "post",
			url: '/charge/addCharge',
			data: JSON.stringify(arr),
		  	contentType: 'application/json',
		 	dataType: 'json', 
			success: function (returnData) {
				var sizeOfData = returnData.length;
				if (sizeOfData != 0) {
					alert("청구등록이 완료되었습니다.");
					$("#table-charge-product tbody :checkbox:checked").closest('tr').remove();
					$("#table-charge tbody :checkbox:checked").closest('tr').remove();
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


	