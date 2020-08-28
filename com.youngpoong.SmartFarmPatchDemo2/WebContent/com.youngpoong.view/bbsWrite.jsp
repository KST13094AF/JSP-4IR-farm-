<%@page import="com.youngpoong.bbs.bbsDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
<title>글쓰기</title>
<%@ include file="css_js.jsp"%>
</head>
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
							<form action="bbsWriteAction.do" method="post">
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
									<input class="form-control py-4" id="inputEmailAddress" required name="title" id="title" type="text" placeholder="제목" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="content">내용</label>
									<textarea class="form-control py-4" rows="15" name="content" required placeholder="내용"></textarea>
								</div>
								<div class="form-group">
									<label class="btn btn-info btn-icon-split" for="file">파일선택</label>
									<input type="file" id="file" name="file" style="width:0%" onchange="onChange()">
									<span class="form-control" id="filec"></span>
								</div>
								<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<input type="reset" class="btn btn-secondary btn-icon-split" value="리셋">
									<input type="submit" class="btn btn-success btn-icon-split" value="글쓰기">
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
	<script type="text/javascript">
		function onChange(){
			var file = document.getElementById("file").value;
			document.getElementById("filec").innerHTML = file;
		}
	</script>
</body>
</html>
