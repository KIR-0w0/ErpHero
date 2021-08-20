<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>ERPHERO</title>
</head>
<body>
<c:set var="menu" value="estimates"/>
<%@ include file="common/navclient.jsp" %>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="fs-1 fw-bold">견적요청</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light" >
					<form id="form-estimates" method="POST" action="estimateform/insertEstimates" >
						<div class="mb-3">
							<label class="form-label">회사명</label>
							<input type="text" class="form-control" id="client-name" name="venderName" />
						</div>
						<div class="mb-3">
							<label class="form-label">견적요청자</label>
							<input type="text" class="form-control" id="client-name" name="name" />
						</div>
						<div class="mb-3">
							<label class="form-label">사업자 번호</label>
							<input type="text" class="form-control" id="client-name" name="businessNumber" />
						</div>
						<div class="mb-3">
							<label class="form-label">이메일</label>
							<input type="text" class="form-control" id="client-name" name="email" />
						</div>
						<div class="mb-3">
							<label class="form-label">전화번호</label>
							<input type="text" class="form-control" id="client-name" name="phone" />
						</div>
						<div class="mb-3">
							<label class="form-label">납기일</label>
							<input type="date" class="form-control" id="delivery-date" name="deliveryDate" />
						</div>
						<div class="mb-5">
							<label class="form-label me-2">상품</label>
							<button type="button" class="btn btn-primary btn-sm" id="btn-open-todo-modal" >상품추가</button>
							<table class="table table-borderd" id="table-products-form">
								<thead>
									<tr>
										<th class="text-center"><input type="checkbox" id="checkbox-toggle-form"/></th>
										<th class="text-center">상품명</th>
										<th class="text-center">상품 가격</th>
										<th class="text-center">수량</th>
										<th class="text-center">견적요청 가격</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
								</tfoot>
							</table>
						</div>
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-primary" id="btn-submit" >견적요청</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<!-- Modal -->
	<div class="modal fade" id="form-estimates-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-scrollable modal-xl">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">상품추가</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table table-borderd" id="table-products-modal">
	        	<thead>
	        		<tr>
	        			<th></th>
	        			<th class="text-center">상품명</th>
	        			<th class="text-center">상품 가격</th>
	        			<th class="text-center">수량</th>
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
	        <button type="button" class="btn btn-primary" id="btn-insert-product-into-table">추가</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
</body>
<script>
$(function() {
	var estimatesModal = new bootstrap.Modal(document.getElementById("form-estimates-modal"), {
		keyboard: false
	});
	
	// 견적요청창에 상품추가 버튼 클릭시 발생하는 함수
	$("#btn-open-todo-modal").click(function() {
		var $tbody = $("#table-products-modal tbody").empty();
		$.ajax({
			type:"GET",
			url:"/erphero/estimateform/searchList",
			dataType:'json'
		})
		.done(function makeRow(product){
			$.each(product, function(index,product){
				var row = '<tr id="product-'+product.code+'">'
				row += '<td class="text-center"><input type="checkbox" name="productCode" value="'+product.code+'" id="checkbox-searchList-modal"/></td>';
				row += '<td class="text-center">'+product.name+'</td>';
				row += '<td class="text-center">'+product.price+'</td>';
				row += '<td class="text-center"><input type="number" name="estimateAmount" min="1"/></td>';
				row += "</tr>";
				
				$tbody.append(row);
				
				console.log("modal창에 상품출력완료")
			})
		})
	estimatesModal.show();
	})
	
	// modal창의 수량이 변경될 때  체크박스가 체크되는 함수
	$("#table-products-modal tbody").on('change', ':input[name=estimateAmount]', function(){
		var $selsectedTr = $(this).closest('tr');
		var $tds = $selsectedTr.find('td');
		var amount = $tds.eq(3).find('input').val();
		$(this).closest('tr').find('input').eq(0).prop("checked",true);
		if(amount <= 0) {
			alert("상품의 수량은 1개이상 선택해주세요")
			$tds.find('input').eq(1).val(1);
			return false;
		}
	
	})
	
	// modal창에 추가버튼 클릭시 발생하는 함수
	$("#btn-insert-product-into-table").click(function() {
		if($("input:checkbox[id=checkbox-searchList-modal]:checked").length == 0){
			alert("구매하실 상품을 체크해주세요!")
			return false;
		} 
		
			$(":checkbox[name=productCode]:checked").each(function(index, modaltr) {
				var isExist = false;
				var $selectedModalTr = $(this).closest('tr');
				console.log("$selectedModalTr", $selectedModalTr)
				var $modalTds = $selectedModalTr.find('td');
			
				var modalProductCode = $modalTds.eq(0).find('input').val();
				var nummodalProductAmout = Number($modalTds.eq(3).find('input').val());
				
				console.log("모달 상품코드: ",modalProductCode)
				console.log("모달 상품수량:", nummodalProductAmout)
				$("#table-products-form tbody tr").each(function(index, tabletr) {
					var $selectedtableTr = $(this).closest('tr');
					
					var $tableTds = $selectedtableTr.find('td');
					
					var tableProductCode = $tableTds.eq(0).find('input').val();
					var numTableProductAmount = Number($tableTds.eq(3).find('input').val());
					
					console.log("테이블 상품코드: ", tableProductCode)
					console.log("테이블 상품수량:", numTableProductAmount)
						if(tableProductCode == modalProductCode){
							var sumProductAmount = numTableProductAmount + nummodalProductAmout;
							
							var updateTableProductAmout = $tableTds.eq(3).find('input').val(sumProductAmount);
							var modalChangeSelected = $modalTds.find('input').eq(0).prop("checked", false); 
							isExist = true;
						} 
				})
				if(!isExist){	
						
					var code = $modalTds.eq(0).find('input').val();
					var name = $modalTds.eq(1).text();
					var price = $modalTds.eq(2).text();
					var amount = $modalTds.eq(3).find('input').val();
					var totalPrice = price * amount;
					var priceFmt = new Number(price).toLocaleString();
					var amountFmt = new Number(amount).toLocaleString();
					var totalPriceFmt = new Number(totalPrice).toLocaleString();
									
						console.log(code, name, price, amount);
							
						var row = '<tr data-add-product-code="'+code+'">'
						row += '<td class="text-center"><input type="checkbox" id="add-product-code" name="productsCode"value="'+code+'" checked/></td>'
						row += '<td class="text-center">'+name+'</td>'
						row += '<td class="text-center">'+priceFmt+'</td>'
						row += '<td class="text-center"><input type="number" name="productsAmount" min="0" value="'+amountFmt+'"/></td>'
						row += '<td class="text-center" id="add-product-total-price">'+totalPriceFmt+'</td>'
						row += '</tr>'
					$("#table-products-form tbody").append(row);
				}
			});
			estimatesModal.hide();
			$("#checkbox-toggle-form").prop("checked", true)
			var tfootRow =	'<tr>'
				tfootRow += '<th class="text-center"><button type="button" class="btn btn-outline-danger btn-sm" id="btn-checked-delete">선택 삭제</button></th>'
				tfootRow +=	'<th></th>'
				tfootRow += '<th></th>'
				tfootRow += '<th class="text-center">주문 합계</strong></th>'
				tfootRow += '<th class="text-center"></th>'
				tfootRow += '</tr>'
				$('#table-products-form tfoot').empty().append(tfootRow);
				changeTotalAmount();
	})
	
	// 수량변경이 있을때 실행되는 함수
	$("#table-products-form tbody").on('change', ':input[name=productsAmount]', function (){
		
		var $selectedTr = $(this).closest('tr');
		
		var $tds = $selectedTr.find('td');
		
		var price = $tds.eq(2).text();
		var amount = $tds.eq(3).find('input').val();
		var $totalPriceTd = $tds.eq(4);
		var numPrice = price.toLocaleString().replace(/\D/g,'');
		var numAmount = amount.toLocaleString().replace(/\D/g,'');
		var sumTotalPrice = numPrice * numAmount;
		var sumTotlaPriceFmt = new Number(sumTotalPrice).toLocaleString();
		
		if(amount <= 0) {
			alert("상품의 수량은 1개이상 선택해주세요")
			$tds.eq(3).find('input').val(1);
			return false;
		}
		$totalPriceTd.text(sumTotlaPriceFmt);
		// 주문합계 변동 코드
		changeTotalAmount();
	})
	
	// thead chckebox클식시 전체선택 기능
	$("#table-products-form thead").on('change', ':input[id=checkbox-toggle-form]', function(){
		if($(this).prop('checked') == true){
			$("#table-products-form tbody tr td").find('input').prop("checked", true);
		} else {
			$("#table-products-form tbody tr td").find('input').prop("checked", false);
		}
	})
	// 선택삭제 버튼 클릭시 일어나는 함수
	$("#table-products-form tfoot").on('click', '.btn-outline-danger', function(){
		$("#table-products-form tbody tr").each(function(index, tableTr) {
			var $tableTds = $(tableTr).find('td');
			
			var $checkedTd = $tableTds.eq(0).find('input')
			
			if($checkedTd.prop('checked') == true) {
				$checkedTd.closest('tr').remove()
			}
			changeTotalAmount();
			$("#checkbox-toggle-form").prop("checked", false)
		})
	})
	
	// 체크해제가 되었을때 총합의 가격 변동 함수 필요!!!!!!!!
	
	// 총합변경 함수
	function changeTotalAmount(){
		console.log("실행")
		var result = 0;
		$("#table-products-form tbody tr").each(function(index, tabletr) {
			var $tableTds = $(tabletr).find('td');
			
			var tableProductPrice = $tableTds.eq(2).text();
			var tableProductAmount = $tableTds.eq(3).find('input');
			var tableTotalPrice = $tableTds.eq(4).text();
			var numTotalPrice = tableTotalPrice.toLocaleString().replace(/\D/g,'');
			result += parseInt(numTotalPrice);
			
		})
		$("#table-products-form tfoot tr th").eq(4).text(new Number(result).toLocaleString());
	};
})


</script>
</html>