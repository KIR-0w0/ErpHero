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
<script src="https://cdn.jsdelivr.net/npm/jquery.fancytable/dist/fancyTable.min.js"></script>
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
									<div class="border p-2 bg-dark text-white fw-bold form">사원 등록</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-5">
									<table class="table table-bordered" id="table-emp-detail">
										<thead>
											<tr>
												<th style="text-align:center;">코드</th>
												<th style="text-align:center;">사원명</th>
												<th style="text-align:center;"></th>
											</tr>
										</thead>
										<tbody>
											<colgroup>
												<col width="30%">
												<col width="*%">
												<col width="20%">
											</colgroup>
											<c:forEach var="employee" items="${employees }">
												<tr>
													<td class="text-center">${employee.code }</td>
													<td class="text-center"><a class="text-decoration-none" href="detail?code=${employee.code }" id="saved-wp-name">${employee.name }</a></td>
													<td class="text-center"><a class="text-decoration-none" href="delete?code=${employee.code }"><button type="button" class="btn btn-outline-danger btn-sm rm-2">삭제</button></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-7">
									<div class="border p-2 bg-light">
										<form id="form-register" method="post" action="register">
											<input type="hidden" name="code" id="employee-code" value="${employee.code }">
											<div class="mb-3">
												<label class="form-label">사원아이디</label>
												<input type="text" class="form-control" id="employee-id" name="id" value="${employee.id }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">이름</label>
												<input type="text" class="form-control" id="employee-name" name="name" value="${employee.name }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">부서코드</label>
												<select class="form-control" id="employee-deptCode" name="deptCode">
													<option value="" selected disabled>선택하세요</option>
													<option value="100" ${employee.deptCode eq '100' ? 'selected' : ''}>영업팀</option>
													<option value="200" ${employee.deptCode eq '200' ? 'selected' : ''}>구매팀</option>
													<option value="300" ${employee.deptCode eq '300' ? 'selected' : ''}>인사팀</option>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">퇴사일</label>
												<input type="date" class="form-control" id="employee-resignation-date" name="resignationDate" value="<fmt:formatDate value="${employee.resignationDate }" pattern="yyyy-MM-dd"/>"/>
											</div>
											<div class="mb-3">
												<label class="form-label">사용자 여부</label> <br>
												<div class="form-check">
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="status" id="employee-status-y" value="Y"
													  ${employee.status eq 'Y' ? 'checked' : '' }>
													  <label class="form-check-label" for="employee-status-y"> 여</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="status" id="employee-status-n" value="N"
													  ${employee.status eq 'N' ? 'checked' : '' }>
													  <label class="form-check-label" for="employee-status-n"> 부</label>
													</div>
												</div>
											</div>
											<div class="mb-3">
												<label class="form-label">이메일</label>
												<input type="text" class="form-control" id="employee-email" name="email" value="${employee.email }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">연락처</label>
												<input type="text" class="form-control" id="employee-phone" name="phone" value="${employee.phone }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">비밀번호</label>
												<input type="password" class="form-control" id="employee-password" name="password" value="${employee.password }"/>
											</div>
											<div class="mb-3">
												<label class="form-label">직급</label> <br>
												<div class="form-check">
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="jobId" id="employee-jobId-y" value="팀장"
													  ${employee.jobId eq '팀장' ? 'checked' : '' }> 
													  <label class="form-check-label" for="employee-jobId-y"> 팀장</label>
													</div>
													<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="jobId" id="employee-jobId-n" value="사원"
													  ${employee.jobId eq '사원' ? 'checked' : '' }>
													  <label class="form-check-label" for="employee-jobId-n"> 사원</label>
													</div>
												</div>
											</div>
											<div class="mb-3">
												<label class="form-label">사업장코드</label>
												<input type="text" class="form-control" id="employee-workplaceCode" name="workplaceCode" value="${employee.workplaceCode }"/>
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
		var id = $.trim($('#employee-id').val());
		if(!id) {
			alert("아이디는 필수입력값입니다.")
			$('#employee-id').focus();
			return false;
		}
		var name = $.trim($("#employee-name").val());
		if (!name) {
			alert("이름은 필수입력값입니다.");
			$("#employee-name").focus();
			return false;
		}
		var deptCode = $.trim($("#employee-deptCode").val());
		if (!deptCode) {
			alert("부서코드는 필수입력값입니다.");
			$("#employee-deptCode").focus();
			return false;
		}
		var status = $.trim($(":radio[name=status]").val());
		if (!businessType) {
			alert("사용자 여부는 필수입력값입니다.");
			$(":radio[name=status]").focus();
			return false;
		}
		var phone = $.trim($("#employee-phone").val());
		if (!phone) {
			alert("연락처는 필수입력값입니다.");
			$("#employee-phone").focus();
			return false;
		}
		var password = $.trim($("#employee-password").val());
		if (!password) {
			alert("비밀번호는 필수입력값입니다.");
			$("#employee-password").focus();
			return false;
		}
		var jobId = $.trim($(":radio[name=jobId]").val());
		if (!jobId) {
			alert("직급은 필수입력값입니다.");
			$(":radio[name=jobId]").focus();
			return false;
		}
		var workplaceCode = $.trim($("#employee-workplaceCode").val());
		if (!workplaceCode) {
			alert("사업장 코드는 필수입력값입니다.");
			$("#employee-workplaceCode").focus();
			return false;
		}
		return true;	// 폼입력값이 서버로 제출되게 함
	});
})

$("#btn-send").find('button[type=button]').click( function(){
	console.log("선택됨??");
	var emp = {	
			id: $.trim($('#employee-id').val()),
			name: $.trim($('#employee-name').val()),
			deptCode: $.trim($('#employee-deptCode').val()),
			resignationDate: $.trim($('#employee-resignationDate').val()),
			status: $(":radio[name=status]:checked").val(),
			email: $.trim($("#employee-email").val()),
			phone: $.trim($("#employee-phone").val()),
			password: $.trim($("#employee-password").val()),
			jobId: $(":radio[name=jobId]:checked").val(),
			workplaceCode: $.trim($("#employee-workplaceCode").val())
		};
	
	var requestURI = "/employee/update/" + $("#employee-code").val();											
	
	$.ajax({
		type: "put",												
		url: requestURI,													
		data: JSON.stringify(emp),											
		contentType: 'application/json; charset=utf-8',					
		dataType: 'json',
		success: function() {
			location.href = "/employee/register"
			alert("사원 정보가 수정되었습니다.");
		}
	});
		
});

$(document).ready(function() {
    $("#table-emp-detail").fancyTable({
       sortColumn:0,
       pagination: true,
       perPage:10,
       globalSearch:false,
       sortable: false,
       searchable: false
       });
});
</script>
</body>
</html>