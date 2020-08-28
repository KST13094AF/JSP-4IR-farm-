<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="css_js.jsp"%>
</head>
<body>
	<c:choose>
		<c:when test="${pwForgetResult eq 0}">
			<script>
				alert("아이디 이메일을 확인해주세요.");
			</script>
		</c:when>
		<c:when test="${pwForgetResult eq -1}">
			<script>
				alert("DB오류 발생");
				history.back();
			</script>
		</c:when>
	</c:choose>
<body class="bg-primary" style="background-color: #4e73df !important">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-5">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
							</div>
							<div class="card-body">
								<div class="small mb-3 text-muted">아이디와 가입시 입력한 이메일을
									입력해주세요.</div>
								<form action="pwForgetAction.do" method="post">
									<div class="form-group">
										<label class="small mb-1" for="id">Id</label> <input
											class="form-control py-4" name="id" type="text" autofocus
											id="id" required placeholder="아이디" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="email">Email</label> <input
											class="form-control py-4" name="email" type="email"
											id="email" autofocus required placeholder="이메일" />
									</div>
									<div
										class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
										<a class="small" href="login.do">Return to login</a> <input
											type="submit" class="btn btn-primary" value="Reset Password">
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