package com.CDD.CDDProgramMgmt.entity;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class VwPrograminfo {
	@Id
	private int id;
	private int ownerid;
	private String programname;
	private String ownername;
	private String introdate;
	private String regularsubmitaldate;
	private int plid;
	private String plcde;
	private String status;
	private String color;
	
	public VwPrograminfo(int id, int ownerid, String programname, String ownername, String introdate, String regularsubmitaldate,
			String plcde, String status, String color) {
		this.id = id;
		this.ownerid = ownerid;
		this.programname = programname;
		this.ownername = ownername;
		this.introdate = introdate;
		this.regularsubmitaldate = regularsubmitaldate;
		this.plcde = plcde;
		this.status = status;
		this.color = color;
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
