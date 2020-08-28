package com.youngpoong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.youngpoong.sensor.sensorDao;
import com.youngpoong.stat.statDao;
import com.youngpoong.user.userDao;
import com.youngpoong.user.userDto;

public class joinAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		userDao uDao = new userDao();
		userDto uDto = new userDto();
		statDao sDao = new statDao();
		sensorDao senDao = new sensorDao();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String farm = request.getParameter("farm");
		String email = request.getParameter("email");
		
		uDto.setName(name);
		uDto.setId(id);
		uDto.setPw(pw);
		uDto.setFarm(farm);
		uDto.setEmail(email);
		
		int result = uDao.join(uDto);
		
		if(result == 1) {
			forward.setRedirect(true);
			forward.setNextPage("login.do");
			sDao.init(id);
			senDao.init(id);
		}else {
			forward.setRedirect(false);
			forward.setNextPage("join.do");
		}
		request.setAttribute("joinResult", 0);
		return forward;
	}
}
