package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.farm.farmDao;
import com.youngpoong.sensor.sensorDao;
import com.youngpoong.stat.statDao;
import com.youngpoong.user.userDao;

public class infoDeleteAction implements Action {
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
		
		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		userDao uDao = new userDao();
		statDao sDao = new statDao();
		sensorDao senDao = new sensorDao();
		farmDao fDao = new farmDao();
	
		int result = uDao.deleteUser(userId);
		
		if(result == 1) {
			sDao.deleteStat(userId);
			senDao.deleteSensor(userId);
			fDao.deleteData(userId);
			dDao.deleteData(userId);
			session.invalidate();
			forward.setRedirect(true);
			forward.setNextPage("home.do");
		}else {
			System.out.println("InfoDeleteAction.error");
			return null;
		}
		{
			dDto.setId(userId);
			dDto.setColumn("유저정보");
			dDto.setMsg(userId + "유저 아이디 삭제");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}

}
