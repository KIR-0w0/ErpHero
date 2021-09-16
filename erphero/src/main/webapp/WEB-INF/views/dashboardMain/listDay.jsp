<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<style>
	* {
		margin: 0;
		padding: 0;
	}
</style>
<div class="row mb-3">
	<div class="col-5">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<input type="hidden" class="form-control" id="start-date" name="startDate"  style="text-align:center; width:200px; height:40px;" value=""/>
		</div>
	</div>
</div>
<div class="row mb-3">
	<div class="col-12" id="day" style="height: 300px;">
		<canvas id="myChart2">
		</canvas>
		<canvas id="myChart1">
		</canvas>
	</div>
</div>
<script>
$(function () {
var ctx1 = document.querySelector("#day #myChart1").getContext('2d');
var ctx2 = document.querySelector("#day #myChart2").getContext('2d');

/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/
function drawLineChart(labels, data1, data2) {
	var myChart1 = new Chart(ctx1, {
	    type: 'line',
	    data: {
	        labels: labels,
	        datasets: [
		        {
		            label: '건수',
		            yAxisID: 'A',
		            data: data1,
		            fill: false,
		            backgroundColor: 'red',
		            borderColor: 'red',
		            tension: 0.1,
		            borderWidth: 1
		        },
		        {
		            label: '수량',
		            yAxisID: 'B',
		            data: data2,
		            fill: false,
		            backgroundColor: 'rgb(54, 162, 235)',
		            borderColor: 'rgb(54, 162, 235)',
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
		                    stepSize : 5
		                }
		            },
		            {
		            	id: 'B',
		            	position: 'right',
		            	ticks: {
		                    beginAtZero:true,
		                    stepSize : 200
		                }
		            }
	            ]
	        },
	        title: {
	            display: true,
	            text: '일일입고현황',
	            fontSize: 25
	            
	        },
	        legend: {
	        	display: true,
	            position: 'bottom'
	        },
	        layout: {
	            padding: 0
	        }
	    }
	})
}
function drawLineChart2(labels, data3, data4) {
	myChart2 = new Chart(ctx2, {
	    type: 'line',
	    data: {
	        labels: labels,
	        datasets: [
		        {
		            label: '건수',
		            yAxisID: 'A',
		            data: data3,
		            fill: false,
		            backgroundColor: 'red',
		            borderColor: 'red',
		            tension: 0.1,
		            borderWidth: 1
		        },
		        {
		            label: '수량',
		            yAxisID: 'B',
		            data: data4,
		            fill: false,
		            backgroundColor: 'rgb(54, 162, 235)',
		            borderColor: 'rgb(54, 162, 235)',
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
		                    stepSize : 5
		                }
		            },
		            {
		            	id: 'B',
		            	position: 'right',
		            	ticks: {
		                    beginAtZero:true,
		                    stepSize : 200
		                }
		            }
	            ]
	        },
	        title: {
	            display: true,
	            text: '일일발주현황',
	            fontSize: 25
	            
	        },
	        legend: {
	        	display: true,
	            position: 'bottom'
	        },
	        layout: {
	            padding: 0
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
	var startDate = getToday();
	var param = {};
	if ($("#start-date").val() == "") {
		param["startDate"] = startDate;
		console.log($("#start-date").val());
	}
	getAllData(param);
});
//발주&입고
$("#btn-open").click(function () {
	var param = {};
	if ($("#start-date").val() != "") {
		param["startDate"] = $("#start-date").val();
		console.log($("#start-date").val());
	}
	if (($("#start-date").val() == "")) {
		alert("조회할 달을 입력해주세요");
	}
	getAllData(param);
	
})
function getAllData(param) {
	$.ajax({
		type:'post',
		url: '/dashboard/listInboundDays/json',
		data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
		contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
		dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
		success: function(inbounds) {
			var labels = [];
			var data1 = [];
			var data2 = [];
			
			console.log("응답됐나??", inbounds);
			
			$.each(inbounds, function(index, inbound) {
				labels.push(inbound.date);
				data1.push(inbound.cnt);
				data2.push(inbound.quantity);
			});
			console.log("구조1: ",data1);
			console.log("구조2: ",data2);
			drawLineChart(labels, data1, data2);
		}
	})
	$.ajax({
		type:'post',
		url: '/dashboard/listOrderDays/json',
		data: JSON.stringify(param),	// 서버로 보내는 JSON 형식 데이터
		contentType: 'application/json',// 서버한테 json 형식 데이터가 보내진다고 알리는 거야
		dataType: 'json',		// 서버로부터 받은 응답이 json이어야돼
		success: function(orders) {
			var labels = [];
			var data3 = [];
			var data4 = [];
			
			console.log("응답됐나??", orders);
			
			$.each(orders, function(index, order) {
				labels.push(order.date);
				data3.push(order.cnt);
				data4.push(order.quantity);
			});
			console.log("구조발주1: ",data3);
			console.log("구조발주2: ",data4);
			drawLineChart2(labels, data3, data4);
		}
	})
}
	
});

</script>
