package com.CDD.CDDProgramMgmt.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class VwWatchprogram {
	
	@Id
	private int id;
	private int userid;
	private int programid;
	private String programname;
	private int programowner;
	private Date introdate;
	private Date regularsubmitaldate;
	private String plcde;
	private Character status;
	
	public VwWatchprogram(int id, int userid, int programid, String programname, int programowner, Date introdate, Date regularsubmitaldate,
			String plcde, Character status) {
		this.id = id;
		this.userid = userid;
		this.programid = programid;
		this.programname = programname;
		this.programowner = programowner;
		this.introdate = introdate;
		this.regularsubmitaldate = regularsubmitaldate;
		this.plcde = plcde;
		this.status = status;
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

	public String getProgramname() {
		return programname;
	}

	public void setProgramname(String programname) {
		this.programname = programname;
	}

	public int getProgramowner() {
		return programowner;
	}

	public void setProgramowner(int programowner) {
		this.programowner = programowner;
	}

	public Date getIntrodate() {
		return introdate;
	}

	public void setIntrodate(Date introdate) {
		this.introdate = introdate;
	}

	public Date getRegularsubmitaldate() {
		return regularsubmitaldate;
	}

	public void setRegularsubmitaldate(Date regularsubmitalsdate) {
		this.regularsubmitaldate = regularsubmitalsdate;
	}

	public String getPlcde() {
		return plcde;
	}

	public void setPlcde(String plcde) {
		this.plcde = plcde;
	}

	public Character getStatus() {
		return status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}
}
