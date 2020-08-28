package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.stat.statDao;
import com.youngpoong.stat.statDto;

public class farmChartAction implements Action {
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
		statDto sDto = sDao.getStat(userId);

		int number = 0;

		if (request.getParameter("number") != null) {
			number = Integer.parseInt(request.getParameter("number"));
		}

		if (sDto != null) {
			if (number == 2) {
				forward.setNextPage("farmChart2.do");
				dDto.setMsg("현재 온습도 차트 데이터 조회");
			}else if (number == 3) {
				forward.setNextPage("farmChart3.do");
				dDto.setMsg("현재 토양 채광 차트 데이터 조회");
			} else {
				forward.setNextPage("farmChart.do");
				dDto.setMsg("현재 대기구성비 차트 데이터 조회");
			}
			request.setAttribute("list", sDto);
			forward.setRedirect(false);
		} else {
			System.out.println("farmChartAction.error");
			forward.setRedirect(true);
			forward.setNextPage("farmInfo.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("차트");
			dDto.setIp(ipSet);
			dataDao dDao = new dataDao();
			dDao.insertData(dDto);
		}
		return forward;
	}
}
