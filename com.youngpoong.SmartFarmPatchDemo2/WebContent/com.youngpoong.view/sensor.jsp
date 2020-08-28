<%@page import="com.youngpoong.sensor.sensorDto"%>
<%@page import="com.youngpoong.stat.statDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
statDto sDto = (statDto) request.getAttribute("stat");
statDto sDtoG = (statDto) request.getAttribute("goal");
sensorDto senDto = (sensorDto) request.getAttribute("sensor");
session.setAttribute("auto", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>데이터 조작</title>
<%@ include file="css_js.jsp"%>
</head>
<body class="sb-nav-fixed"  onload="showClock()">
	<c:if test="${statSet eq 0}">
		<script>
			alert("현재 값 보다 작은 값을 설정 하였습니다.");
		</script>
	</c:if>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<%@ include file="navbar.jsp"%>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<%@ include file="sidebar.jsp"%>
			</nav>
		</div>
			<div id="layoutSidenav_content">
				<div id="load">
				<div class="container-fluid">
					<c:if test="<%=sDto.getO() >= 0f%>">
					<h2 class="mt-4">종합 시스템 제어판 입니다.</h2>
					<br>
					<ol class="breadcrumb mb-4" style="margin-top: 10px">
						<li class="breadcrumb-item active">현재 제어 시스템의 현황과 조작을 할 수
							있습니다.</li>
					</ol>
					<div>
						<c:if test="<%=senDto.getInsertAuto() == 0 %>">
						<a class="btn btn-secondary btn-icon-split" href="sensorActionAuto.do?Auto=2" >데이터 자동 업로드</a>
						</c:if>
						<c:if test="<%=senDto.getInsertAuto() == 1 %>">
						<a class="btn btn-primary btn-icon-split" href="sensorActionAuto.do?Auto=4">데이터 수동 업로드</a>
						</c:if>
						<c:if test="<%=senDto.getAuto() == 0 %>">
						<a class="btn btn-secondary btn-icon-split" href="#" onclick="on();">데이터 자동 새로고침</a>
						<label class="m-0 font-weight-bold text-primary" for="sec">시간선택</label>
						<select id="sec" >
							<option value="0">선택안함</option>
							<option value="3000">3초</option>
							<option value="5000">5초</option>
							<option value="10000">10초</option>
							<option value="30000">30초</option>
						</select>
						</c:if>
						<c:if test="<%=senDto.getAuto() != 0 %>">
						<a class="btn btn-primary btn-icon-split" href="#" onclick="on();">데이터 수동 새로고침</a>
						<label for="sec" class="m-0 font-weight-bold text-primary">시간선택</label>
						<select id="sec">
							<option value="0">선택안함</option>
							<option value="3000">3초</option>
							<option value="5000">5초</option>
							<option value="10000">10초</option>
							<option value="30000">30초</option>
						</select>
						</c:if>
					</div>
					<br>
					<div class="row">
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/T.png" style="width: 1.5rem">
										&nbsp;온도 제어
									</h6>
								</div>
								<c:if test="<%=sDto.getT() > sDtoG.getT() && senDto.getTs() == 1%>">
									<script>
										location.href="sensorActionStopAction.do?T";
									</script>
								</c:if>
								<!-- Card Body -->
								<c:if test="<%=senDto.getTs() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getTs() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 온도
									<%=sDto.getT()/10%>'C
								</div>
								<div class="card-body" style="margin-top: 0rem">
									목표 온도
									<%=sDtoG.getT()/10%>'C
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<span class="m-0 font-weight-bold text-primary">목표값</span>
									<input type="number" name="T" id="T" style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onT()">수행</a>
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopT()">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/H.png" style="width: 1.5rem">
										&nbsp;습도 제어
									</h6>
								</div>
								<!-- Card Body -->
								<c:if test="<%=senDto.getHs() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getHs() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 습도
									<%=sDto.getH()/10%>%
								</div>
								<div class="card-body" style="margin-top: 0rem">
									목표 습도
									<%=sDtoG.getH()/10%>%
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<span class="m-0 font-weight-bold text-primary">목표값</span> 
									<input type="number" id="H" style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onH()">수행</a>
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopH()">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/A.png" style="width: 1.5rem">
										&nbsp;환기 제어
									</h6>
								</div>
								<!-- Card Body -->
								<c:if test="<%=senDto.getAris() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getAris() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 RPM
									<%=sDto.getAir()%></div>
								<div class="card-body" style="margin-top: 0rem">
									목표 RPM
									<%=sDtoG.getAir()%></div>
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<span class="m-0 font-weight-bold text-primary">설정치</span> 
									<input type="text" id="Air" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onAir()">수행</a> 
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopAir()">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/W.png" style="width: 1.5rem">&nbsp;관수 제어
									</h6>
								</div>
								<!-- Card Body -->
								<c:if test="<%=senDto.getGs() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getGs() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 토양 수분
									<%=sDto.getG()/10%>%
								</div>
								<div class="card-body" style="margin-top: 0rem">
									목표 토양 수분
									<%=sDtoG.getG()/10%>%
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<span class="m-0 font-weight-bold text-primary">목표값</span> 
									<input type="number" id="G" style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onG()">수행</a>
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopG()">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/S.png" style="width: 1.5rem">
										&nbsp;채광 제어
									</h6>
								</div>
								<!-- Card Body -->
								<c:if test="<%=senDto.getSs() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getSs() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 채광
									<%=sDto.getS()/10%>%
								</div>
								<div class="card-body" style="margin-top: 0rem">
									목표 채광
									<%=sDtoG.getS()/10%>%
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between" >
									<span class="m-0 font-weight-bold text-primary">목표값</span> 
									<input type="number" id="S" style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onS()">수행</a>
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopS()">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/AA.png" style="width: 1.5rem">&nbsp;대기 제어
									</h6>
								</div>
								<!-- Card Body -->
								<c:if test="<%=senDto.getPs() != 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem;">
										<div class="card-body">정상 작동 중</div>
									</div>
								</c:if>
								<c:if test="<%=senDto.getPs() == 0%>">
									<div class="card bg-success text-white" style="margin: 0.5rem; background-color: #e74a3b !important">
										<div class="card-body">작동 중지</div>
									</div>
								</c:if>
								<div class="card-body" style="margin-top: 0rem">
									현재 이산화탄소
									<%=sDto.getC()/10%>%
								</div>
								<div class="card-body" style="margin-top: 0rem">
									목표 이산화탄소
									<%=sDtoG.getC()/10%>%
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<span class="m-0 font-weight-bold text-primary">목표값</span> 
									<input type="number" id="C"  style="max-width:38%">
									<a class="btn btn-info btn-icon-split" href="#" onclick="onC()">수행</a>
									<a class="btn btn-warning btn-icon-split" href="#" onclick="stopC()">정지</a>
								</div>
							</div>
						</div>
					<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/cm.png" style="width: 1.5rem">&nbsp;
										외부 카메라 상태
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card bg-success text-white" style="margin: 0.5rem;">
								<div class="card-body">정상 녹화 중</div>
								</div>
								<div class="card-body" style="margin-top: 0rem">
									실시간 녹화 시간
								</div>
								<div class="card-body" id="divClock" style="margin-top: 0rem">
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<a class="btn btn-info btn-icon-split" href="#">녹화</a>
									<a class="btn btn-warning btn-icon-split" href="#">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/cm.png" style="width: 1.5rem">&nbsp;
										농장 카메라 상태
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card bg-success text-white" style="margin: 0.5rem;">
								<div class="card-body">정상 녹화 중</div>
								</div>
								<div class="card-body" style="margin-top: 0rem">
									실시간 녹화 시간
								</div>
								<div class="card-body" id="divClock2" style="margin-top: 0rem">
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<a class="btn btn-info btn-icon-split" href="#">녹화</a>
									<a class="btn btn-warning btn-icon-split" href="#">정지</a>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-lg-5">
							<div class="card shadow mb-4">
								<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">
										<img src="${pageContext.request.contextPath}/resources/assets/img/cm.png" style="width: 1.5rem">&nbsp;
										관리실 카메라 상태
									</h6>
								</div>
								<!-- Card Body -->
								<div class="card bg-success text-white" style="margin: 0.5rem;">
								<div class="card-body">정상 녹화 중</div>
								</div>
								<div class="card-body" style="margin-top: 0rem">
									실시간 녹화 시간
								</div>
								<div class="card-body" id="divClock3" style="margin-top: 0rem">
								</div>
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<a class="btn btn-info btn-icon-split" href="#">녹화</a>
									<a class="btn btn-warning btn-icon-split" href="#">정지</a>
								</div>
							</div>
						</div>
						</div>
				</c:if>
					<c:if test="<%=sDto.getO() < 0f%>">
				<jsp:include page="noData.jsp" />
			</c:if>
			</div>
		</div>
		<footer class="py-4 bg-light mt-auto">
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
	</div>
	<%@ include file="js_css.jsp"%>
	<script>
		function onT() {
			if (document.getElementById('T').value != ""){
				if(document.getElementById('T').value < 0 || document.getElementById('T').value> 100){
					alert("1 ~ 100 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?T="+ document.getElementById('T').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}		
		}
		function onH() {
			if (document.getElementById('H').value != ""){
				if(document.getElementById('H').value < 0 || document.getElementById('H').value > 100){
					alert("1 ~ 100 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?H="+ document.getElementById('H').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}	
		}
		function onG() {
			if (document.getElementById('G').value != ""){
				if(document.getElementById('G').value < 0 || document.getElementById('G').value > 100){
					alert("1 ~ 100 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?G="+ document.getElementById('G').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}	
		}
		function onS() {
			if (document.getElementById('S').value != ""){
				if(document.getElementById('S').value < 0 || document.getElementById('S').value > 100){
					alert("1 ~ 100 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?S="+ document.getElementById('S').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}	
		}
		function onC() {
			if (document.getElementById('C').value != ""){
				if(document.getElementById('C').value < 0 || document.getElementById('C').value > 100){
					alert("1 ~ 100 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?C="+ document.getElementById('C').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}	
		}
		function onAir() {
			if (document.getElementById('Air').value != ""){
				if(document.getElementById('Air').value < 0 || document.getElementById('Air').value > 500){
					alert("1 ~ 500 사이의 값을 입력해주세요.");
					return;
				}
				else{
					location.href = "sensorActionRe.do?Air="+ document.getElementById('Air').value;
				}
			}else{
				alert("값을 입력해주세요.");
			}	
		}
		function stopT() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?T";
				return true;
			} else {
				return false;
			}
		}
		function stopH() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?H";
				return true;
			} else {
				return false;
			}
		}
		function stopC() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?C";
				return true;
			} else {
				return false;
			}
		}
		function stopG() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?G";
				return true;
			} else {
				return false;
			}
		}
		function stopS() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?S";
				return true;
			} else {
				return false;
			}
		}
		function stopAir() {
			if (confirm("정지하시겠습니까?")) {
				location.href = "sensorActionStopAction.do?Air";
				return true;
			} else {
				return false;
			}
		}
	</script>
	<script>
		function showClock(){
			var date = new Date();
			var h = date.getHours();
			var msg = h + "시";
			msg += date.getMinutes() + "분";
			msg += date.getSeconds() + "초";
			
			document.getElementById("divClock").innerHTML = msg;
			document.getElementById("divClock2").innerHTML = msg;
			document.getElementById("divClock3").innerHTML = msg;
			setTimeout(showClock, 1000);
		}
	</script>
<script>
function autoRefresh_sample_div()
{
var currentLocation = window.location;
$("#load").fadeOut('fast').load(currentLocation + ' #load').fadeIn("fast");
}
var num = <%=senDto.getAuto()%>
if(num != 0){
	setInterval('autoRefresh_sample_div()', num); 
}
</script>
<script type="text/javascript">
function on(){
	location.href = "sensorActionAuto.do?Auto="+document.getElementById("sec").value;
}
</script>
</body>
</html>
