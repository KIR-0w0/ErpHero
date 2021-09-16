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
<title>ERPHERO</title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Noto+Serif+KR:wght@600&display=swap');
	ul{
	   list-style:none;
	   padding:30px 20px 30px 40px;
	   }
	   
	 img.absolute { 
        position: absolute;
        left: 700px;
        right: 500px;
        top: 50px;
      }
     
</style>
<body>
<c:set var="menu" value="home"/>
<%@ include file="common/navclient.jsp" %>
<div class="container my-3">
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">
					<br/>
					<h1 class="text-center" style="color: navy; font-size: 60px;"><strong>ERPHERO</strong></h1>
					<h3 style="font-weight: bolder;"></h3>
				</div>
				<div class="col-4"></div>
			</div>
			<br/>
			<br/>
			<br/>
			<div class="row">
				<div class="col" style="font-family: 'Noto Sans KR', sans-serif; font-family: 'Noto Serif KR', serif;">
					<img src="https://www.krindus.co.kr/resources/upload/promote/news/FILE1_441.jpg">
					<ul>
						<li><span>언제나 고객과 함께 소통하는 기업</span><br><span>창의와 열정으로 미래 가치를 창조하고 노력하는 기업</span></li>
						<li class="gray13" style="padding-top: 10px;">당사의 홈페이지 방문을 환영합니다.<br>
							폐사는 군수물자 및 장비 운송과 기업 종합물류 운송<br>
							전문업체로서 다년간 축적된 노하우로 고객사의<br>
							이익 창출 및 최고의 서비스로 귀사와 함께 성장하는 기업이 되겠습니다.<br>
							<br>
							고객사의 물량을 적기 적소에 운송 할 수 있도록 정확한<br>
							물량 분석을 통하여 차별화된 서비스를 제공하여<br>
							귀사에서 신뢰할 수 있는 기업이 되도록 최선의 노력으로<br>
							동반 성장해 나가는 기업이 되겠습니다.<br>
							<br>
							감사합니다.
						</li>
					</ul>
				</div>
				<div id="contact" class="col-2" style="font-weight:bold; font-family: 'Noto Sans KR', sans-serif; font-family: 'Noto Serif KR', serif; ">
					고객센터 <br/>
					031.453.4646 <br/>
					031.453.0900 <br/>
					FAX : 031-453-7611 <br/>
					(주)ERPHERO 고객센터는 24시간 운영중이니
					언제든지 문의주시기 바랍니다.
					<br/>
				</div>		
			</div>
       </div>
   </div>
</div>

<script>

</script>
</body>
</html>