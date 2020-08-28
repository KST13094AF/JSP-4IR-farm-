package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.user.userDao;

public class pwUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		InetAddress ip = InetAddress.getLocalHost();
		String ipSet = ip.getHostAddress();
		HttpSession session = request.getSession();
		String userId = null;
		if(session.getAttribute("userId") != null)
			userId = session.getAttribute("userId").toString();

		if(userId == null) {
			forward.setNextPage("session.do");
			forward.setRedirect(true);
			return forward;
		}

		dataDao dDao = new dataDao();
		dataDto dDto = new dataDto();
		userDao uDao = new userDao();

		String pw = request.getParameter("pw");
		String pwC = uDao.getUserPw(userId);
		String pwN = request.getParameter("pwN");

		if (pw.equals(pwC)) {
			int result = uDao.updatePw(userId, pwN);
			if (result == 1) {
				request.setAttribute("updatePwResult", 1);
				forward.setRedirect(false);
				forward.setNextPage("home.do");
			} else {
				request.setAttribute("updatePwResult", -1);
				System.out.println("pwUpdateAction.error");
				return null;
			}
		} else {
			request.setAttribute("updatePwResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("pwUpdateForm.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("유저 PW");
			dDto.setMsg(userId + "유저 비밀번호 수정(main)");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
