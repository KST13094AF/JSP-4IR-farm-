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

public class sensorActionRe implements Action {
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
		float goal = 0, result = 0, cmp = 0;

		Enumeration<String> re = request.getParameterNames();
		if(re.hasMoreElements()) {
			column = re.nextElement();
			goal = Float.parseFloat(request.getParameter(column))*10;
		}
		
		if(column.equals("C")) {
			cmp = -compareElement(userId, column, goal);
		} else {
			cmp = compareElement(userId, column, goal);
		}
		
		if(cmp != 1) {
			request.setAttribute("statSet", 0);
			senDao.setSensorStop(userId, column+"s");
		}else {
			senDao.setSensorStat(userId, column+"s");	
		}
		result = sDao.setGoal(userId, column , goal);		
		
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
	
	public int compareElement(String id,String column, float goal) {
		float elem1 = goal;
		float elem2 = sDao.getElementStat(id, column);
		if(elem1 < elem2)
			return -1;
		else
			return 1;
	}
}
