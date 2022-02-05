package com.human.cafe;

public class Cafe_sales {
	private String mobile;
	private String name;
	private int qty;
	private int total;
	private String sold_time;
	public Cafe_sales(String mobile, String name, int qty, int total, String sold_time) {
		this.mobile = mobile;
		this.name = name;
		this.qty = qty;
		this.total = total;
		this.sold_time = sold_time;
	}
	public Cafe_sales() {}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getSold_time() {
		return sold_time;
	}
	public void setSold_time(String sold_time) {
		this.sold_time = sold_time;
	}
}
