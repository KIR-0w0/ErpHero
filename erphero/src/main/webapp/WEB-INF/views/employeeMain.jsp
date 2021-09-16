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
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
<title>대쉬보드</title>
</head>
<body>
<%@ include file="common/navemployee.jsp" %>
<div class="container-fluid my-3">
	<div class="row">
		<div class="col-2">
			<%@ include file="common/sidebar.jsp" %>
		</div>
		<div class="col-10 border-1">
			<div class="row mb-3">
				<div class="col">
					<%@ include file="dashboardMain/listLocation.jsp" %>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col">
					<%@ include file="dashboardMain/listDay.jsp" %>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

</script>
</body>
</html>