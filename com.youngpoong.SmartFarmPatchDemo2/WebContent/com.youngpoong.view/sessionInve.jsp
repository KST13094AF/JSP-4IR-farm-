<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${userId eq null}">
	<script>
		alert("장기간 응답하지 않아 로그아웃 되었습니다.");
		location.href="home.do";
	</script>
</c:if>
</body>
</html>