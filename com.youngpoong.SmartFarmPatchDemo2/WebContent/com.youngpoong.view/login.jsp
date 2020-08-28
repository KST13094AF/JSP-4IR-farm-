<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/owl.theme.default.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/jquery.fancybox.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/bootstrap-datepicker.css">

<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css2/style.css">

</head>
<c:choose>
	<c:when test="${loginFail eq 0}">
		<script>
			alert("아이디 또는 비밀번호를 확인해주세요.");
		</script>
	</c:when>
	<c:when test="${loginFail eq -1}">
		<script>
			alert("DB오류입니다.");
		</script>
	</c:when>
</c:choose>
<c:if test="${pwForgetResult eq 1}">
	<script>
		alert("정상적으로 변경되었습니다.");
	</script>
</c:if>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
<c:if test="${!empty userId}">
	<jsp:include page="home.do"/>
</c:if>
	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<header class="site-navbar py-4 js-sticky-header site-navbar-target"
			role="banner">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<div class="ml-auto w-25">
						<a href="#"
							class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black float-right"><span
							class="icon-menu h3"></span></a>
					</div>
				</div>
			</div>
		</header>
		<div class="intro-section" id="home-section">
			<div class="slide-1"
				style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/main_banner2.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-12">
							<div class="row align-items-center">
								<div class="col-lg-6 mb-4">
									<h1 data-aos="fade-up" data-aos-delay="100">Ever Rich Auto Management System</h1>
									<p class="mb-4" data-aos="fade-up" data-aos-delay="200">
									Ever Rich Auto에 오신걸 환영합니다. 접속 하여 해당 Smart farm의 데이터를 확인 할 수 있습니다.
									또한 홈페이지를 통한 센서 직접 제어도 가능합니다.
									</p>
									<p data-aos="fade-up" data-aos-delay="300">
										<a href="join.do" class="btn btn-primary py-3 px-5 btn-pill">Sign up</a>
									</p>
								</div>
								<div class="col-lg-6 mb-4">
									<div class="card shadow-lg border-0 rounded-lg mt-5 "
										data-aos="fade-up" data-aos-delay="500">
										<div class="card-header">
											<h3 class="text-center font-weight-light my-4">로그인</h3>
										</div>
										<div class="card-body">
											<form action="loginAction.do" method="post">
												<div class="form-group">
													<label class="small mb-1" for="id"> Id</label> <input
														class="form-control py-4" id="inputEmailAddress" autofocus
														required name="id" id="id" type="text" placeholder="아이디" />
												</div>
												<div class="form-group">
													<label class="small mb-1" for="pw">Password</label> <input
														class="form-control py-4" id="inputPassword" name="pw"
														required id="pw" type="password" placeholder="비밀번호" />
												</div>
												<div
													class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
													<a class="small" href="pwForgetForm.do">Forgot
														Password?</a> <input type="submit" class="btn btn-primary"
														value="Login">
												</div>
											</form>
										</div>
										<div class="card-footer text-center">
											<div class="small">
												<a href="join.do">Need an account? Sign up</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .site-wrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js2/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/bootstrap-datepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js2/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js2/jquery.sticky.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js2/main.js"></script>

</body>
</html>