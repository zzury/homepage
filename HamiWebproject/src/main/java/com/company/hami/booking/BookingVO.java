package com.company.hami.booking;

public class BookingVO {
	private int res_num;
	private String res_date;
	private int res_time;
	private int prepayment;
	private String id;
	private String d_name;
	private int d_weight;
	private String demend;
	
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}	
	public int getRes_time() {
		return res_time;
	}
	public void setRes_time(int res_time) {
		this.res_time = res_time;
	}
	public int getPrepayment() {
		return prepayment;
	}
	public void setPrepayment(int prepayment) {
		this.prepayment = prepayment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public int getD_weight() {
		return d_weight;
	}
	public void setD_weight(int d_weight) {
		this.d_weight = d_weight;
	}	
	public String getDemend() {
		return demend;
	}
	public void setDemend(String demend) {
		this.demend = demend;
	}
	@Override
	public String toString() {
		return "BookingVO [res_num=" + res_num + ", res_date=" + res_date + ", res_time=" + res_time + ", prepayment="
				+ prepayment + ", id=" + id + ", d_name=" + d_name + ", d_weight=" + d_weight + ", demend=" + demend
				+ "]";
	}
	
	

}
