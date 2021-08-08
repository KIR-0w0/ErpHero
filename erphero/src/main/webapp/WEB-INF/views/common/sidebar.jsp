<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://getbootstrap.kr/docs/5.0/examples/sidebars/sidebars.css" rel="stylesheet">
<div class="flex-shrink-0 p-3 bg-light" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">관리메뉴</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1 ">
       	<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#system-collapse" aria-expanded="false">
        	<span style="font-size: 18px;">시스템관리</span>
        </button>
        <div class="collapse" id="system-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li>
	          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#system-register-collapse" aria-expanded="false">
	        		<span style="font-size: 16px;">회사등록정보</span>
	        	</button>
			  </li>
          </ul>
        	<div class="collapse" id="system-register-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">회사등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">사업장등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">부서등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">사원등록</a></li>
	        	</ul>
        	</div>
        </div>
        <div class="collapse" id="system-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li>
	          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#system-manage-collapse" aria-expanded="false">
	        		<span style="font-size: 16px;">기초정보관리</span>
	        	</button>
			  </li>
          </ul>
        	<div class="collapse" id="system-manage-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">일반거래처등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">품목등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">물류 담당자 등록</a></li>
	        	</ul>
        	</div>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-collapse" aria-expanded="false">
        	<span style="font-size: 18px;">영엽관리</span>
        </button>
         <div class="collapse" id="sales-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          <li>
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-manage-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">영업관리</span>
        	</button>
		  
          </ul>
        	<div class="collapse" id="sales-manage-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">견적등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">수주등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">출고의뢰등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">출고처리</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">수주마감처리</a></li>
	        	</ul>
        	</div>
        </div>
         <div class="collapse" id="sales-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-status-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">영업현황</span>
        	</button>
          </ul>
        	<div class="collapse" id="sales-status-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">견적현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">견적대비수주현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">수주현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">수주대비출고현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">출고현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">매출마감현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">매출미마감현황</a></li>
	        	</ul>
        	</div>
        </div>
         <div class="collapse" id="sales-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-analysis-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">영업분석</span>
        	</button>
          </ul>
        	<div class="collapse" id="sales-analysis-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">수주미납집계</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">출고실적집계표</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">매출현황</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">매출집계표</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">매출순위표</a></li>
	        	</ul>
        	</div>
        </div>
         <div class="collapse" id="sales-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-foot-info-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">기초정보관리</span>
        	</button>
          </ul>
        	<div class="collapse" id="sales-foot-info-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">품목단가등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">고객별단가등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">납품처등록</a></li>
	        	</ul>
        	</div>
        </div>
      </li>
      <li class="border-top my-3 large"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
        	<span style="font-size: 18px;">구매/자재관리</span>
        </button>
        <div class="collapse" id="orders-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-manage-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">구매관리</span>
        	</button>
          </ul>
        	<div class="collapse" id="orders-manage-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li class=""><a href="#" class="link-dark rounded ">주계획작성</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">소요량 전개</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">청구등록</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">발주</a></li>
	            <li class=""><a href="#" class="link-dark rounded ">입고</a></li>
	        	</ul>
        	</div>
        </div>
        <div class="collapse" id="orders-collapse" style="">
	         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	         	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-status-collapse" aria-expanded="false">
	        		<span style="font-size: 16px;">구매현황</span>
	        	</button>
	         </ul>
	        <div class="collapse" id="orders-status-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">소요량전개현황</a></li>
	            <li><a href="#" class="link-dark rounded">발주현황</a></li>
	            <li><a href="#" class="link-dark rounded">발주대비입고현황</a></li>
	            <li><a href="#" class="link-dark rounded">발주미납현황</a></li>
	            <li><a href="#" class="link-dark rounded">입고현황</a></li>
	            <li><a href="#" class="link-dark rounded">매입마감현황</a></li>
	            <li><a href="#" class="link-dark rounded">매입미마감현황</a></li>
	        	</ul>
	        </div>
        </div>
        <div class="collapse" id="orders-collapse" style="">
        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-analysis-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">구매분석</span>
        	</button>
          	</ul>
	        <div class="collapse" id="orders-analysis-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">발주미납집계</a></li>
	            <li><a href="#" class="link-dark rounded">입고집계표</a></li>
	            <li><a href="#" class="link-dark rounded">매입집계표</a></li>
	        	</ul>
	        </div>
        </div>
        <div class="collapse" id="orders-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#stock-manage-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">재고관리</span>
        	</button>
          </ul>
	      <div class="collapse" id="stock-manage-collapse" style="">
	        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">기초재고/재고조정등록</a></li>
	      	 	</ul>
	      </div>
        </div>
        <div class="collapse" id="orders-collapse" style="">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#purchase-root-info-collapse" aria-expanded="false">
        		<span style="font-size: 16px;">기초정보관리</span>
        	</button>
          </ul>
	      <div class="collapse" id="purchase-root-info-collapse" style="" >
	      	 	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            <li><a href="#" class="link-dark rounded">품목단가등록</a></li>
	        	</ul>
	      </div>
        </div>
      </li>
    </ul>
  </div>
  <script>
  </script>