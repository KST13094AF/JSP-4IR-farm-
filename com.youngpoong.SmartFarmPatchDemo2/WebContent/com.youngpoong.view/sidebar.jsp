<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">Banner</div>
				<a class="nav-link" href="home.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-fw fa-tachometer-alt"></i>
					</div> Home
				</a>
				<div class="sb-sidenav-menu-heading">Info</div>
				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseLayouts" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-fw fa-wrench"></i>
					</div> 내정보 수정
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseLayouts"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="infoAction.do">정보 수정</a> <a
							class="nav-link" href="pwUpdateForm.do">비밀번호 수정</a>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">DATA</div>
				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#data" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div> 기본 데이터
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="data" aria-labelledby="headingOne"
					data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="farmNormalAction.do">전체 데이터</a> <a
							class="nav-link" href="farmNormalActionNow.do">오늘 데이터</a> <a
							class="nav-link" href="farmNormalActionDate.do">날짜 데이터</a>
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#data2" aria-expanded="false"
					aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> 차트 데이터
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="data2" aria-labelledby="headingOne"
					data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="farmChartAction.do">현재 대기상태</a> <a
							class="nav-link" href="farmChartAction.do?number=2">현재 온습상태</a> <a
							class="nav-link" href="farmChartAction.do?number=3">현재 토양
							채광상태</a> <a class="nav-link" href="farmChartAction2.do?">주간 대기상태</a>
						<a class="nav-link" href="farmChartAction3.do">주간 온습상태</a> <a
							class="nav-link" href="farmChartAction4.do">주간 토양 채광상태</a>
					</nav>
				</div>
				<a class="nav-link" href="sensorAction.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-fw fa-cog"></i>
					</div> 상태 제어
				</a>
				<div class="sb-sidenav-menu-heading">Board</div>
				<a class="nav-link" href="bbsAction.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div> 게시판
				</a>
				<div class="sb-sidenav-menu-heading">Report</div>
				<a class="nav-link" href="emailAction.do">
					<div class="sb-nav-link-icon">
						<i class="fas fa-fw fa-folder"></i>
					</div> 이메일
				</a>
			</div>
		</div>
	</nav>
</div>