package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.user.userDao;

public class pwForgetUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		InetAddress ip = InetAddress.getLocalHost();
		String ipSet = ip.getHostAddress();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String userId = session.getAttribute("userId_none").toString();
		String pwN = request.getParameter("pwN");
		
		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		userDao uDao = new userDao();
		
		int result = uDao.updatePw(userId, pwN);
		
		if(result == 1) {
			session.removeAttribute("userId_none");
			request.setAttribute("pwForgetResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("login.do");
		}else {
			System.out.println("pwForgetUpdateAction.error");
			request.setAttribute("pwForgetResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("pwForgetUpdateForm.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("유저 PW");
			dDto.setMsg(userId + "비밀번호 수정(forget)");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
