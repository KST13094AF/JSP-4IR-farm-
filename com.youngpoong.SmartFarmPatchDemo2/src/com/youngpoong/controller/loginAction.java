package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.user.userDao;

public class loginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		InetAddress ip = InetAddress.getLocalHost();
		String ipSet = ip.getHostAddress();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		userDao uDao = new userDao();

		int result = uDao.login(id, pw);

		if (result == 1) {
			session.setAttribute("userId", id);
			forward.setRedirect(true);
			forward.setNextPage("home.do");
			{
				dDto.setId(id);
				dDto.setColumn("유저정보");
				dDto.setMsg("로그인");
				dDto.setIp(ipSet);
				dDao.insertData(dDto);
			}
		} else if (result == 0) {
			request.setAttribute("loginFail", 0);
			forward.setRedirect(false);
			forward.setNextPage("login.do");
		} else if (result == -1) {
			request.setAttribute("loginFail", -1);
			forward.setRedirect(false);
			forward.setNextPage("login.do");
		}

		return forward;
	}
}
