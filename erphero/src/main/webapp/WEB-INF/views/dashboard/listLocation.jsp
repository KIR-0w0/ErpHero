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
						<div class="col-7">
							<h2><strong>통계분석 Dashboard</strong></h2>
						</div>
					</div>
					<div class="row mb-3" style="width: 800px; height: 350px;">
						<div class="col-6">
							<canvas id="myChart3" width="300" height="300">
    							This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
						</div>
						<div class="col-6">
							<canvas id="myChart4" width="300" height="300">
    							This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
						</div>
					</div>
					<div class="row mb-3" style="width: 800px; height: 800px;">
						<div class="col-6">
							<canvas id="myChart2" width="300" height="300">
    							This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
						</div>
						<div class="col-6">
							<canvas id="myChart1" width="300" height="300">
    							This text is displayed if your browser does not support HTML5 Canvas.
							</canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/ws.jsp" %>
</div>
<script>
var ctx1 = document.getElementById("myChart1").getContext('2d');
var ctx2 = document.getElementById("myChart2").getContext('2d');
var ctx3 = document.getElementById("myChart3").getContext('2d');
var ctx4 = document.getElementById("myChart4").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/


function drawDoughnutChart4(title, labels, data) {
	var myChart4 = new Chart(ctx4, {
	  type: 'doughnut',
	  data: {
	    labels: labels,
	    datasets: [{
		  data: data,
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.5)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)'
	      ],
	      borderColor: [
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)'
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
	   		//cutoutPercentage: 40,
		   	responsive: false,
		    title: {
	            display: true,
	            text: title,
	            fontSize: 25
	            
	        },
	        datalabels: {
	        	formatter: function(context) {
	                return context / 1000 + "k";
	            }
	       	}
	  	}
	});
	        
}
function drawDoughnutChart3(title, labels, data) {
	var myChart3 = new Chart(ctx3, {
	  type: 'doughnut',
	  data: {
	    labels: labels,
	    datasets: [{
		  data: data,
	      backgroundColor: [
	        'rgba(255, 99, 132, 0.5)',
	        'rgba(54, 162, 235, 0.2)',
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)'
	      ],
	      borderColor: [
	        'rgba(255,99,132,1)',
	        'rgba(54, 162, 235, 1)',
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)'
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
	   	//cutoutPercentage: 40,
	    responsive: false,
	    title: {
            display: true,
            text: title,
            fontSize: 25
        }
	  }
	});
	        
}
function drawDoughnutChart2(title, labels, data) {
	myChart2 = new Chart(ctx2, {
	  type: 'doughnut',
	  data: {
	    labels: labels,
	    datasets: [{
	      data: data,
	      backgroundColor: [
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)'
	      ],
	      borderColor: [
	       
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)'
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
	   	//cutoutPercentage: 40,
	    responsive: false,
	    title: {
            display: true,
            text: title,
            fontSize: 25
            
        }
	  }
	});
}
function drawDoughnutChart1(title, labels, data) {
	myChart1 = new Chart(ctx1, {
	  type: 'doughnut',
	  data: {
	    labels: labels,
	    datasets: [{
	      data: data,
	      backgroundColor: [
	      
	        'rgba(255, 206, 86, 0.2)',
	        'rgba(75, 192, 192, 0.2)'
	      ],
	      borderColor: [
	      
	        'rgba(255, 206, 86, 1)',
	        'rgba(75, 192, 192, 1)'
	      ],
	      borderWidth: 1
	    }]
	  },
	  options: {
	   	//cutoutPercentage: 40,
	    responsive: false,
	    title: {
            display: true,
            text: title,
            fontSize: 25
            
        }
	  }
	});
}
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
$(function () {
	var param = {};
	getAllData();
});



function getAllData(param) {
	$.ajax({
		type:'post',
		url: '/dashboard/listOrderLocations/json',
		data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
		contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
		dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
		success: function(locations) {
			var labels = [];
			var data = [];
			
			console.log("응답됐나??", locations);
			
			$.each(locations, function(index, location) {
				labels.push(location.locationName);
				data.push(location.quantity);
			});
			drawDoughnutChart3("지역별 발주현황", labels, data);
		}
	})
	$.ajax({
		type:'post',
		url: '/dashboard/listOrderProductsSum/json',
		data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
		contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
		dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
		success: function(products) {
			var labels = [];
			var data = [];
			
			console.log("응답됐나??", products);
			
			$.each(products, function(index, product) {
				labels.push(product.locationName);
				data.push(product.price);
			});
			drawDoughnutChart4("지역별 공급가현황", labels, data);
		}
	})
	$.ajax({
		type:'post',
		url: '/dashboard/listOrderUnpaid/json',
		data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
		contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
		dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
		success: function(products) {
			var labels = ["마감", "진행"];
			var labels2 = ["미납율","납입율"];
			var data = [];
			var data2 = [];
			
			console.log("마감응답됐나??", products);
			
			$.each(products, function(index, product) {
				data.push(product.passAmount);
				data.push(product.failAmount);
				data2.push(product.failRate);
				data2.push(100-product.failRate);
			});
			console.log("구조마감/진행: ",data);
			drawDoughnutChart2("발주미납현황", labels, data);
			drawDoughnutChart1("발주미납비율", labels2, data2);
		}
	})
}

</script>
</body>
</html>