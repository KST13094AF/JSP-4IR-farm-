<%@page import="com.youngpoong.bbs.bbsDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
@SuppressWarnings("unchecked")
ArrayList<bbsDto> list = (ArrayList<bbsDto>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>
<%@ include file="css_js.jsp"%>
</head>
<c:if test="${writeResult eq 0}">
	<script type="text/javascript">
		alert("글쓰기에 실패했습니다.");
	</script>
</c:if>
<c:if test="${updateResult eq 1}">
	<script type="text/javascript">
		alert("정상적으로 수정되었습니다.");
	</script>
</c:if>
<c:if test="${updateResult eq 0}">
	<script type="text/javascript">
		alert("글수정에 실패했습니다.");
	</script>
</c:if>
<body class="sb-nav-fixed">
	<%@ include file="navbar.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="sidebar.jsp"%>
		<div id="layoutSidenav_content">
				<div class="container-fluid">
					<h2 class="mt-4">게시판</h2>
					<br> 
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">다른 유저와 정보를 공유해 보세요.</li>
					</ol>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 게시판 목록
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th style="width: 10%">번호</th>
											<th style="width: 10%">분류</th>
											<th style="width: 10%">작성자</th>
											<th style="width: 50%">제목</th>
											<th style="width: auto%">업데이트 날짜</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번호</th>
											<th>분류</th>
											<th>작성자</th>
											<th>제목</th>
											<th>업데이트 날짜</th>
										</tr>
									</tfoot>
									<tbody>
										<% for(int i=0; i<list.size(); i++) { %>
										<tr>
											<td><%=i+1 %></td>
											<td><%=list.get(i).getSeleter() %></td>
											<td><%=list.get(i).getUserID() %></td>
											<td><a href="bbsReadAction.do?page=<%=list.get(i).getId()%>"><%=list.get(i).getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a></td>
											<td><fmt:formatDate value="<%=list.get(i).getDate()%>" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
										</tr>
										<% } %>
									</tbody>
								</table>
							</div>				
						</div>
					</div>
					<div style="float:right">
                		 <a href="bbsWrite.do" class="btn btn-success btn-icon-split"> 
							<span class="icon text-white-50"> 
							<i class="fas fa-check"></i>
							</span> 
							<span class="text">글쓰기</span>
						</a>
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
