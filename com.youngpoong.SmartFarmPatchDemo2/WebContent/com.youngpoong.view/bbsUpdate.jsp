<%@page import="com.youngpoong.bbs.bbsDto"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
bbsDto bDto = (bbsDto)request.getAttribute("list");
String id = (String)session.getAttribute("userId");
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
<c:if test="${updateResult eq  0}">
	<script type="text/javascript">
		alert("정보를 읽어오는데 실패 했습니다.");
	</script>
</c:if>
<body class="sb-nav-fixed">
	<%@ include file="navbar.jsp"%>
	<div id="layoutSidenav">
		<%@ include file="sidebar.jsp"%>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<br><br><br>
				<div class="row justify-content-center">
					<div class="col-lg-6 mb-4">
						<div>
							<form action="bbsUpdateAction.do?page=<%=bDto.getId()%>" method="post" id="form">
								<div class="form-group">
									<label class="small mb-1" for="options">카테고리</label>
									 <select name="options" class="form-control" id="options" required autofocus>
										<option value="">분류</option>
										<option value="질문">질문</option>
										<option value="정보">정보</option>
										<option value="공유">공유</option>
										<option value="그외">그외</option>
									</select>
								</div>
								<div class="form-group">
									<label class="small mb-1" for="title">제목</label> 
									<input class="form-control py-4" id="inputEmailAddress" required name="title" value="<%=bDto.getTitle() %>" id="title" type="text" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="content">내용</label>
									<textarea class="form-control py-4" rows="15" id="content" name="content" required><%=bDto.getContent() %></textarea>
								</div>
								<div style="float:right">
									</a>
									<input type="submit" class="btn btn-warning btn-icon-split" value="수정하기">  
								</div>
							</form>
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
	<script>
	function requestDel() {
		if (confirm("삭제 하시겠습니까?")) {
			location.href = "bbsDeleteAction.do?page=<%=bDto.getId()%>"
			return true;
		} else {
			return false;
		}
	}
</script>
</body>
</html>
