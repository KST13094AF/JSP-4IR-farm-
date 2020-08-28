package com.youngpoong.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;
import com.youngpoong.farm.farmDao;
import com.youngpoong.farm.farmDto;

public class myInfoAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String userId = null;
		if(session.getAttribute("userId") != null)
			userId = session.getAttribute("userId").toString();

		if(userId == null) {
			forward.setNextPage("session.do");
			forward.setRedirect(true);
			return forward;
		}
		
		dataDao dDao = new dataDao();
		ArrayList<dataDto> list3 = dDao.getData(userId);
		
		farmDao fDao = new farmDao();
		ArrayList<farmDto> list = fDao.getRecode(userId);		//단일
		
		if(list != null && list3 != null) {
			request.setAttribute("datalist", list);
			request.setAttribute("dataInfo", list3);
			forward.setNextPage("info.do");
			forward.setRedirect(false);
		}else {
			System.out.println("myInfoAction.error");
		}
		return forward;
	}
}
