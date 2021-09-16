<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://getbootstrap.kr/docs/5.0/examples/sidebars/sidebars.css" rel="stylesheet">
<div class="flex-shrink-0 p-3 bg-light" style="width: 280px;">
	<a class="d-flex align-items-center mb-3 link-dark text-decoration-none">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">관리메뉴</span>
    </a>
	<ul class="list-unstyled ps-0">
		<c:if test="${LOGINED_EMPLOYEE.deptCode eq '300' or LOGINED_EMPLOYEE.jobId eq '팀장'}">
		<li class="border-top my-3"></li>
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
						<li class=""><a href="/workPlace/register" class="link-dark rounded ">사업장관리</a></li>
						<li class=""><a href="/department/register" class="link-dark rounded ">부서관리</a></li>
						<li class=""><a href="/employee/register" class="link-dark rounded ">사원관리</a></li>
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
						<li class=""><a href="/vender/register" class="link-dark rounded ">거래처등록</a></li>
						<li class=""><a href="/vender/search" class="link-dark rounded ">거래처조회</a></li>
						<li class=""><a href="/category/register" class="link-dark rounded ">품목관리</a></li>
						<li class=""><a href="/product/register" class="link-dark rounded ">상품관리</a></li>
					</ul>
				</div>
			</div>
		</li>
		</c:if>
		<c:if test="${LOGINED_EMPLOYEE.deptCode eq '100' or LOGINED_EMPLOYEE.jobId eq '관리자'}">
		<li class="border-top my-3"></li>
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-collapse" aria-expanded="false">
				<span style="font-size: 18px;">영업관리</span>
			</button>
			<div class="collapse" id="sales-collapse" style="">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li>
						<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#sales-manage-collapse" aria-expanded="false">
							<span style="font-size: 16px;">영업관리</span>
						</button>
					</li>
				</ul>
				<div class="collapse" id="sales-manage-collapse" style="">
					<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
						<!-- <li class=""><a href="/estimate" class="link-dark rounded ">견적등록</a></li> -->
						<li class=""><a href="/contract" class="link-dark rounded ">수주등록</a></li>
		        	</ul>
				</div>
			</div>
		</li>
		</c:if>
		<c:if test="${LOGINED_EMPLOYEE.deptCode eq '200' or LOGINED_EMPLOYEE.jobId eq '관리자'}">
		<li class="border-top my-3 large"></li>
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
	        	<span style="font-size: 18px;">구매/자재관리</span>
	        </button>
			<div class="collapse" id="orders-collapse" style="">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li>
						<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-manage-collapse" aria-expanded="false">
							<span style="font-size: 16px;">구매관리</span>
						</button>
	          		</li>
	          	</ul>
	        	<div class="collapse" id="orders-manage-collapse" style="">
		        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
			            <li class=""><a href="/planning/list" class="link-dark rounded">주계획작성</a></li>
			            <li class=""><a href="/reqAmount/list" class="link-dark rounded">소요량 전개</a></li>
			            <li class=""><a href="/charge/list" class="link-dark rounded">청구등록</a></li>
			            <li class=""><a href="/order/list" class="link-dark rounded">발주</a></li>
			            <li class=""><a href="/inbound/list" class="link-dark rounded">입고</a></li>
		        	</ul>
	        	</div>
        	</div>
	        <div class="collapse" id="orders-collapse" style="">
		         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
			         <li>
			         	 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-status-collapse" aria-expanded="false">
			        		<span style="font-size: 16px;">구매현황/분석</span>
			        	</button>
			         </li>
		         </ul>
		        <div class="collapse" id="orders-status-collapse" style="">
		        	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
			            <li><a href="/dashboard/listDay" class="link-dark rounded">일별 현황</a></li>
			            <li><a href="/dashboard/listMonth" class="link-dark rounded">월별 현황</a></li>
			            <li><a href="/dashboard/listYear" class="link-dark rounded">연도별 현황</a></li>
			            <li><a href="/dashboard/listStock" class="link-dark rounded">재고분석</a></li>
			            <li><a href="/dashboard/listLocation" class="link-dark rounded">지역별 발주현황</a></li>
		        	</ul>
		        </div>
	        </div>
		</li>
		</c:if>
	</ul>
</div>
<script>
</script>