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
									<div class="border p-2 bg-dark text-white fw-bold form">거래처 등록</div>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<div class="border p-2 bg-light">
										<form id="form-register" method="post" action="register">
											<input type="hidden" name="code" id="veder-code">
											<div class="mb-3">
												<label class="form-label">거래처명</label>
												<input type="text" class="form-control" id="vender-name" name="name" />
											</div>
											<div class="mb-3">
												<label class="form-label">대표자명</label>
												<input type="text" class="form-control" id="vender-rep-name" name="repName" />
											</div>
											<div class="mb-3">
												<label class="form-label">사업자번호</label>
												<input type="text" class="form-control" id="vender-reg-num" name="regNum" />
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
												<select class="form-control" id="vender-location" name="locationNo">
														<option value="">선택하세요</option>
													<c:forEach var="ven" items="${venders}">
														<option value="${ven.locationNo}"> ${ven.locationName}</option>
													</c:forEach>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">상세주소</label> 
												<input type="text" class="form-control" id="vender-address" name="address" />
											</div>
											<div class="mb-3">
												<label class="form-label">메일주소</label>
												<input type="email" class="form-control" id="vender-email" name="email" />
											</div>
											<div class="mb-3">
												<label class="form-label">전화번호</label>
												<input type="tel" class="form-control" id="vender-phone" name="phone" />
											</div>
											<div class="mb-3">
												<label class="form-label">분류</label><br>
												<input type="radio" value="매입" id="vender-type-buy" name="type" /> 매입
												<input type="radio" value="매출" id="vender-type-sell" name="type" /> 매출
												<input type="radio" value="매입/매출" id="vender-type-both" name="type" /> 매입/매출
											</div>
											<div class="mb-3">
												<label class="form-label">거래처 등급</label>
												<select class="form-control" id="vender-grade" name="grade">
													<option value="">선택하세요</option>
													<option value="A">A</option>
													<option value="B">B</option>
													<option value="C">C</option>
													<option value="D">D</option>
													<option value="E">E</option>
												</select>
											</div>
											<div class="mb-3">
												<label class="form-label">사용여부</label>
												<input type="checkbox" value="Y" id="vender-status" name="status" checked/>
											</div>
											<div class="mb-3 text-end">
												<a class="btn btn-secondary" href="search">취소</a>
												<button type="submit" class="btn btn-primary">거래처 등록</button>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5fbb5532d87159830693eedf3a25f3f&libraries=services,clusterer,drawing"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function() {
	$("#form-register").submit(function() {
		var name = $.trim($('#vender-name').val());
		if(!name) {
			alert("거래처명은 필수입력값입니다.")
			$('#vender-name').focus();
			return false;
		}
		var repNum = $.trim($("#vender-reg-num").val());
		if (!repNum) {
			alert("사업자번호는 필수입력값입니다.");
			$("#vender-rep-name").focus();
			return false;
		}
		var email = $.trim($("#vender-email").val());
		if (!email) {
			alert("메일주소는 필수입력값입니다.");
			$("#vender-email").focus();
			return false;
		}
		
		return true;	// 폼입력값이 서버로 제출되게 함
	});
	
})
</script>
</body>
</html>