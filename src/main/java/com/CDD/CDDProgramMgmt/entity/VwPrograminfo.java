package com.CDD.CDDProgramMgmt.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class VwPrograminfo {
	@Id
	private int id;
	private int ownerid;
	private String programname;
	private String ownername;
	private Date introdate;
	private Date regularsubmitaldate;
	private int plid;
	private String plcde;
	private Character status;
	
	public VwPrograminfo(int id, int ownerid, String programname, String ownername, Date introdate, Date regularsubmitaldate,
			String plcde, Character status) {
		this.id = id;
		this.ownerid = ownerid;
		this.programname = programname;
		this.ownername = ownername;
		this.introdate = introdate;
		this.regularsubmitaldate = regularsubmitaldate;
		this.plcde = plcde;
		this.status = status;
	}
	
	public VwPrograminfo() {
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getOwnerid() {
		return ownerid;
	}
	
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
		
	public String getProgramname() {
		return programname;
	}

	public void setProgramname(String programname) {
		this.programname = programname;
	}
	
	public String getProgramowner() {
		return ownername;
	}

	public void setProgramowner(String ownername) {
		this.ownername = ownername;
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
	
	public int getPlid() {
		return plid;
	}
	
	public void setPlid(int plid) {
		this.plid = plid;
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
