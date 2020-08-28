<%@page import="com.youngpoong.stat.statDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	statDto sDto = (statDto)request.getAttribute("list");
	boolean enter = false;
	float pt = 0;
	float o = 0, n = 0, c = 0;
	if (sDto.getO() > 0f) {
		enter = true;
		pt = sDto.getO() + sDto.getN() + sDto.getC();
		o = (sDto.getO() / pt) * 100;
		n = (sDto.getN() / pt) * 100;
		c = (sDto.getC() / pt) * 100;
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
				<c:if test="<%= enter == true %>">
					<h2 class="mt-4">대기 상태 데이터</h2>
					<br>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">현재 농장의 대기 상태를 차트로 수치화하여
							보여줍니다.</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">산소(Oxyzen)&nbsp;
												<c:if test="<%=(int)o <= 10 || (int)o > 60%>"><img src="${pageContext.request.contextPath}/resources/assets/img/waring.png" style="width:20px"></c:if>
												</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=Math.round(o*100)/100.0%>%
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=o%>%" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">질소(Nitrogen)&nbsp;
												<c:if test="<%=(int)n < 15  || (int)n > 80%>"><img src="${pageContext.request.contextPath}/resources/assets/img/waring.png" style="width:20px"></c:if>
												</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=Math.round(n*100)/100.0%>%
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=n%>%" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100"></div>
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
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">이산화탄소(Carbon)&nbsp;
												<c:if test="<%=(int)c > 15 %>"><img src="${pageContext.request.contextPath}/resources/assets/img/waring.png" style="width:20px"></c:if>
												</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=Math.round(c*100)/100.0%>%
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=c%>%" aria-valuenow="50" aria-valuemin="0"
														aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-pie mr-1"></i> 현재 대기 상태 차트
						</div>
						<div class="card-body">
							<canvas id="donutChart" width="100%" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">
							Updated at
							<fmt:formatDate value="<%=sDto.getDate()%>"
								pattern="yyyy년 MM월 dd일 HH:mm:ss" />
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
											<th style="width:23%">산소</th>
											<th style="width:23%">질소</th>
											<th style="width:23%">이산화탄소</th>
											<th style="width:31%">날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=sDto.getO()/10%></td>
											<td><%=sDto.getN()/10%></td>
											<td><%=sDto.getC()/10%></td>
											<td><fmt:formatDate value="<%=sDto.getDate()%>"
													pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="<%=enter == false%>">
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
				labels : [ "산소", "이산화탄소", "질소" ],
				datasets : [ {
					data : [<%=sDto.getO()/10%>,<%=sDto.getC()/10%>,<%=sDto.getN()/10%>],
					backgroundColor : [ '#007bff', '#ffc107', '#3CB371' ],
				} ],
			},
		});
	<%}%>
	</script>
</body>
</html>
