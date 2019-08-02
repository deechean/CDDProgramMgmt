package com.CDD.CDDProgramMgmt.entity;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class VwWatchprogram {
	
	@Id
	private int id;
	private int userid;
	private int programid;
	private String name;
	private int programowner;
	private String introdate;
	private String regularsubmitaldate;
	private String plcde;
	private String status;
	private String color;
	
	public VwWatchprogram(int id, int userid, int programid, String name, int programowner, String introdate, String regularsubmitaldate,
			String plcde, String status, String color) {
		this.id = id;
		this.userid = userid;
		this.programid = programid;
		this.name = name;
		this.programowner = programowner;
		this.introdate = introdate;
		this.regularsubmitaldate = regularsubmitaldate;
		this.plcde = plcde;
		this.status = status;
		this.color = color;
	}
	
	public VwWatchprogram() {
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getuserId() {
		return userid;
	}

	public void setuserId(int userid) {
		this.userid = userid;
	}
		
	public int getprogramId() {
		return programid;
	}

	public void setprogramId(int programid) {
		this.programid = programid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getProgramowner() {
		return programowner;
	}

	public void setProgramowner(int programowner) {
		this.programowner = programowner;
	}

	public String getIntrodate() {
		return introdate;
	}

	public void setIntrodate(String introdate) {
		this.introdate = introdate;
	}

	public String getRegularsubmitaldate() {
		return regularsubmitaldate;
	}

	public void setRegularsubmitaldate(String regularsubmitalsdate) {
		this.regularsubmitaldate = regularsubmitalsdate;
	}

	public String getPlcde() {
		return plcde;
	}

	public void setPlcde(String plcde) {
		this.plcde = plcde;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
}
