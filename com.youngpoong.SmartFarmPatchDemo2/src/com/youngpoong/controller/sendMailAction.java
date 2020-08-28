package com.youngpoong.controller;

import java.net.InetAddress;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.youngpoong.data.dataDao;
import com.youngpoong.data.dataDto;

public class sendMailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		InetAddress ip = InetAddress.getLocalHost();
		String ipSet = ip.getHostAddress();
		
		String sender = request.getParameter("email");
		String title = request.getParameter("id");
		String msg = request.getParameter("message");
		

		dataDto dDto = new dataDto();
		dataDao dDao = new dataDao();
		
		int result = mailSend(sender, title, msg);
		
		if(result == 1) {
			request.setAttribute("sendEmailResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("home.do");
		}else {
			request.setAttribute("sendEmailResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("emailAction.do");
		}
		{
			dDto.setId(title);
			dDto.setColumn("관리자 Email");
			dDto.setMsg(title + "유저 이메일 발송");
			dDto.setIp(ipSet);
			dDao.insertData(dDto);
		}
		return forward;
		
	}
	public int mailSend(String sender, String title, String message) {
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");
		
		Authenticator auth = new mailAuth();
		
		Session session = Session.getDefaultInstance(prop, auth);
		
		MimeMessage msg = new MimeMessage(session);
		
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(sender, "영풍산전에서 보내온 이메일 입니다."));
			InternetAddress to = new InternetAddress("newyour1964@gmail.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(title, "UTF-8");
			msg.setText(message,"UTF-8");
			
			Transport.send(msg);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
