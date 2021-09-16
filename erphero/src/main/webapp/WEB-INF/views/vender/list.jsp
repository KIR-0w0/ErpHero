<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5fbb5532d87159830693eedf3a25f3f&libraries=services,clusterer,drawing"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.fancytable/dist/fancyTable.min.js"></script>
<title>거래처 조회</title>
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
						<div class="col-10">
							<h2><strong>거래처 위치조회</strong></h2>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div style="padding:10px;">
								거래처명 <input type="text" name="venderName" id="vender-name-search" value="">
								<button type="button" class="btn btn-primary btn-sm" id="btn-get-allVenders">조회</button>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<p style="margin-top:-12px">
							    <em class="link">
							        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
							            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
							        </a>
							    </em>
							</p>
							<div id="map" style="width:500px;height:400px;"></div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col-10">
						<!-- 거래처 -->
						<table class="table table-bordered" id="table-vender-detail">
							<colgroup>
								<col width="20%">
								<col width="40%">
								<col width="*%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">코드</th>
									<th class="text-center">거래처명</th>
									<th class="text-center">주소</th>
									<th class="text-center"></th>
								</tr>
							</thead>
							<tbody>
							<!-- 값뿌림 -->
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(36.3389135932139, 127.39153662262), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//각 거래처명을 클릭했을 때, 지도에 나타내기
	$("#table-vender-detail tbody").on("click", ".btn-link[data-vender-code-modal]", function(){
		event.preventDefault();
		console.log("지도에 표시되라");
	})
	//삭제
	$("#table-vender-detail").on("click", ".btn-outline-danger", function(){
		console.log("선택됨??");
		console.log($(this).data("vender-code-modal"));
		var $tr = $(this).closest('tr'); 
		$.ajax({
			type: "get",
			url: "/vender/remove",
			data: {code: $(this).data("vender-code-modal")},
			success: function() {
				$tr.remove();
				alert("선택한 거래처가 목록에서 삭제되었습니다.");
			}
		});
		
		
	});
	//조회
	$("#btn-get-allVenders").click(function () {
		var venderName = $("#vender-name-search").val();
		var $tbody = $("#table-vender-detail tbody").empty();
		$.ajax({
			url:"/vender/detail",
			data:{name: venderName},
			dataType: "json",
			success: function (response) {
				var venders = response.items;
				if (response.success && response.items != null) {
					
					
					$.each(venders, function(index, vender){
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(vender.locationName +' '+ vender.address, function(result, status) {
						console.log("시도 없어도 되나? ",result);
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+vender.locationName+' '+vender.address+'</div>'
						        });
						        infowindow.open(map, marker);
						
						    } 
						});
						
						var row = '';
						row += '<tr class="align-middle">';
						row +=		'<td class="text-center" id="vender-code-modal">'+vender.code+'</td>'
						row +=		'<td class="text-center" id="vender-name-modal" data-vender-code-modal="'+vender.code+'">'+vender.name+'</td>';
						row +=		'<td class="text-center" id="vender-regNum-modal">'+vender.locationName+' '+vender.address+'</td>';
						row +=		'<td class="text-center" id="vender-delete-modal"><button type="button" class="btn btn-outline-danger btn rm-2"  data-vender-code-modal="'+vender.code+'">삭제</button></td>';
						row += '</tr>';
						
						$tbody.append(row);
						
						$(document).ready(function() {
						    $("#table-vender-detail").fancyTable({
						       sortColumn:0,
						       pagination: true,
						       perPage:10,
						       globalSearch:false,
						       sortable: false,
						       searchable: false
						       });
						})
					})
				}
				
			}
		})
		
	})
	
	
</script>
</body>
</html>