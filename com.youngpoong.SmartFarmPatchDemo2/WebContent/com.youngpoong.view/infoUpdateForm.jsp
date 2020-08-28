<%@page import="com.youngpoong.user.userDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	userDto uDto = (userDto) request.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="css_js.jsp"%>
<title>내 정보 수정</title>
</head>
<c:if test="<%=uDto == null%>">
	<script>
		alert("내 정보를 가져오는데 오류가 발생했습니다.");
		history.back();
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
								<h3 class="text-center font-weight-light my-4">내 정보 수정</h3>
							</div>
							<div class="card-body">
								<form action="infoUpdateAction.do" method="post">
									<div class="form-group">
										<label class="small mb-1" for="inputEmailAddress">Name</label>
										<input class="form-control py-4" name="name" type="text"
											required value="<%=uDto.getName() %>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="inputEmailAddress">Email</label>
										<input class="form-control py-4" name="email" type="email"
											required value="<%=uDto.getEmail() %>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="inputEmailAddress">Farm</label>
										<input class="form-control py-4" name="farm" type="text"
											required value="<%=uDto.getFarm() %>" />
									</div>
									<div class="form-group mt-4 mb-0">
										<input type="submit" value="수정"
											class="btn btn-primary btn-block">
									</div>
								</form>
							</div>
							<div class="card-footer text-center">
								<div class="small">
									<a href="infoAction.do">return info?</a>
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