package com.youngpoong.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.youngpoong.bbs.bbsDao;
import com.youngpoong.bbs.bbsDto;
import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;

public class bbsUpdateAction implements Action {
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
		bbsDto bDto = new bbsDto();
		
		int page = Integer.parseInt(request.getParameter("page"));
		String selecter = request.getParameter("options");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		bDto.setId(page);
		bDto.setUserID(userId);
		bDto.setSeleter(selecter);
		bDto.setTitle(title);
		bDto.setContent(content);
		int result = bDao.bbsUpdate(bDto);
		
		if (result != 0) {
			request.setAttribute("updateResult", 1);
			forward.setRedirect(false);
		} else {
			System.out.println("bbsWriteAction.error");
			request.setAttribute("updateResult", 0);
			forward.setRedirect(false);
		}
		forward.setNextPage("bbsAction.do");
		{
			dDto.setId(userId);
			dDto.setColumn("게시판");
			dDto.setMsg("게시판 글수정");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
	}
}
