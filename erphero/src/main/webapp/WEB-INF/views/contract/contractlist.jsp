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
<script src="https://MomentJS.com/downloads/moment.js"></script> 
<title>ERPHERO</title>
</head>
<body>
<%@ include file="../common/navemployee.jsp" %>
<div class="container-fluid my-3">
	<div class="row">
 		<div class="col-2">
 		<jsp:include page="../common/sidebar.jsp"/>
 		</div>
 		<div class="col-10">
 			<div class="row mb-5">
 				<div class="col-11">
 					<h2><strong>수주 등록</strong></h2>
 				</div>
 				<div class="col-1">
	 				<input type="button" class="btn btn-outline-primary" value="견적 조회" id="btn-open-estimate-modal"> 
 				</div>
 			</div>
 			<div class="row" style="margin-bottom: 20px">
	 			<div class="col">
		 			<form action="POST" id="form-search">
		 					<label class="form-label">사업장</label>
		 					<input type="text" style="margin-right: 15px" id="emp-workPlace-code" name="empWorkPlaceCode" value="">
		 					<label class="form-label">부서</label>
		 					<input type="text" style="margin-right: 15px" id="dept-code" name="deptCode" value="">
		 					<label class="form-label">사원</label>
		 					<input type="text" value="${LOGINED_EMPLOYEE.code } " id="emp-code" name="empCode" value="">
		 					<!--  
		 					<input type="text" class="text-center" value="${LOGINED_EMPLOYEE.name } " disabled style="width: 80px">
		 					-->
				 			<label class="form-label">주문기간</label> 
				 			<input type="date" name="startDate" id="contract-start-date"> ~ <input type="date" name="endDate" id="contract-end-date" style="margin-right: 15px" >
			 				<input type="button" class="btn btn-primary  btn-sm" value="조회" id="btn-search" style="margin-right: 5px;">
			 				<input type="button" class="btn btn-primary  btn-sm" value="저장" id="btn-update" style="margin-right: 5px;">
			 				<input type="button" class="btn btn-danger   btn-sm" value="삭제" id="btn-delete" > 
		 				<!-- <div>
				 			<label class="form-label">고객</label>
				 			 <input type="text" style="margin-right: 15px">
					 		<select name="condition">
						 		<option value="productNo">품번</option>
						 		<option value="productName">품명</option>
					 		</select>
				 			<input type="text">
			 			</div> -->
			 		</form>
	 			</div>
 			</div>
 			<form id="form-table">
		 		<input type="hidden" name="empCode" value="${LOGINED_EMPLOYEE.code }">
		 		<div class="row" style="margin-bottom: 100px; margin-right: 10px">
		 			<table class="table table-borderd" id="table-contracts">
		 				<!-- 견적테이블 -->
		 				<thead class="table-warning">
		 					<tr>
		 						<th class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></th>
		 						<th class="text-center">주문번호</th>
		 						<th class="text-center">주문일자</th>
		 						<th class="text-center">고객</th>
		 						<th class="text-center">담당자</th>
		 					</tr>
		 				</thead>
		 				<tbody>
		 				<!-- 조회된 값 뿌리기 -->
		 				</tbody>
		 			</table>
		 		</div>
	 			<div class="row" style="margin-right: 10px;">
	 				<!-- 견적 상품 테이블 -->
	 				<table class="table table-borderd" id="table-products">
	 					<thead class="table-warning">
	 						<tr>
	 							<th class="text-center"><input type="checkbox" id="checkbox-estimate-products-toggle"/></th>
	 							<th class="text-center">No.</th>
	 							<th class="text-center">품번</th>
	 							<th class="text-center">품명</th>
	 							<th class="text-center">단위</th>
	 							<th class="text-center">납기일</th>
	 							<th class="text-center">출하예정일</th>
	 							<th class="text-center">견적수량</th>
	 							<th class="text-center">단가</th>
	 							<th class="text-center">합계액</th>
	 						</tr>
	 					</thead>
	 					<tbody>
	 						<!-- 상품 정보 뿌려주기 -->
	 					</tbody>
	 				</table>
	 			</div>
 			</form>
 		</div>
	</div>
	<!-- 견적추가 모달 -->
	<div class="modal fade" id="modal-estimate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-xl">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">견적추가</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<form action="contract/search" id="form-estimate-search">
	      		<div class="row">
					<div class="col-11 ">
		      			<span style="font-size: 15px ">견적기간 <input type="date" id="modal-start-date" name="startDate" value=""> ~ <input type="date" id="modal-end-date" name="endDate" value=""></span> 
					</div>
					<div class="col-1">
		      			<input type="button" class="btn btn-outline-primary " id="btn-search-estimate" value="조회">
					</div>	      		
	      		</div>
	      	</form>
	        <table class="table table-borderd" id="table-estimates-modal">
	        	<thead>
	        		<tr>
	        			<th class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></th>
	        			<th class="text-center">견적번호</th>
	        			<th class="text-center">no</th>
	        			<th class="text-center">견적일자</th>
	        			<th class="text-center">고객</th>
	        			<th class="text-center">품번</th>
	        			<th class="text-center">품명</th>
	        			<th class="text-center">단위</th>
	        			<th class="text-center">납기일</th>
	        			<th class="text-center">견적수량</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        	</tbody>
	        	<tfoot>
	        	</tfoot>
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="btn-insert-into-table">추가</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 거래처 모달 -->
	<div id="modal-vender" class="modal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">거래처</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row px-2 mb-2">
						<div> 검색 <input type="text" id="search-vender-name" name="venderName" value=""/>
						<button type="button" class="btn btn-primary btn-sm" id="btn-search-venders">조회</button>
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
</div>

<script>
$(function(){
	var estimatesModal = new bootstrap.Modal(document.getElementById("modal-estimate"), {
		keyboard: false
	});
	
	// 견적조회 modal open
	$("#btn-open-estimate-modal").click(function() {	
		var $tbody = $("#table-estimates-modal tbody").empty();
		estimatesModal.show();
	})
	// modal내 조회버튼
	$("#btn-search-estimate").click(function(){
		var $tbody = $("#table-estimates-modal tbody").empty();
		var param = {};
		
		if ($("#modal-start-date").val() != "") {
			param["startDate"] = $("#modal-start-date").val();
		}
		if ($("#modal-end-date").val() != "") {
			param["endDate"] = $("#modal-end-date").val();
		}
		if (($("#modal-start-date").val() != "") && ($("#modal-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#modal-start-date").val() == "") && ($("#modal-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		
		$.ajax({
			type:'post',
			url:"contract/searchEstimate",
			data:JSON.stringify(param),
			contentType: 'application/json',
			dataType:'json',
			success: function(estimates) {
				$.each(estimates, function(index, estimate) {
					console.log(estimate)
					var row = '<tr id="estimate-'+estimate.code+'">'
					row += '<td class="text-center"><input type="checkbox" name="estimateCode" value="'+estimate.code+'" id="checkbox-searchList-modal"/></td>';
					row += '<td class="text-center">'+estimate.code+'</td>';
					row += '<td class="text-center">'+estimate.espNo+'</td>';
					row += '<td class="text-center">'+estimate.esDate+'</td>';
					row += '<td class="text-center">'+estimate.venderName+'</td>';
					row += '<td class="text-center">'+estimate.prCode+'</td>';
					row += '<td class="text-center">'+estimate.prName+'</td>';
					row += '<td class="text-center">'+estimate.stockUnit+'</td>';
					row += '<td class="text-center">'+estimate.deliveryDate+'</td>';
					row += '<td class="text-center">'+estimate.amount+'</td>';
					row += "<td class='text-center' style='display: none'>"+estimate.venderCode+"</td>";
					row += "<td class='text-center'	style='display: none'>"+estimate.empName+"</td>";
					row += "<td class='text-center' style='display: none'>"+estimate.price+"</td>";
					row += "<td class='text-center' style='display: none'>"+estimate.empCode+"</td>";
					row += "</tr>";
					
					$tbody.append(row);
					
					console.log("modal창에 상품출력완료")
				})
			}
		})
	})
	
	// modal창 전체 toggle버튼
	$("#table-estimates-modal thead").on('change', ':input[id=checkbox-estimate-toggle]', function(){
		if($(this).prop('checked') == true){
			$("#table-estimates-modal tbody tr td").find('input').prop("checked", true);
		} else {
			$("#table-estimates-modal tbody tr td").find('input').prop("checked", false);
		}
	})
	
	// modal창에 추가버튼 클릭시 발생하는 함수
	$("#btn-insert-into-table").click(function() {
		if($("input:checkbox[id=checkbox-searchList-modal]:checked").length == 0){
			alert("추가할 견적을 선택해주세요")
			return false;
		} 
		$("#table-contracts tbody").empty();
		$("#table-products tbody").empty();
		var arr=[];
		$(":checkbox[name=estimateCode]:checked").each(function(index, modalCheckbox) {
			var code=$(this).val();
			
			arr.push(code);
		});
		
		var isExist=false;
		$.each(arr, function(index, value) {
			var val1=value;
			$.each(arr,function(index,value) {
				var val2=value;
				if(val1 != val2) {
					isExist=true;
				}
			})
		})
		if(isExist) {
			alert("같은 견적번호를 선택하여 주세요")
			return false;
		}
		
		var code;
		var vender;
		var empName;
		var empCode;
		var venderCode;
		$(":checkbox[name=estimateCode]:checked").each(function(index, modalCheckbox) {
			var $selectedModalTr = $(this).closest('tr');
			console.log("$selectedModalTr", $selectedModalTr)
			var $modalTds = $selectedModalTr.find('td');
			code = $modalTds.eq(1).text();
			vender = $modalTds.eq(4).text();
			venderCode = $modalTds.eq(10).text(); 
			empName = $modalTds.eq(11).text();
			empCode = $modalTds.eq(13).text();
			
			var no = $modalTds.eq(2).text();
			var prCode = $modalTds.eq(5).text();
			var prName = $modalTds.eq(6).text();
			var stockUnit = $modalTds.eq(7).text();
			var deliveryDate = $modalTds.eq(8).text();
			var amount = $modalTds.eq(9).text();
			var price = $modalTds.eq(12).text();
			
			var productRow = '<tr>'
			productRow += '<td class="text-center"><input type="checkbox" id="estimate-code" value="'+code+'" checked/></td>'
			productRow += '<input type="hidden" name="prCode" value="'+prCode+'">'
			productRow += '<input type="hidden" name="esNo" value="'+no+'">'
			productRow += '<td class="text-center" name="esNo">'+no+'</td>'
			productRow += '<td class="text-center">'+prCode+'</td>'
			productRow += '<td class="text-center">'+prName+'</td>'
			productRow += '<td class="text-center">'+stockUnit+'</td>'
			productRow += '<td class="text-center"><input type="date" name="deliveryDate" value="'+deliveryDate+'"></td>'
			productRow += '<td class="text-center"><input type="date" name="shipDate" value="'+date+'"></td>'
			productRow += '<td class="text-center"><input type="number" name="amount" value="'+amount+'" min="1"></td>'
			productRow += '<td class="text-center">'+price+'</td>'
			productRow += '<tr>'
			
			$("#table-products tbody").append(productRow);
			
		})
		
		var formRow = '<input type="hidden" name="venderCode" value="'+venderCode+'">'
		formRow += '<input type="hidden" name="esCode" value="'+code+'">'
		formRow += '<input type="hidden" name="mgrCode" value="'+empCode+'">'
		
		$("#form-table").append(formRow);
		
		
		var date = today();
		var estmiateRow = '<tr data-add-product-code='+code+'">'
		estmiateRow += '<td class="text-center"><input type="checkbox" value="'+code+'" checked/></td>'
		estmiateRow += '<td class="text-center"></td>'
		estmiateRow += '<td class="text-center"><input type="date" name="contractDate" value="'+date+'"></td>'
		estmiateRow += '<td class="text-center">'+vender+'</td>'
		estmiateRow += '<td class="text-center">'+empName+'</td>'
		estmiateRow += '</tr>'
		$("#table-contracts tbody").append(estmiateRow);
		
		estimatesModal.hide();
	})
	
	// 저장버튼 클릭시 발생하는 함수
	$("#btn-update").click(function(){
		var isExist = false
		$(":checkbox[id=estimate-code]:checked").each(function(index, checkbox) {
			var $tr=$(this).closest('tr');
			var $tds=$tr.find('td');
			var shipDate = $tds.eq(6).find('input').val();
			console.log("shipDate" , shipDate);
			
			if(!shipDate) {
				isExist = true
			}
		})
		if(isExist){
			alert("출하예정일은 필수 입력값입니다")
			
			return false;
		}
		
		
		var param = $("#form-table").serialize();
		console.log("param :", param)
		 $.ajax({
			type:'post',
			url:"contract/save",
			dataType:'json',
			data:param,
			success:function(){
				alert("저장되었습니다")
			}
		}) 
	})
	
	// 화면 조회버튼 클릭
	$("#btn-search").click(function(){
		var $tbody = $("#table-products tbody").empty();
		var param = {};
		if ($("#emp-workPlace-code").val() != "") {
			param.empWorkPlaceCode = $.trim($("#emp-workPlace-code").val());
		}
		if ($("#dept-code").val() != "") {
			param.deptCode = $.trim($("#dept-code").val());
		}
		if ($("#emp-code").val() != "") {
			param.empCode = $.trim($("#emp-code").val());
		}
		if ($("#contract-start-date").val() != "") {
			param["startDate"] = $.trim($("#contract-start-date").val());
		}
		if ($("#contract-end-date").val() != "") {
			param["endDate"] = $.trim($("#contract-end-date").val());
		}
		if (($("#contract-start-date").val() != "") && ($("#contract-end-date").val() == "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		if (($("#contract-start-date").val() == "") && ($("#contract-end-date").val() != "")) {
			alert("조회할 시작날짜와 종료날짜를 입력해주세요");
		}
		$.ajax({
			type:'post',
			url: '/contract/list/search',
			data : JSON.stringify(param),
			contentType: 'application/json',
			dataType: 'json',
			success: function (contracts) {
				var $tbody = $("#table-contracts tbody").empty();
				console.log("응답데이터 :", contracts);
				$.each(contracts, function(index, contract) {
					
				var contractRow = '<tr data-contract-code='+contract.code+'">'
				contractRow += '<td class="text-center"><input type="checkbox" name="contractCode" id="contract-code" value="'+contract.code+'"/></td>'
				contractRow += '<td class="text-center"><button type="button" class="btn btn-link" data-contract-code="'+contract.code+'">'+contract.code+'</button></td>'
				contractRow += '<td class="text-center"><input type="date" value="'+contract.contractDate+'"></td>'
				contractRow += '<td class="text-center">'+contract.venderName+'</td>'
				contractRow += '<td class="text-center">'+contract.mgrName+'</td>'
				contractRow += '</tr>'
				$("#table-contracts tbody").append(contractRow);
				})
				
			}
		})
	})
	$("#table-contracts tbody").on('click', '.btn-link[data-contract-code]',function(event) {
		event.preventDefault();
		$("#table-products tbody").empty();
		console.log("run call function");
		var contractCode = $(this).data("contract-code");
		$(":checkbox[name=contractCode]").prop('checked', false).attr('disabled', true)
		var $selectedTr = $(this).closest('tr')
		var $selectedTd = $selectedTr.find('td').eq(0)
		var changeCheckbox = $selectedTd.find('input').attr('disabled', false ).prop('checked', true)
		console.log("contractCode" , contractCode)
		$.ajax({
			type:'get',
			url:'contract/searchContractProduct',
			data: { contractCode:contractCode },
			contentType: 'application/json',
			dataType: 'json',
			success: function(contractProducts){
				$.each(contractProducts, function(index, product){
					console.log('product' , product)
					
					var productRow = '<tr data-contract-code='+product.prCode+'">'
						productRow += '<td class="text-center"><input type="checkbox" id="contract-product-code" value="'+product.prCode+'" checked/></td>'
						productRow += '<input type="hidden" name="prNo" id="contract-product-'+product.no+'" value="'+product.no+'">'
						productRow += '<input type="hidden" name="esPrNo" id="estimate-poduct-no" value="'+product.esPrNo+'">'
						productRow += '<td class="text-center">'+product.no+'</td>'
						productRow += '<td class="text-center">'+product.prCode+'</td>'
						productRow += '<td class="text-center">'+product.prName+'</td>'
						productRow += '<td class="text-center">'+product.stockUnit+'</td>'
						productRow += '<td class="text-center"><input type="date" value="'+product.deliveryDate+'"></td>'
						productRow += '<td class="text-center"><input type="date" value="'+product.shipDate+'"></td>'
						productRow += '<td class="text-center"><input type="number" value="'+product.amount+'" min="1"></td>'
						productRow += '<td class="text-center">'+product.prPrice+'</td>'
						productRow += '<tr>'
						
						$("#table-products tbody").append(productRow);
				})
			}
		})
	})
	
	$('#btn-delete').click(function(){
		console.log("버튼 클릭")
		var param = $("#form-table").serialize();
		console.log(param,"param");
		$.ajax({
		type:'post',
		url:"contract/delete",
		dataType:'json',
		data: param,
		success:function(){
			alert("삭제되었습니다.")
			
			} 
		}) 
	})
	
	function today(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}
})
</script>
</body>
</html>