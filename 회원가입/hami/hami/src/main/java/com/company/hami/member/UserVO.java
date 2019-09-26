package com.company.hami.member;

public class UserVO {
	private String id;
	private String passwd;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", passwd=" + passwd + ", email=" + email + ", zipcode=" + zipcode + ", address1="
				+ address1 + ", address2=" + address2 + "]";
	}
	
	
}
