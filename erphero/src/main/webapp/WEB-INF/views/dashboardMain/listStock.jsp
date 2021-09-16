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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>대쉬보드</title>
</head>
<body>
<div class="container-fluid my-3">
	<div class="row mb-3" style="width: 500px; height: 100px;">
		<div class="col-4">
			<canvas id="myChart1" width="200" height="200">
			</canvas>
		</div>
	</div>
</div>
<script>
var ctx1 = document.getElementById("myChart1").getContext('2d');
var ctx2 = document.getElementById("pie-chart").getContext('2d');
var ctx3 = document.getElementById("myChart3").getContext('2d');
/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
function drawBarChart(labels, data1) {
	var myChart1 = new Chart(ctx1, {
	    type: 'bar',
	    data: {
	        labels: labels,
	        datasets: [
		        {
		            label: '총재고량',
		            data: data1,
		            fill: false,
		            backgroundColor: 'rgb(75, 192, 192)',
		            borderColor: 'rgb(75, 192, 192)',
		            tension: 0.1,
		            borderWidth: 1
		        }
			]
	    },
	    options: {
	    	responsive: true,
	        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        scales: {
	            yAxes: [
	            	{	id: 'A',
	            		position: 'left',
		            	ticks: {
		                    beginAtZero:true,
		                    stepSize : 500
		                }
		            }
	            ]
	        },
	        title: {
	            display: true,
	            text: '카테고리별 재고현황',
	            fontSize: 25
	            
	        },
	        legend: {
	        	display: true,
	            position: 'bottom'
	        }
	    }
	})
}
//////////////////////////////////////////////////////////////////////////////
function drawPieChart(data) {
	new Chart($("#pie-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ["합격률", "불합격률"],
	      datasets: [{
	        label: "비율",
	        backgroundColor: ["#3e95cd","#c45850"],
	        data: data
	      }]
	    },
	    options: {
	      	title: {
	        	display: true,
	        	text: '입고 합격/불합격 평균비율',
	        	fontSize: 25
	      	},
	      	scale: {
	          	ticks: {
	              	min: 0,
	              	max: 100
	          	}
	      	}
	    }
	});
}
///////////////////////////////////////////////////////////////////////////////////
function drawDoughnutChart(labels, data5, data6) {
	myChart3 = new Chart(ctx3, {
	    type: 'bar',
	    data: {
	        labels: labels,
	        datasets: [
		        {
		            label: '합격',
		            yAxisID: 'A',
		            data: data5,
		            fill: true,
		            backgroundColor: "#3e95cd",
		            borderColor: "#3e95cd",
		            tension: 0.1,
		            borderWidth: 1
		        },
		        {
		            label: '불합격',
		            yAxisID: 'B',
		            data: data6,
		            fill: true,
		            backgroundColor: "#c45850",
		            borderColor: "#c45850",
		            tension: 0.1,
		            borderWidth: 1
		        }
			]
	    },
	    options: {
	    	responsive: true,
	        maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	        scales: {
	            yAxes: [
	            	{	id: 'A',
	            		position: 'left',
		            	ticks: {
		                    beginAtZero:true,
		                }
		            },
		            {
		            	id: 'B',
		            	position: 'right',
		            	ticks: {
		                    beginAtZero:true,
		                }
		            }
	            ]
	        },
	        title: {
	            display: true,
	            text: '입고(+)',
	            fontSize: 25
	            
	        },
	        legend: {
	        	display: true,
	            position: 'bottom'
	        }
	    }
	});
}

$(function () {
	var param = {};
	getAllData();
});

function getAllData(param) {
	$.ajax({
		type:'post',
		url: '/dashboard/listInboundProducts/json',
		data: JSON.stringify(param),	
		contentType: 'application/json',
		dataType: 'json',		
		success: function(products) {
			var labels = [];
			var data5 = [];
			var data6 = [];
			
			console.log("응답됐나??", products);
			
			$.each(products, function(index, product) {
				labels.push(product.date.slice(2,-9));
				data5.push(product.passAmount);
				data6.push(product.failAmount);
			});
			console.log("구조지역1: ",data5);
			console.log("구조지역2: ",data6);
			drawDoughnutChart(labels, data5, data6);
		}
	})
	$.ajax({
		type:'post',
		url: '/dashboard/listInboundProducts/json',
		dataType: 'json',		
		success: function(products) {
			var data = [];
			
			console.log("응답됐나??", products);
			
			$.each(products, function(index, product) {
				data.push(product.passRate);
				data.push(product.failRate);
			});
			console.log("구조파이: ",data);
			drawPieChart(data);
		}
	})
	
	$.ajax({
		type:'post',
		url: '/dashboard/listProductsCategories/json',
		dataType: 'json',		
		success: function(products) {
			var labels = [];
			var data1 = [];
			
			console.log("응답됐나??", products);
			
			$.each(products, function(index, product) {
				labels.push(product.categoryName);
				data1.push(product.totalStock);
			});
			console.log("구조1: ",data1);
			drawBarChart(labels, data1);
		}
	})
	
}

</script>
</body>
</html>