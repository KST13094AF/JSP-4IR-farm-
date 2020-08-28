<%@page import="com.youngpoong.user.userDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	userDto uDto = (userDto) request.getAttribute("emailInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="css_js.jsp"%>
<title>이메일 보내기</title>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">Report</h3>
							</div>
							<div class="card-body">
								<form action="sendMailAction.do" method="post">
									<div class="form-group">
										<label class="small mb-1" for="id">ID</label> <input
											class="form-control py-4" type="text" autofocus required
											name="id" value="${userId}" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="email">Email</label>
										<input class="form-control py-4" name="email" type="email" id="email"
											required value="<%=uDto.getEmail() %>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="farm">내용</label>
										<textarea class="form-control py-4" rows="" cols="" name="message"></textarea>
									</div>
									<div class="form-group mt-4 mb-0">
										<input type="submit" value="이메일 보내기"
											class="btn btn-primary btn-block">
									</div>
								</form>
							</div>
							<div class="card-footer text-center">
								<div class="small">
									<a href="home.do">return to main?</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
	<%@ include file="js_css.jsp"%>
</body>
</html>