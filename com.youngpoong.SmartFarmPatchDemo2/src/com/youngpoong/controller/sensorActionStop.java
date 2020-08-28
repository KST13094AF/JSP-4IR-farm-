package com.youngpoong.controller;

import java.net.InetAddress;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.sensor.sensorDao;
import com.youngpoong.stat.statDao;

public class sensorActionStop implements Action {
	dataDto dDto = new dataDto();
	statDao sDao = new statDao();
	sensorDao senDao = new sensorDao();
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
		
		String column = "";
		
		Enumeration<String> re = request.getParameterNames();
		if(re.hasMoreElements()) {
			column = re.nextElement();
			System.out.println(column);
		}
		if(column.equals("") || column != null){
			senDao.setSensorStop(userId, column+"s");
			sDao.setGoal(userId, column, 0);
			forward.setNextPage("sensorAction.do");
			forward.setRedirect(false);
		}
		{
			dDto.setId(userId);
			dDto.setColumn(column);
			dDto.setMsg("시스템 제어판 "+column+" 관리장치 정지");
			dDto.setIp(ipSet);
			dataDao dDao = new dataDao();
			dDao.insertData(dDto);
		}
		return forward;
	}

}
