package com.youngpoong.controller;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.farm.farmDao;
import com.youngpoong.farm.farmDto;

public class farmNormalDataAction_date implements Action {
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
		farmDao fDao = new farmDao();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateT = sdf.format(date);
		
		if(request.getParameter("date") != null)
			dateT = request.getParameter("date");
		
		ArrayList<farmDto> list = fDao.getFarmInfo_Date(userId, dateT);

		if (list != null) {
			request.setAttribute("date", dateT);
			request.setAttribute("list", list);
			request.setAttribute("status", 2);
			forward.setRedirect(false);
			forward.setNextPage("farmNormal_Date.do");
		} else {
			System.out.println("farmNormalDataAcion_date.error");
			forward.setRedirect(true);
			forward.setNextPage("farmInfo.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("전체 데이터");
			dDto.setMsg(dateT+"(날짜) 텍스트 데이터 조회");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
