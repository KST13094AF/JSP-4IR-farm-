<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>Ever Rich Auto Management System v.01</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed">
	<c:if test="${sendEmailResult eq 1}">
		<script>
			alert("성공적으로 메일을 보냈습니다.");
		</script>
	</c:if>
	<c:if test="${sendEmailResult eq 0}">
		<script>
			alert("메세지 발생 오류 ..");
		</script>
	</c:if>
	<c:if test="${updateResult eq 1}">
		<script>
			alert("정상적으로 수정되었습니다.");
		</script>
	</c:if>
	<c:if test="${updateResult eq 0}">
		<script>
			alert("회원정보 수정에 실패 했습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${updatePwResult eq 1}">
		<script>
			alert("정상적으로 수정되었습니다.");
		</script>
	</c:if>
	<c:if test="${updatePwResult eq 0}">
		<script>
			alert("수정에 실패 했습니다.");
		</script>
	</c:if>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<%@ include file="navbar.jsp"%>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<%@ include file="sidebar.jsp"%>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<h2 class="mt-4">환영합니다 ${userId}님</h2>
				<br>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Ever Rich Auto Management
						System입니다.</li>
				</ol>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-primary text-white mb-4">
							<div class="card-body">내 정보 수정</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="infoAction.do">바로가기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4">
							<div class="card-body">기본 데이터 조회</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="farmNormalAction.do">바로가기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4">
							<div class="card-body">차트 데이터 조회</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="farmChartAction.do">바로가기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4">
							<div class="card-body">피드백 전송</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="emailAction.do">바로가기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">주요 기술</h6>
								</div>
								<div class="card-body">4차 산업혁명의 주요 기술인 Smart Farm을 Ever Rich Auto Smartfarm Management System을 통해
								해당 농장의 실시간 온도 습도 및 산소 질소 이산화탄소 대기 분포도등의 데이터를 쉽게 확인하세요. 해당 홈페이지를 통해 직접 농장의 센서를 현장에 가지 않고 
								 조작 할 수 있습니다!! 
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">SmartFarm</h6>
								</div>
								<div class="card-body">
									<img src="${pageContext.request.contextPath}/resources/assets/img/smartfarm_inner.jpg" style="width:100%">
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Description</h6>
								</div>
								<div class="card-body">
									<ol>
										<li> 각종 센서(토양, 온습도, 이산화탄소 등)에서 Data를 수집</li>
										<li> Data를 기반으로 운영관리시스템에서 명령</li>
										<li> 시스템의 명령에 맞게 관수제어, 보온, 난방, 유동팬등을 조절하여 최적의 상태를 유지</li>
										<li> 스마트 농장에 cctv 웹카메라를 설치하여 시스템에서 접근가능</li>
										<li> 운영관리 시스템은 인터넷에 연결하여 정보공동활용 시스템을 통해 정보 수집</li>
									</ol>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Photo</h6>
								</div>
								<div class="card-body">
									<div id="images">
										<div id="carouselExampleControls" class="carousel slide"
											data-ride="carousel">
											<div class="carousel-inner">
												<div class="carousel-item active">
													<img src="${pageContext.request.contextPath}/resources/assets/img/smartfarm2.jpg" class="d-block w-100" alt="...">
												</div>
												<div class="carousel-item">
													<img src="${pageContext.request.contextPath}/resources/assets/img/smartfarm4.jpg" class="d-block w-100" alt="...">
												</div>
												<div class="carousel-item">
													<img src="${pageContext.request.contextPath}/resources/assets/img/smartfarm5.jpg" class="d-block w-100" alt="...">
												</div>
											</div>
											<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> 
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
											</a> <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> 
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">YouTube</h6>
								</div>
								<div class="card-body" style="max-width:100%">
									<iframe width="670" height="350" src="https://www.youtube.com/embed/F4Ccw_qBjQQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
							</div>
							
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
</body>
</html>
