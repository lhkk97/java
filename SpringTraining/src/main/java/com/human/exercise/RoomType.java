package com.human.exercise;

public class RoomType {
	private int typecode;
	private String typename;
	public RoomType(int typecode, String typename) {
		this.typecode = typecode;
		this.typename = typename;
	}
	public RoomType() {
	}
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
}
