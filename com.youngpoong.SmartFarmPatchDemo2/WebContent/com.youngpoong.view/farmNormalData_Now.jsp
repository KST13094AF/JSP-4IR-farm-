<%@page import="com.youngpoong.farm.farmDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	@SuppressWarnings("unchecked")
	ArrayList<farmDto> list = (ArrayList<farmDto>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>기본 데이터</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed">
	<%@ include file="navbar.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="sidebar.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<h2 class="mt-4">오늘 데이터</h2>
				<br>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">PLC에서 받아온 데이터를 텍스트 형태로
						보여줍니다.</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> DataTabl
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th style="width: 8%">번호</th>
										<th style="width: 10%">산소</th>
										<th style="width: 10%">질소</th>
										<th style="width: 10%">이산화탄소</th>
										<th style="width: 10%">온도</th>
										<th style="width: 10%">습도</th>
										<th style="width: 10%">토양</th>
										<th style="width: 10%">채광</th>
										<th style="width: auto%">날짜</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>산소</th>
										<th>질소</th>
										<th>이산화탄소</th>
										<th>온도</th>
										<th>습도</th>
										<th>토양</th>
										<th>채광</th>
										<th>날짜</th>
									</tr>
								</tfoot>
								<tbody>
									<%
											for (int i = 0; i < list.size(); i++) {
										%>
									<tr>
										<td><%=list.get(i).getNum() %></td>
										<c:if test="<%=list.get(i).getO() <= 10 %>"><td style="color:tomato"><%=list.get(i).getO()%></td></c:if>
										<c:if test="<%=list.get(i).getO() > 10%>"><td><%=list.get(i).getO()%></td></c:if>
										<c:if test="<%=list.get(i).getN() <= 70 %>"><td style="color:tomato"><%=list.get(i).getN()%></td></c:if>
										<c:if test="<%=list.get(i).getN() > 70%>"><td><%=list.get(i).getN()%></td></c:if>
										<c:if test="<%=list.get(i).getC() > 20 %>"><td style="color:tomato"><%=list.get(i).getC()%></td></c:if>
										<c:if test="<%=list.get(i).getC() <= 20%>"><td><%=list.get(i).getC()%></td></c:if>
										<c:if test="<%=list.get(i).getT()/10 > 40 %>"><td style="color:tomato"><%=list.get(i).getT()/10%></td></c:if>
										<c:if test="<%=list.get(i).getT()/10 <= 40%>"><td><%=list.get(i).getT()/10%></td></c:if>
										<c:if test="<%=list.get(i).getH() > 80 %>"><td style="color:tomato"><%=list.get(i).getH()%></td></c:if>
										<c:if test="<%=list.get(i).getH() <= 80%>"><td><%=list.get(i).getH()%></td></c:if>
										<c:if test="<%=list.get(i).getG() > 70%>"><td style="color:tomato"><%=list.get(i).getG()%></td></c:if>											<c:if test="<%=list.get(i).getG() <= 70%>"><td><%=list.get(i).getG()%></td></c:if>
										<c:if test="<%=list.get(i).getS() < 10 %>"><td style="color:tomato"><%=list.get(i).getS()%></td></c:if>
										<c:if test="<%=list.get(i).getS() >= 10%>"><td><%=list.get(i).getS()%></td></c:if>
										<td><fmt:formatDate value="<%=list.get(i).getData()%>"
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
</body>
</html>
