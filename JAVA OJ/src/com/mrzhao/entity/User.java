package com.mrzhao.entity;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String account;
	private String passwd;
	private String phone;
	private String email;
	private Integer ranks;//排名 默认为0
	private Integer nlevel;//等级 默认为0
	private String name;
	private String isAdmin;//0-不是，1-是
	public User(){
		
	}
	public User(String account,String passwd){
		this.account=account;
		this.passwd=passwd;
	}
	public User(String account, String passwd, String phone, String email,
			Integer ranks, Integer nlevel, String name, String isAdmin) {
		super();
		this.account = account;
		this.passwd = passwd;
		this.phone = phone;
		this.email = email;
		this.ranks = ranks;
		this.nlevel = nlevel;
		this.name = name;
		this.isAdmin = isAdmin;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getRanks() {
		return ranks;
	}
	public void setRanks(Integer ranks) {
		this.ranks = ranks;
	}
	public Integer getNlevel() {
		return nlevel;
	}
	public void setNlevel(Integer nlevel) {
		this.nlevel = nlevel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "User [account=" + account + ", passwd=" + passwd + ", phone="
				+ phone + ", email=" + email + ", ranks=" + ranks + ", nlevel="
				+ nlevel + ", name=" + name + ", isAdmin=" + isAdmin + "]";
	}
}

