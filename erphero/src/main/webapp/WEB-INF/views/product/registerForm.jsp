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
<title>erphero</title>
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
						<div class="col">
							<div class="row mb-3">
								<div class="col">
									<div class="border p-2 bg-dark text-white fw-bold form">상품 등록</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-5">
									<table class="table table-bordered" id="table-products-detail">
										<thead>
											<tr>
												<th style="text-align:center;">상품코드</th>
												<th style="text-align:center;">상품명</th>
												<th style="text-align:center;"></th>
											</tr>
										</thead>
										<tbody>
											<colgroup>
												<col width="30%">
												<col width="*%">
												<col width="20%">
											</colgroup>
											<c:forEach var="product" items="${products }">
												<tr>
													<td class="text-center">${product.code }</td>
													<td class="text-center"><a class="text-decoration-none" href="detail?code=${product.code }" id="saved-wp-name">${product.name }</a></td>
													<td class="text-center"><a class="text-decoration-none" href="delete?code=${product.code }"><button type="button" class="btn btn-outline-danger btn-sm rm-2">삭제</button></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-7">
									<div class="border p-2 bg-light">
										<form id="form-register" method="post" action="register">
											<input type="hidden" name="code" id="product-code" value="${product.code }">
											<div class="mb-3">
												<label class="form-label">상품명</label>
												<input type="text" class="form-control" id="product-name" name="name" value="${product.name }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">상품타입</label> <br>
												<div class="form-check">
													<div class="form-check form-check-inline">
													  <input class="form-check-input " type="radio" id="product-type-product" name="type"  value="${product.type }" 
													  ${product.type eq '상품' ? 'disabled' : '' }>
													  <label class="form-check-label" for="workPlace-type-head"> 상품</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" id="product-type-part" name="type"  value="부품" 
													  ${product.type eq '부품' ? 'disabled' : '' }>
													  <label class="form-check-label" for="workPlace-type-branch"> 부품</label>
													</div>
												</div>
											</div>
											<div class="mb-3">
												<label class="form-label">상품품목</label>
												<select class="form-select" id="product-category" name="categoryCode">
													<option value="가전제품" selected>가전제품</option>
													<option value="가구">가구</option>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">상위상품코드</label>
												<input type="text" class="form-control" id="product-root-code" name="rootCode" value="${product.rootCode }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">재고단위</label>
												<select class="form-select" id="product-stock-unit" name="stockUnit" >
													<option value="EA" selected>EA</option>
													<option value="BOX">BOX</option>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">재고단위 수량</label>
												<input type="number" class="form-control" id="product-stock-unit-amount" name="stockUnitAmount" min="1" value="${product.stockUnitAmount }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">재고 수량</label>
												<input type="number" class="form-control" id="product-stock-amount" name="stock" min="0" value="${product.stock }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">기본주문 수량</label>
												<input type="number" class="form-control" id="product-default-amount" name="defaultAmount" min="0" value="${product.defaultAmount }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">안전재고 수량</label>
												<input type="number" class="form-control" id="product-safe-stock" name="safeStock" min="0" value="${product.safeStock }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">조달구분</label>
												<select class="form-select" id="product-procure-type" name="procureType">
													<option value="구매" selected>구매</option>
													<option value="생산">생산</option>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">단가</label>
												<input type="number" class="form-control" id="product-price" name="price" min="100"value="${product.price }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">LeadTime</label>
												<input type="number" class="form-control" id="product-lead-time" name="leadTime" min="0" value="${product.leadTime }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">거래처코드</label>
												<input type="text" class="form-control" id="product-workplace" name="venderCode" value="${product.venderCode }"/>
											</div>
											<div class="mb-3 text-end" id="btn-send">
												<a class="btn btn-secondary" href="register">취소</a>
											<c:choose>
												<c:when test="${not empty param.code }">
													<button type="button" class="btn btn-primary">수정</button>
												</c:when>
												<c:otherwise>
												<button type="submit" class="btn btn-primary">저장</button>
												</c:otherwise>
											</c:choose>	
											</div>
										</form>
									</div>
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
$(function() {
	$("#form-register").submit(function() {
		var name = $.trim($('#product-name').val());
		if(!name) {
			alert("상품명은 필수입력값입니다.")
			$('#product-name').focus();
			return false;
		}
		var category = $.trim($("#product-category").val());
		if (!category) {
			alert("상품품목은 필수입력값입니다.");
			$("#product-category").focus();
			return false;
		}
		var procure = $.trim($("#product-procure-type").val());
		if (!procure) {
			alert("조달구분은 필수입력값입니다.");
			$("#product-procure-type").focus();
			return false;
		}
		var price = $.trim($("#product-price").val());
		if (!price) {
			alert("단가는 필수입력값입니다.");
			$("#product-price").focus();
			return false;
		}
		
		return true;	// 폼입력값이 서버로 제출되게 함
	});
})
//onclick -> 버튼 비활성화
//$("#table-work-place-detail tbody").find("a[id=saved-wp-name]").on("click", function () {
//	$(':button[type=submit]').prop("disabled", true);
//})
$("#btn-send").find('button[type=button]').click( function(){
	console.log("선택됨??");
	var product = {	
			name: $.trim($('#product-name').val()),
			type: $.trim($('#product-type-product').val()),
			categoryCode: $.trim($('#product-categpry').val()),
			rootCode: $.trim($('#product-root-code').val()),
			stockUnit: $.trim($('#product-stock-unit').val()),
			stockUnitAmount: $.trim($('#product-stock-unit-amount').val()),
			stock: $.trim($('#product-stock-amount').val()),
			defaultAmount: $.trim($('#product-default-amount').val()),
			safeStock: $.trim($('#product-safe-stock').val()),
			procureType: $.trim($('#product-procure-type').val()),
			price: $.trim($('#product-price').val()),
			leadTime: $.trim($('#product-lead-time').val()),
			venderCode: $.trim($('#product-workplace').val())
			
		};
	
	var requestURI = "/product/update/" + $("#product-code").val();											
	
	$.ajax({
		type: "put",												
		url: requestURI,													
		data: JSON.stringify(product),											
		contentType: 'application/json; charset=utf-8',					
		dataType: 'json',
		success: function() {
			location.href = "/product/register"
			alert("사업장 정보가 수정되었습니다.");
		}
	}); 
		
});
</script>
</body>
</html>