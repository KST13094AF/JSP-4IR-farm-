package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.sensor.sensorDao;
import com.youngpoong.sensor.sensorDto;
import com.youngpoong.stat.statDao;
import com.youngpoong.stat.statDto;

public class sensorAction implements Action {
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
		statDao sDao = new statDao();
		sensorDao senDao = new sensorDao();
		
		statDto sDto = sDao.getGoal(userId);
		statDto sDto2 = sDao.getStat(userId);
		sensorDto senDto = senDao.getSensorStat(userId);
		
		if (sDto != null) {
			request.setAttribute("goal", sDto);
			request.setAttribute("stat", sDto2);
			request.setAttribute("sensor", senDto);
			forward.setRedirect(false);
			forward.setNextPage("sensor.do");
		} else {
			System.out.println("farmChartAction.error");
			forward.setRedirect(true);
			forward.setNextPage("home.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("시스템");
			dDto.setMsg("농장 시스템 제어판 접근");
			dDto.setIp(ipSet);
			dataDao dDao = new dataDao();
			dDao.insertData(dDto);
		}
		return forward;
	}
}
