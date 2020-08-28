<%@page import="com.youngpoong.stat.statDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	statDto sDto = (statDto)request.getAttribute("list");
	float reH = 0, reT = 0; boolean enter = false;
	if (sDto.getT() > 0f) {
		enter = true;
		reH = 100 - sDto.getH()/10;
		reT = 100 - sDto.getT()/10;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<title>차트 데이터</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed">
	<%@ include file="navbar.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="sidebar.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<c:if test="<%=enter == true%>">
					<h2 class="mt-4">온습 상태 데이터</h2>
					<br>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">현재 농장의 온습 상태를 차트로 수치화하여
							보여줍니다.</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">온도(Temperatura)&nbsp;
											<c:if test="<%=sDto.getT()/10 > 35 %>"><img src="${pageContext.request.contextPath}/resources/assets/img/waring.png" style="width:20px"></c:if>	
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=sDto.getT()/10%>'C
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=sDto.getT()/10%>%" aria-valuenow="50"
														aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">습도(Humidity)&nbsp;
												<c:if test="<%=sDto.getH()/10 > 60 %>"><img src="${pageContext.request.contextPath}/resources/assets/img/waring.png" style="width:20px"></c:if>	
											</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=sDto.getH()/10%>%
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=sDto.getH()/10%>%" aria-valuenow="50"
														aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area mr-1"></i>현재 온도 상태
								</div>
								<div class="card-body">
									<canvas id="donutChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar mr-1"></i>현재 습도 상태
								</div>
								<div class="card-body">
									<canvas id="donutChart2" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> DataTable
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th style="width:30%">온도</th>
											<th style="width:30%">습도</th>
											<th style="width:40%">날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=sDto.getT()/10%></td>
											<td><%=sDto.getH()/10%></td>
											<td><fmt:formatDate value="<%=sDto.getDate()%>"
													pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="<%= enter == false%>">
					<jsp:include page="noData.jsp" />
				</c:if>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<%@ include file="footer.jsp"%>
			</footer>
		</div>
	</div>
	<%@ include file="js_css.jsp"%>
	<script>
	<%if (sDto != null) {%>
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Pie Chart Example
		var ctx = document.getElementById("donutChart");
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "온도", "최대값"],
				datasets : [ {
					data : [<%=sDto.getT()/10%>,<%=reT%>,],
					backgroundColor : [  '#ffc107', '#E2E2E2',],
				} ],
			},
		});
	<%}%>
	</script>
	<script>
	<%if (sDto != null) {%>
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Pie Chart Example
		var ctx = document.getElementById("donutChart2");
		var myPieChart = new Chart(ctx, {
			type : 'pie',
			data : {
				labels : [ "습도", "최대값"],
				datasets : [ {
					data : [<%=sDto.getH()/10%>,<%=reH%>,],
					backgroundColor : [ '#007bff', '#E2E2E2',],
				} ],
			},
		});
	<%}%>
	</script>
</body>
</html>
