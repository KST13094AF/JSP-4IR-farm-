package com.youngpoong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.user.userDao;
import com.youngpoong.user.userDto;

public class emailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String userId = null;
		if(session.getAttribute("userId") != null)
			userId = session.getAttribute("userId").toString();

		if(userId == null) {
			forward.setNextPage("session.do");
			forward.setRedirect(true);
			return forward;
		}
		
		userDao uDao = new userDao();
		userDto uDto = uDao.getEmaliInfo(userId);
		
		if(uDto != null) {
			request.setAttribute("emailInfo", uDto);
			forward.setNextPage("email.do");
			forward.setRedirect(false);
		}else {
			System.out.println("InfoAction.error");
			return null;
		}
		return forward;
	}
}
