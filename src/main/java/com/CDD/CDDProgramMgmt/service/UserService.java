package com.CDD.CDDProgramMgmt.service;

import java.util.List;

import com.CDD.CDDProgramMgmt.entity.TUser;

/**
 * @author Deechean
 * @Description
 * @project UserService Service Interface
 * @package com.CDD.CDDProgramMgmt.service
 * @date 2019/7/14
 */
public interface UserService {
	/*Find Users*/
	public List<TUser> findAllusers();
}
