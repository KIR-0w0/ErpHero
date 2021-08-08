<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/erphero/employeehome">ERPHERO</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
			<span class="navbar-text me-1"><small>사원이름: </small><strong>${LOGINED_EMPLOYEE.name }</strong></span>
			<span class="navbar-text"><small>사원번호: </small><strong>${LOGINED_EMPLOYEE.code }</strong></span>
			<ul class="navbar-nav">
				<li class="navbar-itme">
					<a class="nav-link" href="/erphero/logout">로그아웃</a>
				</li>
			</ul>
		</div>
	</div>
</nav>