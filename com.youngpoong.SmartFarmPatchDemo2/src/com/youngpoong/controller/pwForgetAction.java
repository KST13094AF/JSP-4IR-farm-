package com.youngpoong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.user.userDao;

public class pwForgetAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("id");
		String email = request.getParameter("email");
		
		userDao uDao = new userDao();
		
		int result = uDao.getUserInfo(userId, email);
		
		if(result == 1) {
			session.setAttribute("userId_none", userId);
			forward.setRedirect(false);
			forward.setNextPage("pwForgetUpdateForm.do");
		}else if(result == 0) {
			request.setAttribute("pwForgetResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("pwForgetForm.do");
		} else {
			request.setAttribute("pwForgetResult", -1);
			forward.setRedirect(false);
			forward.setNextPage("pwForgetForm.do");
		}
		
		return forward;
	}
}
