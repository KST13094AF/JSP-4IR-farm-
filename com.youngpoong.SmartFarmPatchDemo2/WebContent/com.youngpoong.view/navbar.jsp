<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand" href="home.do"><img src="${pageContext.request.contextPath}/resources/assets/img/rogo.png" style="width:2rem">
	&nbsp;Ever Rich Auto</a>
	<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
	<i class="fas fa-bars"></i>
	</button>
	<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	</form>
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			<i class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="myInfoAction.do">데이터 정보</a> <a
					class="dropdown-item" href="http://www.young-poong.co.kr" target="_blank">영풍산전</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" onclick="request();">로그아웃</a>
			</div>
		</li>
	</ul>
</nav>
<script>
	function request() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logoutAction.do"
			return true;
		} else {
			return false;
		}
	}
</script>
