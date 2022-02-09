package com.human.exercise;

public class Dept {
	private String dname;
	private int d_id;

	public Dept(String dname,int d_id) {
		this.dname = dname;
		this.d_id=d_id;
	}

	public Dept() {
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getD_id() {
		return d_id;
	}

	public void setDid(int d_id) {
		this.d_id = d_id;
	}
	
}
