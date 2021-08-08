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
					<form id="form-estimates">
						<div class="mb-3">
							<label class="form-label">고객명</label>
							<input type="text" class="form-control" id="client-name" name="reqName" />
						</div>
						<div class="mb-3">
							<label class="form-label">납기일</label>
							<input type="date" class="form-control" id="delivery-date" name="deleveryDate" />
						</div>
						<div class="mb-5">
							<label class="form-label me-2">상품</label>
							<button type="button" class="btn btn-primary btn-sm" id="btn-open-todo-modal" >상품추가</button>
							<table class="table table-borderd" id="table-products-form">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkbox-toggle-modal" ></th>
										<th class="text-center">상품명</th>
										<th class="text-center">상품 가격</th>
										<th class="text-center">수량</th>
										<th class="text-center">견적요청 가격</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<!-- <tr>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th class="text-center">주문 합계</th>
										<th class="text-center">1000000</th>
									</tr> -->
								</tfoot>
							</table>
						</div>
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-primary" id="btn-submit" >견적요청</button>
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
			url:"/erphero/estimates/searchList",
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
		// 맨 처음꺼만 들어오는 문제가 있음
		$(this).closest('tr').find('input').eq(0).prop("checked",true);
	
	})
	
	// modal창에 추가버튼 클릭시 발생하는 함수
	$("#btn-insert-product-into-table").click(function() {
		if($("input:checkbox[id=checkbox-searchList-modal]:checked").length == 0){
			alert("구매하실 상품을 체크해주세요!")
			return false;
		} 
		var isExistInvalidField = false;
		var row = "";
		var $tablebody = $("#table-products-form tbody");
		
		if($tablebody.find("tr").length == 0){
			$(":checkbox[name=productCode]:checked").each(function(index, checkbox) {
				
				var $selectedTr = $(this).closest('tr');
			
				var $tds = $selectedTr.find('td');
			
				var code = $tds.eq(0).find('input').val();
				var name = $tds.eq(1).text();
				var price = $tds.eq(2).text();
				var amount = $tds.eq(3).find('input').val();
				var totalPrice = price * amount;
				var priceFmt = new Number(price).toLocaleString();
				var amountFmt = new Number(amount).toLocaleString();
				var totalPriceFmt = new Number(totalPrice).toLocaleString();
				
				if(amount <= 0) {
					
					isExistInvalidField = true;
				} else {
					console.log(code, name, price, amount);
					
					row += '<tr data-add-product-code="'+code+'">'
					row += '<td class="text-center"><input type="checkbox" id="add-product-code" value="'+code+'"/></td>'
					row += '<td class="text-center">'+name+'</td>'
					row += '<td class="text-center">'+priceFmt+'</td>'
					row += '<td class="text-center"><input type="number" name="addListAmount" min="1" value="'+amountFmt+'"/></td>'
					row += '<td class="text-center" id="add-product-total-price">'+totalPriceFmt+'</td>'
					row += '<td class="text-center"><button type="button" class="btn btn-danger">삭제</button></td>'
					row += '</tr>'
				}
			});
			if(isExistInvalidField){
				alert("상품의 수량은 1개이상 선택해주세요")
			} else {
				$tablebody.append(row);
				estimatesModal.hide();
				
				var addAllTotalPrice = 0;
				$("#table-products-form tbody tr").each(function(index, tabletr) {
					var $selectedtableTr = $(this).closest('tr');
					
					var $tableTds = $selectedtableTr.find('td');
					
					var tableProductCode = $tableTds.eq(0).find('input').val();
					var TotalPrice = $tableTds.eq(4).text();
					var numTotalPrice = Number(TotalPrice.toLocaleString().replace(/\D/g,''));
					addAllTotalPrice += numTotalPrice;
				})
				var tfootRow =	'<tr>'
				tfootRow += '<th></th>'
				tfootRow +='<th></th>'
				tfootRow +=	'<th></th>'
				tfootRow += '<th></th>'
				tfootRow += '<th class="text-center">주문 합계</strong></th>'
				tfootRow += '<th class="text-center">'+new Number(addAllTotalPrice).toLocaleString()+'</th>'
				tfootRow += '</tr>'
				$('#table-products-form tfoot').empty().append(tfootRow);
			}
		} else {
			$("#table-products-form tbody tr").each(function(index, tabletr) {
				var $selectedtableTr = $(this).closest('tr');
				
				var $tableTds = $selectedtableTr.find('td');
				
				var tableProductCode = $tableTds.eq(0).find('input').val();
				var numTableProductAmount = Number($tableTds.eq(3).find('input').val());
				
				console.log("테이블 상품코드: ", tableProductCode)
				console.log("테이블 상품수량:", numTableProductAmount)
				$(":checkbox[name=productCode]:checked").each(function(index, modaltr) {
					var $selectedModalTr = $(this).closest('tr');
					
					var $modalTds = $selectedModalTr.find('td');
				
					var modalProductCode = $modalTds.eq(0).find('input').val();
					var modalProductAmout = Number($modalTds.eq(3).find('input').val());
					
					console.log("모달 상품코드: ",modalProductCode)
					console.log("모달 상품수량:", modalProductAmout)
						if(tableProductCode == modalProductCode){
							
							var isExistProductaddAmount = numTableProductAmount + modalProductAmout;
							
							var updateTableProductAmout = $tableTds.eq(3).find('input').val(isExistProductaddAmount);
						} else {
							// 테이블에 존재하지 않는 상품 코드들만 추가 하고 싶음
							/* $(":checkbox[name=productCode]:checked").each(function(index, checkbox) {
								
								var $selectedTr = $(this).closest('tr');
							
								var $tds = $selectedTr.find('td');
							
								var code = $tds.eq(0).find('input').val();
								var name = $tds.eq(1).text();
								var price = $tds.eq(2).text();
								var amount = $tds.eq(3).find('input').val();
								var totalPrice = price * amount;
								var priceFmt = new Number(price).toLocaleString();
								var amountFmt = new Number(amount).toLocaleString();
								var totalPriceFmt = new Number(totalPrice).toLocaleString();
								
								if(amount <= 0) {
									
									isExistInvalidField = true;
								} else {
									console.log(code, name, price, amount);
									
									row += '<tr data-add-product-code="'+code+'">'
									row += '<td class="text-center"><input type="checkbox" id="add-product-code" value="'+code+'"/></td>'
									row += '<td class="text-center">'+name+'</td>'
									row += '<td class="text-center">'+priceFmt+'</td>'
									row += '<td class="text-center"><input type="number" name="addListAmount" min="0" value="'+amountFmt+'"/></td>'
									row += '<td class="text-center" id="add-product-total-price">'+totalPriceFmt+'</td>'
									row += '<td class="text-center"><button type="button" class="btn btn-danger">삭제</button></td>'
									row += '</tr>'
								}
							});
							if(isExistInvalidField){
								alert("상품의 수량은 1개이상 선택해주세요")
							} else {
								$tablebody.append(row);
								estimatesModal.hide();
							} */
						}
			
				})
			
			})
		}
	})
	
	// 삭제버튼 실행함수
	$("#table-products-form tbody").on('click', '.btn-danger', function(){
		var productNo = $(this).closest("tr").remove()
	})
	
	// 수량변경이 있을때 실행되는 함수
	$("#table-products-form tbody").on('change', ':input[name=addListAmount]', function(){
		/*  var num = number.toLocaleString().replace(/\D/g,'');*/
		
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
			return false;
		}
		$totalPriceTd.text(sumTotlaPriceFmt);
		
		// 주문합계 변동 코드
		var result = 0;
		$("#table-products-form tbody tr").each(function(index, tabletr) {
			var $selectedtableTr = $(this).closest('tr');
			
			var $tableTds = $selectedtableTr.find('td');
			
			var tableProductCode = $tableTds.eq(0).find('input').val();
			var TotalPrice = $tableTds.eq(4).text();
			var numTotalPrice = Number(TotalPrice.toLocaleString().replace(/\D/g,''));
			result += numTotalPrice;
		})
		$("#table-products-form tfoot tr th").eq(5).text(new Number(result).toLocaleString());
	})
	
	
})


</script>
</html>