<%@page import="com.youngpoong.farm.farmDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<farmDto> list = (ArrayList<farmDto>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="css_js.jsp"%>
<title>회원가입</title>
</head>
<c:if test="${joinResult eq 0}">
	<script>
		alert("아이디 중복 또는 알 수 없는 에러가 발생 하였습니다.");
	</script>
</c:if>
<body class="bg-primary" style="background-color: #4e73df !important">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
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
													class="form-control py-4" name="pw" type="password" id="pw"
													onchange="pwCheck()" required placeholder="비밀번호" />
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
	<%@ include file="js_css.jsp"%>
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