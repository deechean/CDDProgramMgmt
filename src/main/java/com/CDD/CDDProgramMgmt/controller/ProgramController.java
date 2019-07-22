package com.CDD.CDDProgramMgmt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.CDD.CDDProgramMgmt.entity.VwPrograminfo;
import com.CDD.CDDProgramMgmt.entity.VwWatchprogram;
import com.CDD.CDDProgramMgmt.service.ProgramInfoService;

/**
 * @author Deechean
 * @Description
 * @project Program Controller
 * @package com.CDD.CDDProgramMgmt.entity
 * @date 2019/7/14
 */
@RestController
@CrossOrigin(origins = "*") 
@RequestMapping("/program")
public class ProgramController {

	@Autowired
	private ProgramInfoService programService;
	
	@RequestMapping("/findwatchprogram")
	public List<VwWatchprogram> getProgramInfoById(int userid) {
		List<VwWatchprogram> programs = programService.findWatchprogram(userid);
		return programs;
	}
	
	@RequestMapping("/findbyownerid")
	public List<VwPrograminfo> findByOwnerid(int ownerid) {
		List<VwPrograminfo> programs = programService.findByOwnerid(ownerid);
		return programs;
	}
	
	@RequestMapping("/findbyownername")
	public List<VwPrograminfo> findByOwnername(String ownername) {
		List<VwPrograminfo> programs = programService.findByOwnername(ownername);
		return programs;
	}
	
	@RequestMapping("/findbyprogramname")
	public List<VwPrograminfo> findByProgramname(String programname) {
		List<VwPrograminfo> programs = programService.findByProgramname(programname);
		return programs;
	}
}
