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
<title>소요량 전개</title>
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
					<!-- 맘껏작성 -->
					<div class="row mb-3">
						<div class="col-10">
							<h2><strong>소요량 전개</strong></h2>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<form method="post" id="form-reqAmount" action="/list/search">
								<div style="padding:10px;">
									<label>사업장 <input type="text" style="text-align:center; margin-right: 15px" name="empWorkPlaceCode" id="emp-workPlace-code" value=""></label> 
									<label>조달구분 </label>
									<label>
									<select class="form-select form-select-sm" style="width:auto; margin-right: 15px" name="procureType" id="procure-type">
										<option value=""> 선택하세요</option>
										<option value="구매"> 구매</option>
										<option value="생산"> 생산</option>
									</select>
									</label>
									<label>계정구분 </label>
									<label>
									<select class="form-select form-select-sm" style="width:auto; margin-right: 15px" name="productType" id="product-type">
										<option value=""> 선택하세요</option>
										<option value="상품"> 상품</option>
										<option value="부품"> 부품</option>
									</select>
									</label> 
									<label>계획기간 </label> 
									<input type="date" style="text-align:center;" id="planning-start-date" name="startDate"> ~ 
									<input type="date" style="text-align:center; margin-right: 15px" id="planning-end-date" name="endDate">
									<button type="button" class="btn btn-primary btn-sm" id="btn-get-reqAmounts">조회</button>
									<button type="button" class="btn btn-primary btn-sm" id="btn-post-reqAmounts" disabled>저장</button>
									<button type="button" class="btn btn-danger btn-sm rm-2" id="btn-delete-reqAmounts" disabled>삭제</button>
									<button type="button" class="btn btn-success btn-sm rm-2" id="btn-sum-reqAmounts" disabled>소요량 취합</button>
									<button type="button" class="btn btn-success btn-sm rm-2" id="btn-post-sum-reqAmounts" style="display: none;">소요량 취합 저장</button>
								</div>
							</form>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<span>
								<input type="checkbox" id="safe-stock" checked="checked"/> 안전재고량 적용
							</span>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<form id="form-reqAmount">
								<table class="table" id="table-reqAmount">
									<thead class="table-warning">
										<tr>
											<td><input type="checkbox" name="reqcode" id="allReqAmountSelect" value="20"></td>
											<th class="text-center">품번</th>
											<th class="text-center">품명</th>
											<th class="text-center">소요일자</th>
											<th class="text-center">예정발주일</th>
											<th class="text-center">예정수량</th>
											<th class="text-center">단위</th>
											<th class="text-center">계정구분</th>
										</tr>
									</thead>
									<tbody>
										<!-- 값 -->
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>
<script>
$(function () {
	
	var searchOption= {
		empCode: "EP210001"
	}
	getReqAmount(searchOption);
	
	//일반창에서 조회버튼 클릭시 실행
	$("#btn-get-reqAmounts").click(function () {
		$("#table-reqAmount tbody").empty();
		$('#allReqAmountSelect').prop("disabled", false);
		$('#allReqAmountSelect').prop("checked", false);
		$("#safe-stock").prop("checked", true);
		$("#btn-post-reqAmounts").hide();
		$("#btn-post-sum-reqAmounts").hide();
		
		var searchOption = {}; //새로 초기화
		
		if ($("#emp-workPlace-code").val() != "") {
			searchOption.empWorkPlaceCode = $("#emp-workPlace-code").val();
		}
		if ($("#procure-type").val() != "") {
			searchOption.procureType = $("#procure-type").val();
		}
		if ($("#product-type").val() != "") {
			searchOption.productType = $("#product-type").val();
		}
		if ($("#planning-start-date").val() != "") {
			searchOption["startDate"] = $("#planning-start-date").val();
		}
		if ($("#planning-end-date").val() != "") {
			searchOption["endDate"] = $("#planning-end-date").val();
		}
		if (($("#planning-start-date").val() != "") && ($("#planning-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#planning-start-date").val() == "") && ($("#planning-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		getReqAmountFromSave(searchOption);
		$("#btn-sum-reqAmounts").removeAttr("disabled");
		
	})
	//일반창에서 저장버튼 클릭시 실행
	$("#btn-post-reqAmounts").click(function () {
		var reqAmounts = [];
		$(":checkbox[name=no]:checked").each(function (index, checkbox) {
			
			var $tds = $(checkbox).closest("tr").find("td");
			
			var empCode = "EP210001" //${Logined_EMP.code}
			var productType = $tds.eq(7).text()
			var procureType = $tds.eq(8).text()
			var date = $tds.eq(3).text()
			var ordersDate = $tds.eq(4).text()
			var ordersAmount = $tds.eq(5).text()
			var productCode = $tds.eq(1).text()
			var planningCode = $tds.eq(9).text()
		
			var reqAmount = {
					empCode: empCode, //${Logined_EMP.code}
					productType: productType,
					procureType: procureType,
					date: date,
					ordersDate: ordersDate,
					ordersAmount: ordersAmount,
					productCode: productCode,
					planningCode: planningCode
			}
			reqAmounts.push(reqAmount);
		});
		$.ajax({
			type: "post",
			url: '/reqAmount/addReqAmount',
			data: JSON.stringify(reqAmounts),
		  	contentType: 'application/json',
		  	success: function () {
				$(":checkbox[name=no]:checked").prop("disabled", true);
				alert("소요량 전개 저장이 완료되었습니다.");
			}
		});
		
	});
	
	//일반창에서 소요량 취합후 소요량 취합 저장(아이디 다름)버튼 클릭시 실행
	$("#btn-post-sum-reqAmounts").click(function () {
		$(":checkbox[name=no]").each(function (index, checkbox) {
			
			var $tds = $(checkbox).closest("tr").find("td");
			var no = $(checkbox).val();
			
			var empCode = "EP210001" //${Logined_EMP.code}
			var productType = $tds.eq(7).text()
			var procureType = $tds.eq(8).text()
			var date = $tds.eq(3).text()
			var ordersDate = $tds.eq(4).text()
			var amountSum = $tds.eq(5).text()
			var productCode = $tds.eq(1).text()
		
			var reqAmounts = 
			[{
				no: no,
				empCode: empCode, //${Logined_EMP.code}
				productType: productType,
				procureType: procureType,
				date: date,
				ordersDate: ordersDate,
				amountSum: amountSum,
				productCode: productCode
			}]
			
			console.log("####",procureType, amountSum);
			console.log("####",reqAmounts);
			$.ajax({
				type: "post",
				url: '/reqAmount/modifyReqAmount',
				data: JSON.stringify(reqAmounts),
			  	contentType: 'application/json',
			 	dataType: 'json'
			});
			$(":checkbox[name=no]:checked").prop("disabled", true);
		});
		alert("소요량 취합 저장이 완료되었습니다.");
	});
	
	//삭제
	$("#btn-delete-reqAmounts").click(function () {
		$(":checkbox[name=no]:checked").each(function (index, checkbox) {
			console.log( 'checkbox값 : '+$(this).val() )
			var $tds = $(checkbox).closest("tr").find("td");
			var planningCode = $tds.eq(9).text()
			var productCode = $tds.eq(1).text()
			var reqAmounts = [{
					no: $(this).val(),
					planningCode: planningCode,
					productCode: productCode
			}]
			$.ajax({
				type: "post",
				url: '/reqAmount/removeReqAmount',
				data: JSON.stringify(reqAmounts),
			  	contentType: 'application/json',
			 	dataType: 'json'
			});
			$(checkbox).closest("tr").remove();
		});
	});
	
	//조회된 후 일반창에서 소요량취합버튼 클릭시 실행(일괄)
	$("#btn-sum-reqAmounts").click(function () {
		$(":checkbox[name=no]").prop("disabled", true);
		var $tbody = $("#table-reqAmount tbody").empty();
		$.ajax({
			type: "post",
			url: '/reqAmount/sumReqAmount',
		 	dataType: 'json',
		 	success: function (reqAmounts) {
				console.log("응답데이터", reqAmounts)
				
				$.each(reqAmounts, function (index, reqAmount) {
					var $tr = $("<tr id='reqAmount-"+index+"'></tr>");
					var $td0 = $("<td><input type='checkbox' name='no' value='"+index+"'disabled/></td>");
					var $td1 = $("<td class='text-center'></td>").text(reqAmount.productCode);
					var $td2 = $("<td class='text-center'></td>").text(reqAmount.productName);
					var $td3 = $("<td class='text-center'></td>").text(reqAmount.date);
					var $td4 = $("<td class='text-center'></td>").text(reqAmount.ordersDate);
					var $td5 = $("<td class='text-center'></td>").text(reqAmount.amountSum);
					var $td6 = $("<td class='text-center'></td>").text(reqAmount.productStockUnit);
					var $td7 = $("<td class='text-center'></td>").text(reqAmount.productType);
					var $td8 = $("<td class='text-center'></td>").text(reqAmount.procureType);
					var $td9 = $("<td class='text-center'></td>").text(reqAmount.planningCode);
					
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
					
					$tbody.append($tr);
					$td8.hide();
				
				})
				$("#btn-post-reqAmounts").hide();
				$("#btn-post-sum-reqAmounts").show();
				$('#allReqAmountSelect').prop("disabled", true);
				alert("소요량 취합이 완료되었습니다. 저장하시려면 소요량 취합 저장버튼을 눌러주세요.");
			}
		});
		
	});
	
	//안전재고량 적용 체크박스 해제상태일때만
	$("#safe-stock").change(function(){
		getReqAmount(searchOption);
	});
	
	//전체선택/해제
	$('#allReqAmountSelect').change( function(){
       	$(':checkbox[name=no]').prop('checked', $(this).prop("checked"))
       	changeAllCheckedCheckbox();
	});
	//개별 체크박스를 선택/해제할 때 자동으로 변경
	$('#table-reqAmount tbody').on("click", ":checkbox", function () {
		changeAllCheckedCheckbox();
	});
	
	
	
	function getReqAmount(option) {
		var $tbody = $("#table-reqAmount tbody").empty();
		
		if($("#safe-stock").prop("checked")) {
		 	$.ajax({
				type:"post",
		      	url:"/reqAmount/list/with",
		      	data: JSON.stringify(option),
		      	contentType:"application/json",
		      	dataType:"json",
		      	success: function (reqAmounts) {
					console.log("응답데이터", reqAmounts)
					
					$.each(reqAmounts, function (index, reqAmount) {
						var $tr = $("<tr id='reqAmount-"+index+"'></tr>");
						var $td0 = $("<td><input type='checkbox' name='no' value='"+index+"'/></td>");
						var $td1 = $("<td class='text-center'></td>").text(reqAmount.productCode);
						var $td2 = $("<td class='text-center'></td>").text(reqAmount.productName);
						var $td3 = $("<td class='text-center'></td>").text(reqAmount.date);
						var $td4 = $("<td class='text-center'></td>").text(reqAmount.ordersDate);
						var $td5 = $("<td class='text-center'></td>").text(reqAmount.ordersAmount);
						var $td6 = $("<td class='text-center'></td>").text(reqAmount.productStockUnit);
						var $td7 = $("<td class='text-center'></td>").text(reqAmount.productType);
						var $td8 = $("<td class='text-center'></td>").text(reqAmount.procureType);
						var $td9 = $("<td class='text-center'></td>").text(reqAmount.planningCode);
						
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
						
						$tbody.append($tr);
						$td8.hide();
						$td9.hide();
						
					})
				}	
			})
		} else {
			//안전재고량 미적용일때
		 	$.ajax({
				type:"post",
		      	url:"/reqAmount/list/without",
		      	data: JSON.stringify(searchOption),
		      	contentType:"application/json",
		      	dataType:"json",
		      	success: function (reqAmounts) {
					console.log("응답데이터", reqAmounts)
					
					$.each(reqAmounts, function (index, reqAmount) {
						console.log(reqAmount.productCode);
						var $tr = $("<tr id='reqAmount-"+index+"'></tr>");
						var $td0 = $("<td><input type='checkbox' name='no' value='"+index+"'/></td>");
						var $td1 = $("<td class='text-center'></td>").text(reqAmount.productCode);
						var $td2 = $("<td class='text-center'></td>").text(reqAmount.productName);
						var $td3 = $("<td class='text-center'></td>").text(reqAmount.date);
						var $td4 = $("<td class='text-center'></td>").text(reqAmount.ordersDate);
						var $td5 = $("<td class='text-center'></td>").text(reqAmount.ordersAmount);
						var $td6 = $("<td class='text-center'></td>").text(reqAmount.productStockUnit);
						var $td7 = $("<td class='text-center'></td>").text(reqAmount.productType);
						var $td8 = $("<td class='text-center'></td>").text(reqAmount.procureType);
						var $td9 = $("<td class='text-center'></td>").text(reqAmount.planningCode);
						
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
						
						$tbody.append($tr);
						$td8.hide();
						$td9.hide();
						
						
					})
				}	
			})
			
		}
	}
	
	function getReqAmountFromSave(option) {
		var $tbody = $("#table-reqAmount tbody").empty();
		
	 	$.ajax({
			type:"post",
	      	url:"/reqAmount/list/saved",
	      	data: JSON.stringify(option),
	      	contentType:"application/json",
	      	dataType:"json",
	      	success: function (reqAmounts) {
				console.log("응답데이터", reqAmounts)
				
				$.each(reqAmounts, function (index, reqAmount) {
					var $tr = $("<tr id='reqAmount-"+reqAmount.no+"'></tr>");
					var $td0 = $("<td><input type='checkbox' name='no' value='"+reqAmount.no+"'/></td>");
					var $td1 = $("<td class='text-center'></td>").text(reqAmount.productCode);
					var $td2 = $("<td class='text-center'></td>").text(reqAmount.productName);
					var $td3 = $("<td class='text-center'></td>").text(reqAmount.date);
					var $td4 = $("<td class='text-center'></td>").text(reqAmount.ordersDate);
					var $td5 = $("<td class='text-center'></td>").text(reqAmount.ordersAmount);
					var $td6 = $("<td class='text-center'></td>").text(reqAmount.productStockUnit);
					var $td7 = $("<td class='text-center'></td>").text(reqAmount.productType);
					var $td8 = $("<td class='text-center'></td>").text(reqAmount.procureType);
					var $td9 = $("<td class='text-center'></td>").text(reqAmount.planningCode);
					
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
					
					$tbody.append($tr);
					$td8.hide();
					$td9.hide();
					
					
				})
			}	
		})
	}
	
	
	function changeAllCheckedCheckbox() {
		var checkboxAllCount = $('#table-reqAmount tbody :checkbox').length;
		//체크박스가 하나도 없으면 전체 선택/해제 체크박스는 해제상태로 저장하고, 함수실행을 종료한다.
		if(checkboxAllCount == 0) {
			$('#allReqAmountSelect').prop("checked", false);
			return;
		}
		//체크박스 중에서 체크된 체크박스의 갯수를 조회한다.
		var checkedCheckboxCount = $('#table-reqAmount tbody :checkbox:checked').length;
		if(checkedCheckboxCount == 0) {
			$('#allReqAmountSelect').prop("checked", false);
			$("#btn-post-reqAmounts").prop("disabled", true);
			$("#btn-post-sum-reqAmounts").prop("disabled", true);
			$("#btn-delete-reqAmounts").prop("disabled", true);
			return;
		} else {
			$("#btn-post-sum-reqAmounts").removeAttr("disabled")
			//저장버튼 활성화
			if($("#btn-post-reqAmounts").prop("disabled")==true){
				$("#btn-post-reqAmounts").removeAttr("disabled");
				$("#btn-delete-reqAmounts").removeAttr("disabled");
			} 
			
		}
		//전체 체크박스의 갯수와 선택된 체크박스의 갯수가 같지 않으면 전체 선택/해제 체크박스를 체크해제 상태로 변경하기 -> 다 선택되야 thead의 체크박스가 true
		if(checkboxAllCount != checkedCheckboxCount){
			$('#allReqAmountSelect').prop("checked", false)
		} else {
			$('#allReqAmountSelect').prop("checked", true)
			
		}
	}
})
</script>
</body>
</html>

