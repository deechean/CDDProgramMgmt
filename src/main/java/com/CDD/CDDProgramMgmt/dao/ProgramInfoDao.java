package com.CDD.CDDProgramMgmt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CDD.CDDProgramMgmt.entity.VwPrograminfo;

/**
 * @author Deechean
 * @Description
 * @project t_programinfo JPA DAO Interface
 * @package com.CDD.CDDProgramMgmt.dao
 * @date 2019/7/14
 */
public interface ProgramInfoDao extends JpaRepository<VwPrograminfo, Integer> {
	public List<VwPrograminfo> findByOwnername(String ownername);
	public List<VwPrograminfo> findByOwnerid(int ownerid);
	public List<VwPrograminfo> findByProgramname(String programname);
}
