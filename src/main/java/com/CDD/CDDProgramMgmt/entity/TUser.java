package com.CDD.CDDProgramMgmt.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_user", schema = "cdd")
public class TUser {
	@Id
	private int id;
	private String name;
	private String phone;
	private String email;
	private Character status;

	
	public TUser(int id, String name,String phone,String email,Character status) {
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.status = status;
	}
	
	public TUser() {
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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
	
	public Character getStatus() {
		return status;
	}
	
	public void setStatus(Character status) {
		this.status = status;
	}
	
}
