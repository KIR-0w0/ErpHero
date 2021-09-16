<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>메시지</title>
</head>
<body>
<div class="container my-3">
	<!-- 토스트 메세지가 세로방향으로 쌓이는 곳
	알람이 오면 이자리에 표시됨
	 -->
	<div class="toast-container position-absolute bottom-0 end-0 p-3"></div>
</div>
<!-- 간단한 토스트 메세지에 대한 HTML 템플릿 1 -->
<script type="text/template" id="toast-simple-template">
	<div class="toast align-items-center text-white bg-primary" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="3000">
		<div class="d-flex">
			<div class="toast-body">message/div>
		</div>
	</div>
</script>

<!-- 제목을 포함하고 있는 토스트 메세지에 대한 HTML 템플릿 2 -->
<script type="text/template" id="toast-basic-template">
	<div class="toast role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="5000">
		<div class="toast-header">
			<i class="bi-alarm me-2"></i> <strong class="me-auto"><span>title</span></strong> <span></span>
		</div>
		<div class="toast-body">message</div>
	</div>
</script>
<script>
$(function() {
	// Toast
	// 알람 메세지를 화면에 표시한다.
	var toastSimpleTemplate = $("#toast-simple-template").html();
	var toastBasicTemplate = $("#toast-basic-template").html();
	var $toastContainer = $('.toast-container');
	
	// 간단한 토스트 메세지를 표시한다.
	function createSimpleToast(message) {
		var $el = $(toastSimpleTemplate);
		$el.find('.toast-body').text(message);
		$el.appendTo($toastContainer);
		
		new bootstrap.Toast($el[0]).show();
	}
	// 제목을 포함하고 있는 토스트 메세지를 표시한다.
	function createBasicToast(title, message, course) {
		var $el = $(toastBasicTemplate);
		$el.find('.me-auto').text(title);
		$el.find('span').text(course.name)
		$el.find('.toast-body').text(message);
		$el.appendTo($toastContainer);
		
		new bootstrap.Toast($el[0]).show();
	}
	
	// 서버에 웹소켓연결을 요청한다.
	var socket = new WebSocket("ws://localhost/ws/alarm");
	
	// onopen이벤트가 발생했을 때 실행될 함수를 등록한다.
	// onopen이벤트는 서버와 연결이 완료되었을 때 발생하는 이벤트다.
	socket.onopen = function(event) {
		console.log("서버와 연결완료", event)
		createSimpleToast("서버가 보내는 알림을 받을 준비가 되었습니다.");
	};
	
	// onmessage이벤트가 발생했을 때 실행될 함수를 등록한다.
	// onmessage이벤트는 서버로부터 메세지를 받았을 때 발생하는 이벤트다.
	socket.onmessage = function(event) {
		// event.data에는 서버가 클라이언트에게 보낸 데이터가 포함되어 있다.
		// 알람메세지의 경우, title, message, data 항목이 포함되어 있다.
		// 알람메세지의 경우, event.data에는 JSON형식의 텍스트가 저장되어 있다.
		
		// event.data에 저장된 JSON형식의 텍스트를 자바스크립트 객체 혹은 배열로 변환시키기
		var payload = JSON.parse(event.data);
		
		// payload에서 정보 조회
		var title = payload.title;
		var message = payload.message
		var productName = payload.data.productName;
		var quantity = payload.data.quantity;
		
		
		console.log(payload);
		console.log("메세지는 : ",message);
		console.log("상품이름과 수량은 : ",productName, quantity);
		// 알람메세지를 표시한다.
		createBasicToast(title, message, payload.data);
	}
	//끝----------------------------------------------------------------------------------
	
	
})
</script>
</body>
</html>