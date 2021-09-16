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
 				<h1>견적등록</h1>
 			</div>
 			<div class="row" style="margin-bottom: 20px">
	 			<div class="col">
		 			<form action="GET" id="form-search">
		 					<label class="form-label">사업장</label>
		 					<input type="text" style="margin-right: 15px" id="input-wp" name="wpCode">
		 					<label class="form-label">부서</label>
		 					<input type="text" style="margin-right: 15px" id="input-dept" name="deptCode">
		 					<label class="form-label">사원</label>
		 					<input type="text" value="${LOGINED_EMPLOYEE.code } " id="input-emp" name="empCode">
		 					<!--  
		 					<input type="text" class="text-center" value="${LOGINED_EMPLOYEE.name } " disabled style="width: 80px">
		 					-->
				 			<label class="form-label">견적기간</label> 
				 			<input type="date" name="startDate"> ~ <input type="date" name="endDate" style="margin-right: 15px" >
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
	 		<div class="row" style="margin-bottom: 100px; margin-right: 10px">
	 			<table class="table table-borderd">
	 				<!-- 견적테이블 -->
	 				<thead class="table-warning">
	 					<tr>
	 						<th class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></th>
	 						<th class="text-center">견적번호</th>
	 						<th class="text-center">견적일자</th>
	 						<th class="text-center">고객</th>
	 						<th class="text-center">견적요청자</th>
	 						<th class="text-center">담당자</th>
	 						<th class="text-center">사업장</th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 					<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 					</tr>
	 				</tbody>
	 			</table>
	 		</div>
 			<div class="row" style="margin-right: 10px;">
 				<!-- 견적 상품 테이블 -->
 				<table class="table table-borderd">
 					<thead class="table-warning">
 						<tr>
 							<th class="text-center"><input type="checkbox" id="checkbox-estimate-products-toggle"/></th>
 							<th class="text-center">No.</th>
 							<th class="text-center">품번</th>
 							<th class="text-center">품명</th>
 							<th class="text-center">단위</th>
 							<th class="text-center">납기일</th>
 							<th class="text-center">견적수량</th>
 							<th class="text-center">단가</th>
 							<th class="text-center">합계액</th>
 						</tr>
 					</thead>
 					<tbody>
 						<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
 						<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
 						<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
 						<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
 						<tr>
	 						<td class="text-center"><input type="checkbox" id="checkbox-estimate-toggle"/></td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">ss</td>
	 						<td class="text-center">dd</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 						<td class="text-center">11000</td>
	 					</tr>
 					</tbody>
 				</table>
 			</div>
 		</div>
	</div>
</div>
<script>
$(function(){
	
	$("#btn-search").click(function() {
		
	})
})
</script>
</body>
</html>