<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="css_js.jsp"%>
<title>로그인</title>
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
<body class="bg-primary" style="background-color: #4e73df !important">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
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
										<a class="small" href="pwForgetForm.do">Forgot Password?</a> <input
											type="submit" class="btn btn-primary" value="Login">
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
	<%@ include file="js_css.jsp"%>
</body>
</html>