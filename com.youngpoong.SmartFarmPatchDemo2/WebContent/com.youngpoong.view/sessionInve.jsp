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
		alert("��Ⱓ �������� �ʾ� �α׾ƿ� �Ǿ����ϴ�.");
		location.href="home.do";
	</script>
</c:if>
</body>
</html>