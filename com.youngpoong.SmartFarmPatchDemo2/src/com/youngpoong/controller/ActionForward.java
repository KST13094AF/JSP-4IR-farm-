package com.youngpoong.controller;

// 페이지 이동 처리 클래스

public class ActionForward {
	private boolean isRedirect = false;
	private String nextPage = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getNextPage() {
		return nextPage;
	}
	
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	
}
