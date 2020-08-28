<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.youngpoong.farm.farmDto"%>
<%@page import="com.youngpoong.data.dataDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.youngpoong.user.userDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	@SuppressWarnings("unchecked")
	ArrayList<farmDto> list = (ArrayList<farmDto>) request.getAttribute("datalist"); //단일
	int chart[] = new int[7];
	if(list.size() > 0){
		for(int i =0; i<list.size(); i++)
			chart[0] += list.get(i).getTimeNum();
		for(int i =1; i<list.size(); i++)
			chart[1] += list.get(i).getTimeNum();
		for(int i =2; i<list.size(); i++)
			chart[2] += list.get(i).getTimeNum();
		for(int i =3; i<list.size(); i++)
			chart[3] += list.get(i).getTimeNum();
		for(int i =4; i<list.size(); i++)
			chart[4] += list.get(i).getTimeNum();
		for(int i =5; i<list.size(); i++)
			chart[5] += list.get(i).getTimeNum();
		for(int i =6; i<list.size(); i++)
			chart[6] += list.get(i).getTimeNum();
	}
	@SuppressWarnings("unchecked")
	ArrayList<dataDto> list3 = (ArrayList<dataDto>) request.getAttribute("dataInfo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내 정보</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<%@ include file="navbar.jsp"%>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<%@ include file="sidebar.jsp"%>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<h1 class="mt-4" style="font-weight: bold">농장 데이터 정보</h1>
				<br>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area mr-1"></i> 일자 별 데이터량 (일주일)
							</div>
							<div class="card-body">
								<c:if test="<%=list.size() > 0%>">
									<canvas id="myAreaChart2" width="100%" height="40"></canvas>
								</c:if>
								<c:if test="<%=list.size() <= 0%>">
									<h5 style="color: tomato;">NO data in the Database</h5>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar mr-1"></i> 누적 데이터량 (일주일)
							</div>
							<div class="card-body">
								<c:if test="<%=list.size() > 0%>">
									<canvas id="myBarChart2" width="100%" height="40"></canvas>
								</c:if>
								<c:if test="<%=list.size() <= 0%>">
									<h5 style="color: tomato;">NO data in the Database</h5>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> 업데이트 & 접근 데이터 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th style="width:10%">번호</th>
										<th style="width:15%">접근 컬럼</th>
										<th style="width:22%">세부 메세지</th>
										<th style="width:22%">접근 아이피</th>
										<th style="width:auto">시도 날짜</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>접근 컬럼</th>
										<th>세부 메세지</th>
										<th>접근 아이피</th>
										<th>시도 날짜</th>
									</tr>
								</tfoot>
								<tbody>
									<%
										for (int i = 0; i < list3.size(); i++) {
									%>
									<tr>
										<td><%=i + 1%></td>
										<td><%=list3.get(i).getColumn()%></td>
										<td><%=list3.get(i).getMsg()%></td>
										<td><%=list3.get(i).getIp()%></td>
										<td><fmt:formatDate value="<%=list3.get(i).getDate()%>"
												pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<footer class="py-4 bg-light mt-auto">
				<%@ include file="footer.jsp"%>
			</footer>
		</div>
	</div>
	<%@ include file="js_css.jsp"%>
	<script type="text/javascript">
	<%if (list.size() > 0) {%>
			Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#292b2c';
			// Area Chart Example
			var ctx = document.getElementById("myAreaChart2");
			var myLineChart = new Chart(
					ctx,
					{
						type : 'line',
						data : {
							labels : [ <%for (int i = list.size() - 1; i >= 0; i--) {%> "<%=fmt.format(list.get(i).getData())%>", <%}%> ],
							datasets : [ {
								label : "데이터 량",
								lineTension : 0.3,
								backgroundColor : "rgba(2,117,216,0.2)",
								borderColor : "rgba(2,117,216,1)",
								pointRadius : 5,
								pointBackgroundColor : "rgba(2,117,216,1)",
								pointBorderColor : "rgba(255,255,255,0.8)",
								pointHoverRadius : 5,
								pointHoverBackgroundColor : "rgba(2,117,216,1)",
								pointHitRadius : 50,
								pointBorderWidth : 2,
								data : [ <%for (int i = list.size() - 1; i >= 0; i--) {%> <%=list.get(i).getTimeNum()%>, <%}%> ],
			
							} ],
						},
						options : {
							scales : {
								xAxes : [ {
									time : {
										unit : 'date'
									},
									gridLines : {
										display : false
									},
									ticks : {
										maxTicksLimit : 7
									}
								} ],
								yAxes : [ {
									ticks : {
										min : 0,
										max : 2000,
										maxTicksLimit : 5
									},
									gridLines : {
										color : "rgba(0, 0, 0, .125)",
									}
								} ],
							},
							legend : {
								display : false
							}
						}
					});
			<%}%>
		</script>
	<script type="text/javascript">
		 <%if (list.size() > 0) {%>
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';
		// Bar Chart Example
		var ctx = document.getElementById("myBarChart2");
		var myLineChart = new Chart(ctx, {
		  type: 'bar',
		  data: {
		    labels: [<%for (int i = list.size() - 1; i >= 0; i--) {%> "<%=fmt.format(list.get(i).getData())%>", <%}%>],
		    datasets: [{
		      label: "누적 데이터량",
		      backgroundColor: "rgba(2,117,216,1)",
		      borderColor: "rgba(2,117,216,1)",
		      data: [<%for (int i = list.size() - 1; i >= 0; i--) {%> <%=chart[i]%>, <%}%>],
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'month'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 6
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 5000,
		          maxTicksLimit: 5
		        },
		        gridLines: {
		          display: true
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
		<%}%>
		</script>
</body>
</html>
