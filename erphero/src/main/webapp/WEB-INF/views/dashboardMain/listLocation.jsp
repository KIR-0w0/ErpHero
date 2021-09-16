<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<style>
	* {
		margin: 0;
		padding: 0;
	}
</style>
<div class="row mb-3" id="location">
	<div class="col-3">
		<canvas id="myChart3" height="300">
		</canvas>
	</div>
	<div class="col-6">
		<canvas id="myChart4" height="300">
		</canvas>
	</div>
</div>
<script>
$(function () {
	var ctx3 = document.querySelector("#location #myChart3").getContext('2d');
	var ctx4 = document.querySelector("#location #myChart4").getContext('2d');
	
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
	        },
	        layout: {
	            padding: 0
	        }
		  }
		});
		        
	}
	function drawDoughnutChart2(title, labels, data) {
		myChart4 = new Chart(ctx4, {
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
			}
		})
	}

})

/*
- Chart를 생성하면서, 
- ctx를 첫번째 argument로 넘겨주고, 
- 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
*/

</script>
