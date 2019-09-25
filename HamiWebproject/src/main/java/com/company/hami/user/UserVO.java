package com.company.hami.user;

public class UserVO {
	//멤버변수 선언
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String address;
	private int rank;
	
	//setter,getter 메소드 구현
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	//toString()
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", email=" + email + ", address="
				+ address + ", rank=" + rank + "]";
	}

}
