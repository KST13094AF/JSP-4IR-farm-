package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;

public class logoutAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		InetAddress ip = InetAddress.getLocalHost();
		String ipSet = ip.getHostAddress();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		{
			dDto.setId(userId);
			dDto.setColumn("텍스트");
			dDto.setMsg("전체 일반 데이터 조회");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}

		session.invalidate();
		ActionForward forward = new ActionForward();
		forward.setNextPage("home.do");
		forward.setRedirect(true);

		return forward;
	}
}
