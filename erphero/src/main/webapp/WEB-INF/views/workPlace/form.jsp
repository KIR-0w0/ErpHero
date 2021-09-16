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
									<div class="border p-2 bg-dark text-white fw-bold form">지사(사업장) 등록</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-5">
									<table class="table table-bordered" id="table-work-place-detail">
										<thead>
											<tr>
												<th style="text-align:center;">코드</th>
												<th style="text-align:center;">사업장명</th>
												<th style="text-align:center;"></th>
											</tr>
										</thead>
										<tbody>
											<colgroup>
												<col width="30%">
												<col width="*%">
												<col width="20%">
											</colgroup>
											<c:forEach var="workPlace" items="${workPlaces }">
												<tr>
													<td class="text-center">${workPlace.code }</td>
													<td class="text-center"><a class="text-decoration-none" href="detail?code=${workPlace.code }" id="saved-wp-name">${workPlace.name }</a></td>
													<td class="text-center"><a class="text-decoration-none" href="delete?code=${workPlace.code }"><button type="button" class="btn btn-outline-danger btn-sm rm-2">삭제</button></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-7">
									<div class="border p-2 bg-light">
										<form id="form-register" method="post" action="register">
											<input type="hidden" name="code" id="workPlace-code" value="${workPlace.code }">
											<div class="mb-3">
												<label class="form-label">사업장명</label>
												<input type="text" class="form-control" id="workPlace-name" name="name" value="${workPlace.name }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">본사여부</label> <br>
												<div class="form-check">
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="type" id="workPlace-type-head" value="본사"
													  ${workPlace.type eq '본사' ? 'checked' : '' }>
													  <label class="form-check-label" for="workPlace-type-head"> 본사</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="type" id="workPlace-type-branch" value="지사"
													  ${workPlace.type eq '지사' ? 'checked' : '' }>
													  <label class="form-check-label" for="workPlace-type-branch"> 지사</label>
													</div>
												</div>
											</div>
											<div class="mb-3">
												<label class="form-label">사업자 등록번호</label>
												<input type="text" class="form-control" id="workPlace-reg-num" name="regNum" value="${workPlace.regNum }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">대표자명</label>
												<input type="text" class="form-control" id="workPlace-rep-name" name="repName" value="${workPlace.repName }" />
											</div>
											<div class="mb-3">
												<label class="form-label">업태</label>
												<input type="text" class="form-control" id="workPlace-business-type" name="businessType" value="${workPlace.businessType }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">종목</label>
												<input type="text" class="form-control" id="workPlace-business-category" name="businessCategory" value="${workPlace.businessCategory }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">주소</label>
												<input type="text" class="form-control" id="workPlace-address" name="address" value="${workPlace.address }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">전화번호</label>
												<input type="text" class="form-control" id="workPlace-phone" name="phone" value="${workPlace.phone }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">개업일</label>
												<input type="date" class="form-control" id="workPlace-created-date" name="createdDate" value="<fmt:formatDate value="${workPlace.createdDate }" pattern="yyyy-MM-dd"/>"/> 
			 
											</div>
											<div class="mb-3">
												<label class="form-label">폐업일</label>
												<input type="date" class="form-control" id="workPlace-deleted-date" name="deletedDate" value="<fmt:formatDate value="${workPlace.deletedDate }" pattern="yyyy-MM-dd"/>"/>
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
		var name = $.trim($('#workPlace-name').val());
		if(!name) {
			alert("사업장명은 필수입력값입니다.")
			$('#workPlace-name').focus();
			return false;
		}
		var repNum = $.trim($("#workPlace-reg-num").val());
		if (!repNum) {
			alert("사업자 등록번호는 필수입력값입니다.");
			$("#workPlace-reg-num").focus();
			return false;
		}
		var repName = $.trim($("#workPlace-rep-name").val());
		if (!repName) {
			alert("대표자명은 필수입력값입니다.");
			$("#workPlace-rep-name").focus();
			return false;
		}
		var businessType = $.trim($("#workPlace-business-type").val());
		if (!businessType) {
			alert("업태는 필수입력값입니다.");
			$("#workPlace-business-type").focus();
			return false;
		}
		var businessCategory = $.trim($("#workPlace-business-category").val());
		if (!businessCategory) {
			alert("종목은 필수입력값입니다.");
			$("#workPlace-business-category").focus();
			return false;
		}
		var address = $.trim($("#workPlace-address").val());
		if (!address) {
			alert("주소는 필수입력값입니다.");
			$("#workPlace-address").focus();
			return false;
		}
		var phone = $.trim($("#workPlace-phone").val());
		if (!phone) {
			alert("전화번호는 필수입력값입니다.");
			$("#workPlace-phone").focus();
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
	var workPlace = {	
			name: $.trim($('#workPlace-name').val()),
			type: $(":radio[name=type]:checked").val(),
			regNum: $.trim($("#workPlace-reg-num").val()),
			repName: $.trim($("#workPlace-rep-name").val()),
			businessType: $.trim($("#workPlace-business-type").val()),
			businessCategory: $.trim($("#workPlace-business-category").val()),
			address: $.trim($("#workPlace-address").val()),
			phone: $.trim($("#workPlace-phone").val()),
			createdDate: $.trim($("#workPlace-created-date").val()),
			deletedDate: $.trim($("#workPlace-deleted-date").val())
		};
	
	var requestURI = "/workPlace/update/" + $("#workPlace-code").val();											
	
	$.ajax({
		type: "put",												
		url: requestURI,													
		data: JSON.stringify(workPlace),											
		contentType: 'application/json; charset=utf-8',					
		dataType: 'json',
		success: function() {
			location.href = "/workPlace/register"
			alert("사업장 정보가 수정되었습니다.");
		}
	});
		
});
</script>
</body>
</html>