<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>주계획 작성</title>
</head>
<body>
<div class="container my-3">
	<main>
		<h1>주계획 작성</h1>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					<button class="btn btn-primary btn-sm" id="btn-open-planning-modal">주문적용</button>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div>
					<div>사업장<input type="text" name="workplace" value="세션."></div>
					<div>부서<input type="text" name="workplace" value="세션."></div>
					<div>사원<input type="text" name="workplace" value="세션."></div>
					<div>계획기간<input type="date" id="planning-start-date" name="startDate">~
					<input type="date" id="planning-end-date" name="endDate"></div>
					<div>
						<button class="btn btn-primary btn-sm">조회</button>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<td><input type="checkbox" name="pno" value="20"></td>
							<th>계획일</th>
							<th>품번</th>
							<th>품명</th>
							<th>단위</th>
							<th>출하예정일</th>
							<th>납기일</th>
							<th>계획수량</th>
							<th>고객</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody class="table" id="table-planning">
						<!-- <tr>
							<td><input type="checkbox" name="pno" value="20"></td>
							<td>계획일</td> ajax로 가능?
							<td>품번</td>
							<td>품명</td>
							<td>단위</td>
							<td>출하예정일</td>
							<td>납기일</td>
							<td>계획수량</td>
							<td>고객</td>
							<td>비고</td>
							<td id="targetDate"></td>
							<td id="productCode"></td>
							<td id="productName"></td>
							<td id="productStockUnit"></td>
							<td id="cpDeliveryDate"></td>
							<td id="cpShipDate"></td>
							<td id="venderName"></td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	</main>
	<div class="modal fade" id="form-planning-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form id="form-planning">
				<input type="hidden" name="code" id="planning-code"> <!-- C00001 -->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">주문적용</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row px-2 mb-2">
							<div>주문기간 <input type="date" id="contract-start-date" name="contractStartDate" value=""/>~
								<input type="date" id="contract-end-date" name="contractEndDate" value=""/>
							</div>
							<div>
								<button class="btn btn-primary btn-sm" id="btn-get-planning" type="button">조회</button>
							</div>
						</div>
						<div class="row px-2 mb-2">
							<div class="col">
								<table class="table" id="table-contract">
									<thead>
										<tr>
											<td><input type="checkbox" name="cno" id='allSelect' value="20"></td>
											<th>주문번호</th>
											<th>주문일자</th>
											<th>고객</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th>주문수량</th>
											<th>출하예정일</th>
										</tr>
									</thead>
									<tbody>
										<!-- 값뿌림 
											localhost/planning/list?code=C00001&contractStartDate=2021-07-01&contractEndDate=2021-07-28
										-->
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="btn-post-planning">적용</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function (){
	var planningModal = new bootstrap.Modal(document.getElementById("form-planning-modal"), {
		keyboard: false
	})
	//화면상단의 일정등록 버튼 클릭시 실행
	$("#btn-open-planning-modal").click(function() {
		$("#planning-code").val("");
		planningModal.show();
	});
	
	//모달창에서 조회버튼 클릭시 실행
	$("#btn-get-planning").click(function() {
		//신규등록이기 때문에 주계획코드 입력필드를 비활성화 시킴 hidden -> update할 때 필요함
		$("#planning-code").prop("disabled", true);
	
	
		$.getJSON('/planning/list/json', function (contracts){
			var $tbody = $('#table-contract tbody'); 
				alert("꺄아아아아아앙아");
			
			$.each(contracts, function(index, contract) {
				var $tr = $("<tr id='contract-"+index+"'></tr>").attr("data-contract-code", contract.code); 
				var $td0 = $("<td><input type='checkbox' name='contract' value='"+index+"'/></td>") //체크박스 name이 다 똑같아서 일괄선택해야 하는데...
				var $td1 = $("<td></td>").text(contract.code);
				var $td2 = $("<td></td>").text(contract.date);
				var $td3 = $("<td></td>").text(contract.venderName);
				var $td4 = $("<td></td>").text(contract.productCode);
				var $td5 = $("<td></td>").text(contract.productName);
				var $td6 = $("<td></td>").text(contract.stockUnit);
				var $td7 = $("<td></td>").text(contract.cpContractAmount);
				var $td8 = $("<td></td>").text(contract.cpShipDate);
		
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
			})
		})
	})
	//전체선택/해제하기
	$('#allSelect').change( function(){
       	$(':checkbox[name=contract]').prop('checked', $(this).prop("checked"))
	});
	//적용버튼클릭하면
	$('#btn-post-planning').click(function() {
		$(":checkbox[name:contract]:checked").each(function (index, checkbox) {
			var selectedIndex = $(checkbox).val();
			var $tds = $("#contract-"+selectedIndex).find("td"); //find는 자식을 찾음
			//그 행에 해당하는 값만 가져옴
			var code = $tds.eq(1).text();
			var date = $tds.eq(2).text();
			var venderName = $tds.eq(3).text();
			var productCode = $tds.eq(4).text();
			var productName = $tds.eq(5).text();
			var stockUnit = $tds.eq(6).text();
			var cpContractAmount = $tds.eq(7).text();
			var cpShipDate  = $tds.eq(8).text();
				
			var $td2 = $("<td></td>").text(contract.productCode);
			var $td3 = $("<td></td>").text(contract.productName);
			var $td4 = $("<td></td>").text(contract.stockUnit);
			var $td5 = $("<td></td>").text(contract.cpShipDate);
			var $td6 = $("<td></td>").text(contract.cpDeliveryDate);
			var $td7 = $("<td></td>").text(contract.cpContractAmount);
			var $td7 = $("<td></td>").text(contract.venderName);
			
			
			
			var row = "<tr>"
			row += "<td>" + 값1+ "</td>";
			
			$("#table-planning tbody").append(row)
		})
	})
	//적용버튼클릭하면
	$("#btn-post-planning").click(function() {
		alert("적용클릭");
		$(this).addClass('active').siblings().removeClass('active')
		var contractCode = $(this).data("contract-code");
		
		var $tbody = $('#table-planning tbody'); 
		
		$.ajax({
			type:"GET",
			url: "/planning/list2/json" + contractCode, //여기서 실패...
			data: {code:contractCode},
			dataType: 'json',
			success: function(planning){
				var $tr = $("<tr></tr>").attr("data-planning-code", contract.code); //이 값을 planning객체의 contractCode에 옮겨 담아야 함.
				var $td0 = $("<td><input type='checkbox' name='pno'/></td>")
				var $td1 = $("<td></td>"); //계획일을 입력해야함
				var $td2 = $("<td></td>").text(contract.productCode);
				var $td3 = $("<td></td>").text(contract.productName);
				var $td4 = $("<td></td>").text(contract.stockUnit);
				var $td5 = $("<td></td>").text(contract.cpShipDate);
				var $td6 = $("<td></td>").text(contract.cpDeliveryDate);
				var $td7 = $("<td></td>").text(contract.cpContractAmount);
				var $td7 = $("<td></td>").text(contract.venderName);
				
				$tr.append($td0);
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				$tr.append($td6);
				$tr.append($td7);
				
				$tbody.append($tr);
				
			},
			error: function(){
				alert("오류가 발생하였습니다.")
			}
		})
		planningModal.hide();
	});
})
</script>
</body>
</html>