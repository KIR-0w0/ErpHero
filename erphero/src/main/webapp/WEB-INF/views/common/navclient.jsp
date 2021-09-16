<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="height: 70px;">
	<div class="container">
		<a class="navbar-brand" href="/" style="color: navy;"><strong>ERPHERO</strong></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link ${menu eq 'home' ? 'active fw-bold' : '' } "  href="/home">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${menu eq 'estimates' ? 'active fw-bold' : '' }" href="/estimateform">견적요청</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link ${menu eq 'login' ? 'active fw-bold' : '' }" href="/login">로그인</a>
				</li>
			</ul>
		</div>
	</div>
</nav>