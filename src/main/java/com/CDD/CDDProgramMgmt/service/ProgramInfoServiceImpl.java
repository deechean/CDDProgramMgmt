package com.CDD.CDDProgramMgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CDD.CDDProgramMgmt.dao.ProgramInfoDao;
import com.CDD.CDDProgramMgmt.dao.WatchprogramDao;
import com.CDD.CDDProgramMgmt.entity.VwPrograminfo;
import com.CDD.CDDProgramMgmt.entity.VwWatchprogram;

/**
 * @author Deechean
 * @Description
 * @project ProgramInfoService Interface Implements
 * @package com.CDD.CDDProgramMgmt.service
 * @date 2019/7/14
 */
@Service("ProgramInfoService")
public class ProgramInfoServiceImpl implements ProgramInfoService {

	@Autowired
	private WatchprogramDao watchprogramdao;
	@Autowired
	private ProgramInfoDao programinfodao;
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findWatchprogram(int)
	 */
	@Override
	public List<VwWatchprogram> findWatchprogram(int userid) {
		List<VwWatchprogram> programs = watchprogramdao.findByUserid(userid);
		return programs;
	}
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findByProgramowner(int)
	 */
	@Override
	public List<VwWatchprogram> findByProgramowner(int programowner) {
		List<VwWatchprogram> programs = watchprogramdao.findByProgramowner(programowner);
		return programs;
	}
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findByOwnername(String)
	 */
	@Override
	public List<VwPrograminfo> findByOwnername(String ownername) {
		List<VwPrograminfo> programs = programinfodao.findByOwnername(ownername);
		return programs;
	}
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findByOwnerid(int)
	 */
	@Override
	public List<VwPrograminfo> findByOwnerid(int ownerid) {
		List<VwPrograminfo> programs = programinfodao.findByOwnerid(ownerid);
		return programs;
	}
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findByProgramname(String)
	 */
	@Override
	public List<VwPrograminfo> findByProgramname(String programname) {
		List<VwPrograminfo> programs = programinfodao.findByProgramname(programname);
		return programs;
	}
	
	/* (non-Javadoc)
	 * @see com.CDD.CDDProgramMgmt.service.ProgramInfoService#findAllprogram()
	 */
	@Override
	public List<VwPrograminfo> findAllprogram(){
		List<VwPrograminfo> programs = programinfodao.findAll();
		return programs;
	}

}
