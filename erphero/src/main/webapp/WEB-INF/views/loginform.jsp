<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>ERP로그인</title>
</head>
<body>
<c:set var="menu" value="login" />
<%@ include file="common/navclient.jsp" %>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-dark text-white fw-bold">사원 로그인</div>
					</div>
				</div>
				<c:if test="${param.error eq 'deny' }">
					<div class="row">
						<div class="col">
							<div class="alert alert-danger" role="alert">
								요청한 서비스는 로그인 후 사용가능합니다.
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${param.error eq 'fail' }">
					<div class="row">
						<div class="col">
							<div class="alert alert-danger">
								아이디 혹은 비밀번호가 올바르지 않습니다.
							</div>
						</div>
					</div>
				</c:if>
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-light">
							<form id="form-login" method="post" action="login" novalidate="novalidate">
								<div class="mb-3">
									<label class="form-label">아이디</label>
									<input type="text" class="form-control" id="user-id" name="id" />
								</div>
								<div class="mb-3">
									<label class="form-label">비밀번호</label>
									<input type="password" class="form-control" id="user-password" name="password" />
								</div>
								<div class="mb-3 text-end">
									<button type="submit" class="btn btn-primary">로그인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	// 입력값 유효성 체크해서 아이디와 비밀번호가 전부 값이 입력되어 있을 때만 폼 입력값이 서버로 제출되게 하기
	$("#form-login").submit(function() {
		var id = $.trim($("#user-id").val());
		if (!id) {
			alert("아이디는 필수입력값입니다.");
			$("#user-id").focus();
			return false;
		}
		var password = $.trim($("#user-password").val());
		if (!password) {
			alert("비밀번호는 필수입력값입니다.");
			$("#user-password").focus();
			return false;
		}
		
		return true;
	});
})
</script>
</body>
</html>