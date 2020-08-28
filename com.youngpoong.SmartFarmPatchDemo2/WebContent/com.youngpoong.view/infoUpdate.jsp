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
<body class="bg-primary" style="background-color: #4e73df !important">
	<c:if test="<%=uDto == null%>">
		<script>
			alert("내 정보를 가져오는데 오류가 발생했습니다.");
			history.back();
		</script>
	</c:if>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">내 정보</h3>
							</div>
							<div class="card-body">
								<form action="joinAction.do" method="post">
									<div class="form-group">
										<label class="small mb-1" for="id">ID</label> <input
											class="form-control py-4" type="text" id="id" readonly
											value="<%=uDto.getId()%>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="name">Name</label> <input
											class="form-control py-4" name="name" type="text" id="name"
											readonly value="<%=uDto.getName()%>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="email">Email</label> <input
											class="form-control py-4" name="email" type="email"
											id="email" readonly value="<%=uDto.getEmail()%>" />
									</div>
									<div class="form-group">
										<label class="small mb-1" for="farm">Farm</label> <input
											class="form-control py-4" name="farm" type="text" id="farm"
											readonly value="<%=uDto.getFarm()%>" />
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<a class="btn btn-primary btn-block"
													href="infoUpdateFormAction.do">수정</a>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<a class="btn btn-primary btn-block" onclick="requestDel();">삭제</a>
											</div>
										</div>
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
		</div>
	</div>
	<%@ include file="js_css.jsp"%>
	<script>
		function requestDel() {
			if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "infoDeleteAction.do"
				return true;
			} else {
				return false;
			}
		}
	</script>
</body>
</html>