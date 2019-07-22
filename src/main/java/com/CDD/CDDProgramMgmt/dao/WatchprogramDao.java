package com.CDD.CDDProgramMgmt.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.CDD.CDDProgramMgmt.entity.VwWatchprogram;

/**
 * @author Deechean
 * @Description
 * @project vw_watchprogramDao JPA DAO Interface
 * @package com.CDD.CDDProgramMgmt.dao
 * @date 2019/7/20
 */
public interface WatchprogramDao extends JpaRepository<VwWatchprogram, Integer>  {
	public List<VwWatchprogram> findByUserid(int userid);
	public List<VwWatchprogram> findByProgramowner(int programowner);
}
