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
									<div class="border p-2 bg-dark text-white fw-bold form">부서 등록</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-5">
									<table class="table table-bordered" id="table-dept-detail">
										<thead>
											<tr>
												<th style="text-align:center;">코드</th>
												<th style="text-align:center;">부서명</th>
												<th style="text-align:center;"></th>
											</tr>
										</thead>
										<tbody>
											<colgroup>
												<col width="30%">
												<col width="*%">
												<col width="20%">
											</colgroup>
											<c:forEach var="dept" items="${departments }">
												<tr>
													<td class="text-center">${dept.code }</td>
													<td class="text-center"><a class="text-decoration-none" href="detail?code=${dept.code }" id="saved-dept-name">${dept.name }</a></td>
													<td class="text-center"><a class="text-decoration-none" href="delete?code=${dept.code }"><button type="button" class="btn btn-outline-danger btn-sm rm-2">삭제</button></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-7">
									<div class="border p-2 bg-light">
										<form id="form-register" method="post" action="register">
											<input type="hidden" name="code" id="dept-code" value="${dept.code }">
											<div class="mb-3">
												<label class="form-label">부서명</label>
												<input type="text" class="form-control" id="dept-name" name="name" value="${dept.name }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">사업장 코드</label>
												<input type="text" class="form-control" id="dept-work-place-code" name=workPlaceCode value="${dept.workPlaceCode }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">삭제일</label>
												<input type="date" class="form-control" id="dept-deleted-date" name="deletedDate" value="<fmt:formatDate value="${dept.deletedDate }" pattern="yyyy-MM-dd"/>"/>
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
		var name = $.trim($('#dept-name').val());
		if(!name) {
			alert("부서명은 필수입력값입니다.")
			$('#dept-name').focus();
			return false;
		}
		var workPlaceCode = $.trim($("#dept-work-place-code").val());
		if (!workPlaceCode) {
			alert("사업장 코드는 필수입력값입니다.");
			$("#dept-work-place-code").focus();
			return false;
		}
		return true;	// 폼입력값이 서버로 제출되게 함
	});
})
$("#btn-send").find('button[type=button]').click( function(){
	console.log("선택됨??");
	var dept = {	
			name: $.trim($('#dept-name').val()),
			workPlaceCode: $.trim($("#dept-work-place-code").val()),
			deletedDate: $.trim($("#dept-deleted-date").val())
		};
	
	var requestURI = "/department/update/" + $("#dept-code").val();											
	
	$.ajax({
		type: "put",												
		url: requestURI,													
		data: JSON.stringify(dept),											
		contentType: 'application/json; charset=utf-8',					
		dataType: 'json',
		success: function() {
			location.href = "/department/register"
			alert("부서 정보가 수정되었습니다.");
		}
	});
		
});
</script>
</body>
</html>