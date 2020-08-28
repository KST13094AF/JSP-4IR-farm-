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

public class sensorActionAuto implements Action {
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
		
		int result = 0;
		String column = "";

		int num = Integer.parseInt(request.getParameter("Auto"));
		
		if(num == 0) {
			column = "auto";
			result = senDao.setSensorStop(userId, column+"s");	
		}else if(num == 2) {
			column = "InsertAuto";
			result = senDao.setSensorStat(userId, column+"s");	
		}else if(num == 4) {
			column = "InsertAuto";
			result = senDao.setSensorStop(userId, column+"s");	
		}else{
			column = "auto";
			result = senDao.setSensorStat(userId, column+"s", num);	
		} 
		
		if(result == 1) {
			forward.setNextPage("sensorAction.do");
			forward.setRedirect(false);
		}else {
			System.out.println("sensorActionRe.error");
			forward.setRedirect(false);
			forward.setNextPage("sensorAction.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn(column);
			dDto.setMsg("시스템 제어판 "+column+" 컬럼값 수정");
			dDto.setIp(ipSet);
			dataDao dDao = new dataDao();
			dDao.insertData(dDto);
		}
		return forward;
	}
}
