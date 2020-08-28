package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.user.userDao;
import com.youngpoong.user.userDto;

public class infoUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		userDao uDao = new userDao();
		userDto uDto = new userDto();
		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		
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
		String name = request.getParameter("name");
		String farm = request.getParameter("farm");
		String email = request.getParameter("email");
		
		uDto.setId(userId);
		uDto.setName(name);
		uDto.setFarm(farm);
		uDto.setEmail(email);
		
		int result = uDao.updateUser(uDto);
		
		if(result == 1) {
			request.setAttribute("userInfo", uDto);
			request.setAttribute("updateResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("home.do");
		}else {
			request.setAttribute("updateResult", 0);
			System.out.println("infoUpdateAction.error");
			return null;
		}
		{
			dDto.setId(userId);
			dDto.setColumn("유저정보");
			dDto.setMsg(userId+"유저 정보 수정");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
