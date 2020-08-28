package com.youngpoong.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet  {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		String requestUri = req.getRequestURI();
		int cmdLast = requestUri.lastIndexOf("/");
		String uri = requestUri.substring(cmdLast);
		String firstUri = "/com.youngpoong.view/";
		ActionForward forward = null;
		Action action = null;
		
		try {
			// -------------------------------------------------------------이동 처리 -------------------------------------------------------
			if(uri.equals("/home.do")) {						// ----- 인덱스 home 호출 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"index.jsp");
			}
			
			else if(uri.equals("/join.do")) {					// ----- 회원가입 join 호출 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"join.jsp");
			}
			
			else if(uri.equals("/login.do")) {					// ----- 로그인 login 호출 사용중-----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"login.jsp");
			
			}
			
			else if(uri.equals("/email.do")) {					// ----- 이메일 사용  -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"email.jsp");
			}
			
			else if(uri.equals("/info.do")) {					// ----- info 내 정보 드롭박스 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"info.jsp");	
			}
			
			else if(uri.equals("/infoUpdate.do")) {				// ----- info 수정 sidebar에서 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"infoUpdate.jsp");	
			}
			
			else if(uri.equals("/myInfo.do")) {					// ----- 미사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"infoUpdate.jsp");	
			}
			
			else if(uri.equals("/infoUpdateForm.do")) {			// -----  info 수정 폼 infoUpdate에서 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"infoUpdateForm.jsp");	
			}
			
			else if(uri.equals("/pwUpdateForm.do")) {			// ----- pw 수정 폼 sidebar에서 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"pwUpdate.jsp");	
			}
			
			else if(uri.equals("/pwForgetForm.do")) {			// ----- pw 잊엇을때 login 에서 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"pwForget.jsp");	
			}
			
			else if(uri.equals("/pwForgetUpdateForm.do")) {		// ----- pw 잊엇을때 수정 폼 pwForget에서 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"pwForgetUpdate.jsp");	
			}
			
			else if(uri.equals("/farmInfo.do")) {				// ----- 미사용 ----
				forward = new ActionForward();		
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farm.jsp");	
			}
			
			else if(uri.equals("/farmNormal.do")) {				// ----- 노말ㄷ ㅔ이터  sidebar 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmNormalData.jsp");	
			}
			
			else if(uri.equals("/farmNormal_Now.do")) {			// ----- 오늘 노말 데이터 sidebar 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmNormalData_Now.jsp");	
			}
			
			else if(uri.equals("/farmNormal_Date.do")) {		// ----- 날짜 노말 데이터 sidebar 사용중 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmNormalData_Date.jsp");	
			}
			
			else if(uri.equals("/farmChart.do")) {				// ----- 차트 현재 대기상태 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData.jsp");	
			}
			
			else if(uri.equals("/farmChart2.do")) {				// ----- 차트 현재 온습도 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData2.jsp");	
			}
			
			else if(uri.equals("/farmChart3.do")) {				// ----- 차트 현재 토양 채광 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData3.jsp");	
			}
			
			else if(uri.equals("/farmChart4.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData4.jsp");	
			}
			
			else if(uri.equals("/farmChart5.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData5.jsp");	
			}
			
			else if(uri.equals("/farmChart6.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"farmChartData6.jsp");	
			}
			
			else if(uri.equals("/sensor.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"sensor.jsp");	
			}
			
			else if(uri.equals("/session.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"sessionInve.jsp");	
			}
			
			else if(uri.equals("/bbs.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"bbs.jsp");	
			}
			
			else if(uri.equals("/bbsWrite.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"bbsWrite.jsp");	
			}
			
			else if(uri.equals("/bbsRead.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"bbsRead.jsp");	
			}
			
			else if(uri.equals("/bbsUpdate.do")) {				// ----- 차트 평균 대기 상태 데이터 sidebar 사용 -----
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(firstUri+"bbsUpdate.jsp");	
			}
			// ------------------------------------------------------------- 데이터 처리 ━ -------------------------------------------------------
			else if(uri.equals("/joinAction.do")) {				// ----- 회원가입에서 사용  -----
				action = new joinAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/loginAction.do")) {			// ----- 로그인에서 사용  -----
				action = new loginAction();
				forward = action.execute(req, resp);
			}
					
			else if(uri.equals("/logoutAction.do")) {			// ----- 로그아웃 사용  -----
				action = new logoutAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/myInfoAction.do")) {			// ----- 사용자 navbar 정보 -----
				action = new myInfoAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/infoAction.do")) {				// ----- 사용자 sidebar 정보 인포  -----
				action = new infoAction();	
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/infoDeleteAction.do")) {		// ----- 유저 삭제 사용중  -----
				action = new infoDeleteAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/infoUpdateFormAction.do")) {	// ----- 정보 수정하는 정보 가져옴 infoUpdate 사용중 -----
				action = new infoAction();
				forward = action.execute(req, resp);
				forward.setNextPage("/infoUpdateForm.do");
			}
			
			else if(uri.equals("/infoUpdateAction.do")) {		// ----- 사용자 정보 업데이트 infoUpdateForm 사용 중  -----
				action = new infoUpdateAction();
				forward = action.execute(req, resp);
			}
				
			else if(uri.equals("/pwUpdateAction.do")) {			// ----- pw 재 설정 업데이트 pwUpdate 사용중  -----
				action = new pwUpdateAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/pwForgetAction.do")) {			// ----- 비밀번호 잊엇을때 아이디 검색 pwForget 사용중  -----
				action = new pwForgetAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/pwForgetUpdateAction.do")) {	// ----- 비밀번호 수정 update pw   -----
				action = new pwForgetUpdateAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/emailAction.do")) {			// ----- 메일 폼 정보 가져오기 사용 중   -----
				action = new emailAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/sendMailAction.do")) {			// ----- 메일 보내는 것 사용 중 -----
				action = new sendMailAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmNormalAction.do")) {		// ----- 노말 데이터 사용   -----
				action = new farmNormalDataAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmChartAction.do")) {		// ----- 차트 엑션 사용    -----
				action = new farmChartAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmChartAction2.do")) {		// ----- 차트2 엑션 사용    -----
				action = new farmChartAction2();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmChartAction3.do")) {		// ----- 차트2 엑션 사용    -----
				action = new farmChartAction3();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmChartAction4.do")) {		// ----- 차트2 엑션 사용    -----
				action = new farmChartAction4();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmNormalActionNow.do")) {	// ----- 노말데이터 나우   -----
				action = new farmNormalDataAction_now();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/farmNormalActionDate.do")) {	// ----- 사용  -----
				action = new farmNormalDataAction_date();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/sensorAction.do")) {	// ----- 사용  -----
				action = new sensorAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/sensorActionRe.do")) {	// ----- 사용  -----
				action = new sensorActionRe();
				forward = action.execute(req, resp);
			}
				
			else if(uri.equals("/sensorActionAuto.do")) {	// ----- 사용  -----
				action = new sensorActionAuto();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/sensorActionStopAction.do")) {	// ----- 사용  -----
				action = new sensorActionStop();
				forward = action.execute(req, resp);
			}

			else if(uri.equals("/bbsAction.do")) {	// ----- 사용  -----
				action = new bbsAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/bbsWriteAction.do")) {	// ----- 사용  -----
				action = new bbsWriteAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/bbsReadAction.do")) {	// ----- 사용  -----
				action = new bbsRead();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/bbsUpdateFromAction.do")) {	// ----- 사용  -----
				action = new bbsUpdate();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/bbsUpdateAction.do")) {	// ----- 사용  -----
				action = new bbsUpdateAction();
				forward = action.execute(req, resp);
			}
			
			else if(uri.equals("/bbsDeleteAction.do")) {	// ----- 사용  -----
				action = new bbsDelete();
				forward = action.execute(req, resp);
			}
			//------------------------------------------------- 포워드 ------------------------------------
			
			if(forward != null) {
				if(forward.isRedirect()) {
					resp.sendRedirect(forward.getNextPage());
				}else {
					RequestDispatcher rd = req.getRequestDispatcher(forward.getNextPage());
					rd.forward(req, resp);
				}
			}else {
				System.out.println("데이터 오류");
			}
		}catch(Exception e) {
			
		}
	}
}
