<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>erphero</title>
</head>
<body>
<c:set var="menu" value="register"/>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-dark text-white fw-bold form">거래처 등록</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<div class="border p-2 bg-light">
							<form id="form-register" method="post" action="register">
								<div class="mb-3">
									<label class="form-label">거래처명</label>
									<input type="text" class="form-control" id="vender-name" name="name" />
								</div>
								<div class="mb-3">
									<label class="form-label">대표자명</label>
									<input type="password" class="form-control" id="vender-rep-name" name="repName" />
								</div>
								<div class="mb-3">
									<label class="form-label">사업자번호</label>
									<input type="password" class="form-control" id="vender-reg-num" name="regNum" />
								</div>
								<div class="mb-3">
									<label class="form-label">업태</label>
									<input type="text" class="form-control" id="vender-business-type" name="businessType" />
								</div>
								<div class="mb-3">
									<label class="form-label">종목</label>
									<input type="text" class="form-control" id="vender-business-category" name="businessCategory" />
								</div>
								<div class="mb-3">
									<label class="form-label">지역</label>
									<input type="text" class="form-control" id="vender-location" name="location" />
								</div>
								<div class="mb-3">
									<label class="form-label">주소</label>
									<input type="text" class="form-control" id="vender-address" name="address" />
								</div>
								<div class="mb-3">
									<label class="form-label">전화번호</label>
									<input type="text" class="form-control" id="vender-phone" name="phone" />
								</div>
								<div class="mb-3">
									<label class="form-label">분류</label>
									<input type="text" class="form-control" id="vender-type" name="type" />
								</div>
								<div class="mb-3">
									<label class="form-label">거래처 등급</label>
									<input type="text" class="form-control" id="vender-grade" name="grade" />
								</div>
								<div class="mb-3">
									<label class="form-label">사용여부</label>
									<input type="text" class="form-control" id="vender-status" name="status" />
								</div>
								<div class="mb-3 text-end">
									<a class="btn btn-secondary" href="home">취소</a>
									<button type="submit" class="btn btn-primary">거래처 등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col">
						<img src="resources/images/banners/item.png" class="img-thumbnail">
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
	$("#form-register").submit(function(){
		var name = $.trim($('#vender-name').val());
		if(!name) {
			alert("거래처명은 필수입력값입니다.")
			$('#vender-name').focus();
			return false;
		}
	})
	
})
</script>
</body>
</html>