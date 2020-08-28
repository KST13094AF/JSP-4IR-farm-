<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Data</title>
</head>
<body>
	<div id="layoutError">
		<div id="layoutError_content">
			<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<div class="text-center mt-4">
							<img class="mb-4 img-error"
								src="${pageContext.request.contextPath}/resources/assets/img/error-404-monochrome.svg" />
							<p class="lead">요청에 의한 데이터가 데이터베이스에 없습니다.</p>
							<a href="home.do"> <i class="fas fa-arrow-left mr-1"></i>
								Return to main
							</a>
						</div>
					</div>
				</div>
			</div>
			</main>
		</div>
	</div>
</body>
</html>