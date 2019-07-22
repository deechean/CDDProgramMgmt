package com.CDD.CDDProgramMgmt.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Deechean
 * @Description
 * @project t_programinfo POJO Class
 * @package com.CDD.CDDProgramMgmt.entity
 * @date 2019/7/14
 */
@Entity
@Table(name = "t_programinfo")
public class TProgramInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String programname;
	private int programowner;
	private Date introdate;
	private Date regularsubmitaldate;
	private int plcde;
	private Character status;

	public TProgramInfo(int id, String programname, int programowner, Date introdate, Date regularsubmitaldate,
			int plcde, Character status) {
		this.id = id;
		this.programname = programname;
		this.programowner = programowner;
		this.introdate = introdate;
		this.regularsubmitaldate = regularsubmitaldate;
		this.plcde = plcde;
		this.status = status;
	}

	public TProgramInfo() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getPlcde() {
		return plcde;
	}

	public void setPlcde(int plcde) {
		this.plcde = plcde;
	}

	public Character getStatus() {
		return status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}
}
