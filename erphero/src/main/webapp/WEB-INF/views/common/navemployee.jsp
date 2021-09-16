<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="/employeeMain" style="color: navy;"><strong>ERPHERO</strong></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse d-flex justify-content-end" id="navbarNav">
			<button type="button" class="btn position-relative">
			  <span class="badge bg-info">${LOGINED_EMPLOYEE.jobId }</span>
			  <strong>${LOGINED_EMPLOYEE.name }</strong>
			</button>
			<ul class="navbar-nav">
				<li class="navbar-itme">
					<a class="nav-link" href="/logout" style="color: black;">로그아웃</a>
				</li>
			</ul>
		</div>
	</div>
</nav>