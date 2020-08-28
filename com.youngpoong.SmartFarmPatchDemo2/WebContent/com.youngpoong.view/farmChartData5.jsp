<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.youngpoong.farm.farmDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	SimpleDateFormat fmt = new SimpleDateFormat("MM-dd");
%>
<%
	float maxT = 0, maxH = 0;
	@SuppressWarnings("unchecked")
	ArrayList<farmDto> list = (ArrayList<farmDto>) request.getAttribute("list");
	if (list.size() > 0) {
		for(int i=0; i<list.size(); i++){
			maxT += list.get(i).getT()/10;
			maxH += list.get(i).getH();
		}
		maxT = maxT/list.size();
		maxH = maxH/list.size();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>차트 데이터</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed">
	<%@ include file="navbar.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="sidebar.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<c:if test="<%=list.size() > 0%>">
					<h2 class="mt-4">주간별 온습도 상태 데이터</h2>
					<br>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">주간별 농장의 온도 습도 상태를 차트로
							수치화하여 보여줍니다. (일주일 간 평균)</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">온도
												평균(Temperatura)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=maxT%>'C
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=maxT%>%" aria-valuenow="50" aria-valuemin="0"
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
												class="text-xs font-weight-bold text-success text-uppercase mb-1">습도
												평균(Humidity)</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800"><%=maxH%>%
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width:<%=maxH%>%" aria-valuenow="50" aria-valuemin="0"
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
							<i class="fas fa-chart-pie mr-1"></i> 주간별 온습도 상태 차트
						</div>
						<div class="card-body">

							<div id="chart_div" style="width: 100%; height: 500px;"></div>
						</div>
						<div class="card-footer small text-muted">
							Updated at
							<fmt:formatDate value="<%=list.get(0).getData()%>"
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
											<th style="width:23%">번호</th>
											<th style="width:23%">온도</th>
											<th style="width:23%">습도</th>
											<th style="width:31%">날짜</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번호</th>
											<th>온도</th>
											<th>습도</th>
											<th>날짜</th>
										</tr>
									</tfoot>
									<tbody>
										<%
											for (int i = 0; i < list.size(); i++) {
										%>
										<tr>
											<td><%=i + 1%></td>
											<td><%=list.get(i).getT()/10%></td>
											<td><%=list.get(i).getH()%></td>
											<td><fmt:formatDate
													value="<%=list.get(i).getData()%>"
													pattern="yyyy년 MM월 dd일" /></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="<%=list.size() <= 0%>">
					<jsp:include page="noData.jsp" />
				</c:if>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<%@ include file="footer.jsp"%>
			</footer>
		</div>
	</div>
	<%@ include file="js_css.jsp"%>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      <%if (list.size() > 0) {%>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['시간', '습도', '온도'],
          <%for (int i = list.size()-1; i >= 0; i--) {%>['<%=fmt.format(list.get(i).getData())%>',<%=list.get(i).getH()%>,<%=list.get(i).getT()/10%>],<%}%>]);
			var options = {
				title : '주간별 온습도 변화량',
				hAxis : {
					title : 'Week',
					titleTextStyle : {
						color : '#333'
					}
				},
				vAxis : {
					minValue : 0
				}
			};
			var chart = new google.visualization.AreaChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
	<%}%>
	</script>
</body>
</html>
