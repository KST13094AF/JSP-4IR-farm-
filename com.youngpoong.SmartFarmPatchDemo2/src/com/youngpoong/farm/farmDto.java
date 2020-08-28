package com.youngpoong.farm;

import java.sql.Timestamp;

public class farmDto {
	private int num;
	private String id;
	private int O;
	private int N;
	private int C;
	private int T;
	private int H;
	private int G;
	private int S;
	private Timestamp data;
	private int timeNum;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getO() {
		return O;
	}
	public void setO(int o) {
		O = o;
	}
	public int getN() {
		return N;
	}
	public void setN(int n) {
		N = n;
	}
	public int getC() {
		return C;
	}
	public void setC(int c) {
		C = c;
	}
	public int getT() {
		return T;
	}
	public void setT(int t) {
		T = t;
	}
	public int getH() {
		return H;
	}
	public void setH(int h) {
		H = h;
	}
	public int getG() {
		return G;
	}
	public void setG(int g) {
		G = g;
	}
	public int getS() {
		return S;
	}
	public void setS(int s) {
		S = s;
	}
	public Timestamp getData() {
		return data;
	}
	public void setData(Timestamp data) {
		this.data = data;
	}
	public int getTimeNum() {
		return timeNum;
	}
	public void setTimeNum(int timeNum) {
		this.timeNum = timeNum;
	}
}
