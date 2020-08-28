package com.youngpoong.controller;

import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.farm.farmDao;
import com.youngpoong.farm.farmDto;

public class farmChartAction3 implements Action {
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
		farmDao fDao = new farmDao();
		ArrayList<farmDto> list = fDao.getAvgTH_Week(userId);

		if(list != null) {
			request.setAttribute("list", list);
			forward.setNextPage("farmChart5.do");
			forward.setRedirect(false);
		} else {
			System.out.println("farmChartAction.error");
			forward.setRedirect(true);
			forward.setNextPage("farmInfo.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("차트");
			dDto.setMsg("주별 온습도 차트 데이터 조회");
			dDto.setIp(ipSet);
			dataDao dDao = new dataDao();
			dDao.insertData(dDto);
		}
		return forward;
	}
}
