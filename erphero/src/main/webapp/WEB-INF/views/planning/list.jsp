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
<title>주계획 작성</title>
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
							<h2><strong>주계획 작성</strong></h2>
						</div>
						<div class="col-2">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button class="btn btn-outline-primary btn me-md-2" id="btn-open-planning-modal">주문적용</button>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="hidden" name="code" id="planning-code"> <!-- 자동시퀀스로 생성된값 -->
							<div style="padding:10px;">
								사업장 <input type="text" style="text-align:center; margin-right: 15px" name="empWorkPlaceCode" id="emp-workPlace-code" value="">
								부서 <input type="text" style="text-align:center; margin-right: 15px" name="deptCode" id="dept-code" value=""> <!--  ${LOGINED_EMPLOYEE.deptCode }-->
								사원 <input type="text" style="text-align:center; margin-right: 15px" name="empCode" id="emp-code" value="">
								계획기간 <input type="date" style="text-align:center;" id="planning-start-date" name="startDate" > ~ 
										<input type="date" style="text-align:center; margin-right: 15px"id="planning-end-date" name="endDate">
								<button type="button" class="btn btn-primary btn-sm" style="text-align:center;" id="btn-get-allPlannings">조회</button>
								<button type="button" class="btn btn-primary btn-sm" style="text-align:center;" id="btn-post-plannings" disabled>저장</button>
								<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-delete-plannings" disabled>삭제</button>
							</div>
							<form id="form-planning">
							<table class="table" id="table-planning">
								<thead class="table-warning">
									<tr>
										<td><input type="checkbox" name="pno" id="allPlanningsSelect" value="20"></td>
										<th class="text-center">계획일</th>
										<th class="text-center">품번</th>
										<th class="text-center">품명</th>
										<th class="text-center">단위</th>
										<th class="text-center">출하예정일</th>
										<th class="text-center">납기일</th>
										<th class="text-center">계획수량</th>
										<th class="text-center">주거래처</th>
									</tr>
								</thead>
									<tbody>
										<!-- <tr>
											<td><input type="checkbox" name="pcode" value="20"></td>
										</tr> -->
									</tbody>
							</table>
							</form>
						</div>
					</div>
						<div class="modal fade" id="form-planning-modal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">주문적용</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row px-2 mb-2">
										<div>주문기간 <input type="date" id="contract-start-date" name="startDate" value=""/>~
										<input type="date" id="contract-end-date" name="endDate" value=""/>
										<button type="button" class="btn btn-primary btn-sm" id="btn-get-contracts">조회</button>
										</div>
									</div>
									<div class="row px-2 mb-2">
										<div class="col">
											<table class="table" id="table-contract">
												<colgroup>
													<col width="3%">
													<col width="10%">
													<col width="10%">
													<col width="10%">
													<col width="10%">
													<col width="*%">
													<col width="7%">
													<col width="10%">
													<col width="10%">
													<col width="10%">
												</colgroup>
												<thead>
													<tr>
														<td><input type="checkbox" name="cno" id='allContractsSelect'></td>
														<th class="text-center">주문번호</th>
														<th class="text-center">주문일자</th>
														<th class="text-center">고객</th>
														<th class="text-center">품번</th>
														<th class="text-center">품명</th>
														<th class="text-center">단위</th>
														<th class="text-center">주문수량</th>
														<th class="text-center">출하예정일</th>
														<th class="text-center">납기일</th>
													</tr>
												</thead>
												<tbody>
													<!-- 값뿌림 
														localhost/planning/list?code=C00001&startDate=2021-07-01&endDate=2021-07-28
													-->
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-primary" id="btn-select-planning">적용</button>
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

	var planningModal = new bootstrap.Modal(document.getElementById("form-planning-modal"), {
		keyboard: false
	})
	//화면상단의 주문적용 버튼 클릭시 실행
	$("#btn-open-planning-modal").click(function() {
		$("#allContractsSelect").prop('checked', false);
		$("#table-planning tbody").empty();
		$("#table-contract tbody").empty();
		planningModal.show();
	});
	
	//일반창에서 조회버튼 클릭시 실행
	$("#btn-get-allPlannings").click(function () { 
		$("#allPlanningsSelect").prop('checked', false);
		//버튼숨기기 -> update 계획일 가능하면 다시 풀기
		$("#btn-post-plannings").hide();
		$("#btn-delete-plannings").prop("disabled", false);
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
		if ($("#planning-start-date").val() != "") {
			param["startDate"] = $("#planning-start-date").val();
		}
		if ($("#planning-end-date").val() != "") {
			param["endDate"] = $("#planning-end-date").val();
		}
		if (($("#planning-start-date").val() != "") && ($("#planning-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#planning-start-date").val() == "") && ($("#planning-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		$.ajax({
			type:'post',
			url: '/planning/list2/json/search',
			data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
			contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
			dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
			success: function(plannings) {
				var $tbody = $("#table-planning tbody").empty();
				console.log("응답됐나??", plannings);
				
				$.each(plannings, function(index, planning) {
					var $tr = $("<tr id='planning-"+planning.code+"'></tr>");
					var $td0 = $("<td><input type='checkbox' name='pcode' value='"+planning.code+"'/></td>");
					var $td1 = $("<td></td>").text(planning.targetDate).attr('class','text-center');
					var $td2 = $("<td></td>").text(planning.productCode).attr('class','text-center');
					var $td3 = $("<td></td>").text(planning.productName).attr('class','text-center');
					var $td4 = $("<td></td>").text(planning.productStockUnit).attr('class','text-center');
					var $td5 = $("<td></td>").text(planning.cpShipDate).attr('class','text-center');
					var $td6 = $("<td></td>").text(planning.cpDeliveryDate).attr('class','text-center');
					var $td7 = $("<td></td>").text(planning.cpContractAmount).attr('class','text-center');
					var $td8 = $("<td></td>").text(planning.venderName).attr('class','text-center');
			
					if (planning.targetDate != null) {
						$tr.append($td0);
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($td4);
						$tr.append($td5);
						$tr.append($td6);
						$tr.append($td7);
						$tr.append($td8);
						
						$tbody.append($tr);
						
					}
				});
			
			}
			
		})
		
	})
	//일반창에서 삭제버튼을 클릭했을 때
	$("#btn-delete-plannings").click(function() {
		var $tr = $('#table-planning tbody tr :checkbox:checked').closest("tr"); //index에 따라 tr이 자동선택되게해야하는데..
		console.log("선택됨??")
		$.ajax({
			type: "get",
			url: "/planning/deletePlanning",
			dataType: 'json',
			data: $("#form-planning").serialize() //체크한 것만 가져옴
		});
		if($("#table-planning tbody tr :checkbox").is(":checked")){
			$tr.remove();
			alert("선택한 주계획 작성 내용이 삭제되었습니다.")
		}
	});
	
	
	//모달창에서 조회버튼 클릭시 실행
	$("#btn-get-contracts").click(function() {
		$("#table-contract tbody").empty();
		
		var param = {};
		if ($("#contract-start-date").val() != "") {
			param["startDate"] = $("#contract-start-date").val();
		}
		if ($("#contract-end-date").val() != "") {
			param["endDate"] = $("#contract-end-date").val();
		}
		if (($("#contract-start-date").val() != "") && ($("#contract-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#contract-start-date").val() == "") && ($("#contract-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url: '/planning/list/json',
			data: JSON.stringify(param),	
			contentType: 'application/json',
			dataType: 'json',		
			success: function (contracts){
				var $tbody = $('#table-contract tbody'); 
				
				$.each(contracts, function(index, contract) {
						var $tr = $("<tr id='contract-"+index+"'></tr>").attr('class', 'align-middle'); 
						var $td0 = $("<td class='text-center'><input type='checkbox' name='contract' value='"+index+"'/></td>")
						var $td1 = $("<td class='text-center'></td>").text(contract.code);
						var $td2 = $("<td class='text-center'></td>").text(contract.date);
						var $td3 = $("<td class='text-center'></td>").text(contract.venderName);
						var $td4 = $("<td class='text-center'></td>").text(contract.productCode);
						var $td5 = $("<td class='text-center'></td>").text(contract.productName);
						var $td6 = $("<td class='text-center'></td>").text(contract.stockUnit);
						var $td7 = $("<td class='text-center'></td>").text(contract.cpContractAmount);
						var $td8 = $("<td class='text-center'></td>").text(contract.cpShipDate);
						var $td9 = $("<td class='text-center'></td>").text(contract.cpDeliveryDate);
						var $td10 = $("<td class='text-center'></td>").text(contract.contractProductNo); //보이지 않기		
						var $td11 = $("<td class='text-center'></td>").text(contract.empCode); //보이지 않기		
						
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
						
						$tbody.append($tr);
						$td10.hide();
						$td11.hide();
				})
			}
		})
		
	})
		
	//전체선택/해제하기
	$('#allContractsSelect').change( function(){
       	$(':checkbox[name=contract]').prop('checked', $(this).prop("checked"))
	});
	//개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-contract tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckboxInModal();
	});
	$('#allPlanningsSelect').change( function(){
       	$(':checkbox[name=contractToPlanning]').prop('checked', $(this).prop("checked")) 
	});
	
	$('#allPlanningsSelect').change( function(){
       	$(':checkbox[name=pcode]').prop('checked', $(this).prop("checked")) 
       	changeAllCheckedCheckbox();
	});
	 //개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-planning tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckbox();
	});
	
	
	//체크박스상태 변경1
	function changeAllCheckedCheckbox() {
		var checkboxAllCount = $('#table-planning tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allPlanningsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-planning tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allPlanningsSelect').prop("checked", false);
			$("#btn-post-plannings").prop("disabled", true);
			return;
		} else {
			//저장버튼 활성화
			if($("#btn-post-plannings").prop("disabled")==true){
				$("#btn-post-plannings").removeAttr("disabled");
			}
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allPlanningsSelect').prop("checked", false)
		} else {
			$('#allPlanningsSelect').prop("checked", true)
			
		}
	}
	
	//체크박스상태 변경2(모달창 안)
	function changeAllCheckedCheckboxInModal() {
		var checkboxAllCount = $('#table-contract tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allContractsSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-contract tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allContractsSelect').prop("checked", false);
			return;
		} 
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allContractsSelect').prop("checked", false)
		} else {
			$('#allContractsSelect').prop("checked", true)
			
		}
	}
	
	//모달창 안의 적용버튼클릭하면
	$('#btn-select-planning').click(function() {
		$("#btn-post-plannings").show();
		$(":checkbox[name=contract]:checked").each(function (index, checkbox) {
			var selectedIndex = $(checkbox).val();
			var $tds = $("#contract-"+selectedIndex).find("td"); //find는 자식을 찾음
			//그 행에 해당하는 값만 가져옴
			var contractCode = $tds.eq(1).text();
			var contractProductNo = $tds.eq(10).text();
			var empCode = $tds.eq(11).text();
			var productCode = $tds.eq(4).text();
			var productName = $tds.eq(5).text();
			var stockUnit = $tds.eq(6).text();
			var cpContractAmount = $tds.eq(7).text();
			var cpShipDate  = $tds.eq(8).text();
			var cpDeliveryDate  = $tds.eq(9).text();
			var venderName = $tds.eq(3).text();
			
			
			var row = "<tr id='samplePlanning-"+selectedIndex+"'>"
			row += "<td><input type='checkbox' name='contractToPlanning' value='"+selectedIndex+"'/></td>";
			row += "<td class='text-center'><input type='date' name='targetDate'/></td>";
			row += "<td class='text-center'>" +productCode+ "</td>";
			row += "<td class='text-center'>" +productName+ "</td>";
			row += "<td class='text-center'>" +stockUnit+ "</td>";
			row += "<td class='text-center'>" +cpShipDate+ "</td>";//출하예정일(더 일찍 또는 같게)
			row += "<td class='text-center'>" +cpDeliveryDate+ "</td>";//납기일
			row += "<td class='text-center'>" +cpContractAmount+ "</td>";
			row += "<td class='text-center'>" +venderName+ "</td>";
			row += "<td class='text-center' style='display: none'>" +contractCode+ "</td>";
			row += "<td class='text-center' style='display: none'>" +contractProductNo+ "</td>";
			row += "<td class='text-center' style='display: none'>" +empCode+ "</td>";
			row += "</tr>";
			
			$("#table-planning tbody").append(row);
			
			
		})
		planningModal.hide();
	})
	
	//일반창에서 저장버튼 클릭시 실행	
	$('#btn-post-plannings').click(function () { 
		if (!$.trim($(":input[name=targetDate]").val())) {
			alert("계획일은 필수입력값입니다.");
			return false;
		}
		var plannings = [];
		
		$(":checkbox[name=contractToPlanning]:checked").each(function (index, checkbox) {
			
			var selectedIndex = $(checkbox).val();
			var $tds = $("#samplePlanning-"+selectedIndex).find("td");
			//그 행에 해당하는 값만 가져옴
			var target = $tds.eq(1).find('input').val();
			var contractCode = $tds.eq(9).text();
			var contractProductNo = $tds.eq(10).text();
			var empCode = $tds.eq(11).text();
			var productCode = $tds.eq(2).text();
			var cpContractAmount = $tds.eq(7).text();
			
			console.log("실행됨2",contractProductNo);
					
			var planning = {
					targetDate: target,
					contractCode: contractCode,
					contractProductNo: contractProductNo,
					empCode: empCode,
					productCode: productCode, 
					cpContractAmount: cpContractAmount
			}
			
			plannings.push(planning);
			
			console.log("수주상품번호들어있는지 확인", planning);
		})
		$.ajax({
			type: "post",
			url: '/planning/addPlanning',
			data: JSON.stringify(plannings),
		  	contentType: 'application/json',
			success: function () {
				alert("주계획 작성이 완료되었습니다.");
				$("#table-planning tbody tr :checkbox:checked").parent().parent().remove();
			}
		})
	}); 
})
</script>
</body>
</html>