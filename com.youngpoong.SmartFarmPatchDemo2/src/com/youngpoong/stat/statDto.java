package com.youngpoong.stat;

import java.sql.Timestamp;

public class statDto {
	private String type;
	private String id;
	private float o; //산소
	private float n; //질소
	private float c; //이산화탄소
	private float t; //온도
	private float h; //습도
	private float g; //토양
	private float s; //채광
	private int air;
	private Timestamp date;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public float getO() {
		return o;
	}
	public void setO(float o) {
		this.o = o;
	}
	public float getN() {
		return n;
	}
	public void setN(float n) {
		this.n = n;
	}
	public float getC() {
		return c;
	}
	public void setC(float c) {
		this.c = c;
	}
	public float getT() {
		return t;
	}
	public void setT(float t) {
		this.t = t;
	}
	public float getH() {
		return h;
	}
	public void setH(float h) {
		this.h = h;
	}
	public float getG() {
		return g;
	}
	public void setG(float g) {
		this.g = g;
	}
	public float getS() {
		return s;
	}
	public void setS(float s) {
		this.s = s;
	}
	public int getAir() {
		return air;
	}
	public void setAir(int air) {
		this.air = air;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
}
