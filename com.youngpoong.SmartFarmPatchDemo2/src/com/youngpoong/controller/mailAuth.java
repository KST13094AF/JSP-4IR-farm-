package com.youngpoong.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class mailAuth extends Authenticator {
	PasswordAuthentication pa;
	
	public mailAuth() {
		String mail_id = "newyour1964@gmail.com";
		String mail_pw = "1423dbrlgusapf!";
		
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
