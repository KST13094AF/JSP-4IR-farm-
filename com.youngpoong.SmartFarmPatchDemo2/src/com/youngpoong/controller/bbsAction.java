package com.youngpoong.controller;

import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.bbs.bbsDao;
import com.youngpoong.bbs.bbsDto;
import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;

public class bbsAction implements Action {
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
		bbsDao bDao = new bbsDao();
		ArrayList<bbsDto> list = bDao.getBbsList();
		

		if (list != null) {
			request.setAttribute("list", list);
			forward.setRedirect(false);
			forward.setNextPage("bbs.do");
		} else {
			System.out.println("bbsAction.error");
			forward.setRedirect(true);
			forward.setNextPage("home.do");
		}
		{
			dDto.setId(userId);
			dDto.setColumn("게시판 ");
			dDto.setMsg("게시판 조회");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
