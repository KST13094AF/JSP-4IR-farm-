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
<c:if test="${readResult eq  0}">
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
							<form method="post">
								<div class="form-group">
									<label class="small mb-1" for="options">구분</label> 
									<input class="form-control py-4" id="inputEmailAddress" required name="options" value="<%=bDto.getSeleter() %>" readonly id="options" type="text"/>
								</div>
								<div class="form-group">
									<label class="small mb-1" for="title">제목</label> 
									<input class="form-control py-4" id="inputEmailAddress" required name="title" value="<%=bDto.getTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %>" readonly id="title" type="text" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="date">마지막 수정날짜</label> 
									<input class="form-control py-4" id="inputEmailAddress" required name="date" value="<fmt:formatDate value="<%=bDto.getDate()%>" pattern="yyyy년 MM월 dd일 HH:mm:ss" />" readonly id="date" type="text"/>
								</div>
								<div class="form-group">
									<label class="small mb-1" for="content">내용</label>
									<textarea class="form-control py-4" rows="15" name="content" required readonly><%=bDto.getContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></textarea>
								</div>
								<c:if test="<%=!bDto.getUserID().equals(id)%>">
								<div style="float:right">
                					 <a href="bbsWrite.do" class="btn btn-success btn-icon-split"> 
									<span class="icon text-white-50"> 
									<i class="fas fa-check"></i>
									</span> <span class="text">글쓰기</span>
									</a>
								</div>
								</c:if>
								<c:if test="<%=bDto.getUserID().equals(id)%>">
								<div style="float:right">
									<a href="#" onclick="requestDel();" class="btn btn-secondary btn-icon-split"> 
									<span class="icon text-white-50"> 
									<i class="fas fa-trash"></i>
									</span> <span class="text">삭제</span>
									</a>
									<a href="bbsUpdateFromAction.do?page=<%=bDto.getId()%>" class="btn btn-warning btn-icon-split"> 
									<span class="icon text-white-50"> 
									<i class="fas fa-arrow-right"></i>
									</span> <span class="text">수정</span>
									</a>
									 <a href="bbsWrite.do" class="btn btn-success btn-icon-split"> 
									<span class="icon text-white-50"> 
									<i class="fas fa-check"></i>
									</span> <span class="text">글쓰기</span>
									</a>
								</div>
								</c:if>
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
