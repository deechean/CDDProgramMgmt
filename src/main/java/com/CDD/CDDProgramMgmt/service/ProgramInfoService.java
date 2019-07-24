package com.CDD.CDDProgramMgmt.service;

import java.util.List;

import com.CDD.CDDProgramMgmt.entity.VwPrograminfo;
import com.CDD.CDDProgramMgmt.entity.VwWatchprogram;

/**
 * @author Deechean
 * @Description
 * @project ProgramInfo Service Interface
 * @package com.CDD.CDDProgramMgmt.service
 * @date 2019/7/14
 */
public interface ProgramInfoService {	
	/*Find Watch Program*/
	public List<VwWatchprogram> findWatchprogram(int userid);
	public List<VwWatchprogram> findByProgramowner(int programowner);
	/*Find Program Basic Information*/
	public List<VwPrograminfo> findByOwnername(String ownername);
	public List<VwPrograminfo> findByOwnerid(int ownerid);
	public List<VwPrograminfo> findByProgramname(String programname);
	public List<VwPrograminfo> findAllprogram();
}
