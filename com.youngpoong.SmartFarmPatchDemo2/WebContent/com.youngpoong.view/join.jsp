<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>회원가입</title>
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
<c:if test="${joinResult eq 0}">
	<script>
		alert("아이디 중복 또는 알 수 없는 에러가 발생 하였습니다.");
	</script>
</c:if>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<div class="site-wrap">
		<div class="intro-section" id="home-section">
			<div class="slide-1"
				style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/main_banner2.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5 "
								data-aos="fade-up" data-aos-delay="350">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">회원가입</h3>
								</div>
								<div class="card-body">
									<form action="joinAction.do" method="post">
										<div class="form-group">
											<label class="small mb-1" for="id">ID</label> <input
												class="form-control py-4" type="text" autofocus required
												name="id" placeholder="아이디" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="name">Name</label> <input
												class="form-control py-4" name="name" type="text" id="name"
												required placeholder="이름" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="email">Email</label> <input
												class="form-control py-4" name="email" type="email"
												id="email" required placeholder="이메일" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="farm">Farm</label> <input
												class="form-control py-4" name="farm" type="text" id="farm"
												required placeholder="농장" />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="pw">Password</label> <input
														class="form-control py-4" name="pw" type="password"
														id="pw" onchange="pwCheck()" required placeholder="비밀번호" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="pw_re">Confirm
														Password</label> <input class="form-control py-4" type="password"
														onchange="pwCheck()" required name="pw_re" id="pw_re"
														placeholder="비밀번호 확인" />
												</div>
											</div>
											<div class="col-md-6">
												<span id="same" style="font-size: 0.8rem;"></span>
											</div>
										</div>
										<div class="form-group mt-4 mb-0">
											<input type="submit" value="회원가입"
												class="btn btn-primary btn-block">
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="login.do">Have an account? Go to login</a>
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
	<script>
		function pwCheck() {
			if (document.getElementById('pw').value != ''
					&& document.getElementById('pw_re').value != '') {
				if (document.getElementById('pw').value == document
						.getElementById('pw_re').value) {
					document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
					document.getElementById('same').style.color = "blue";
				} else {
					document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
					document.getElementById('same').style.color = "tomato";
				}
			}
		}
	</script>
</body>
</html>