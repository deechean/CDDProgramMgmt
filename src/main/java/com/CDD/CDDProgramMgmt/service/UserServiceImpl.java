package com.CDD.CDDProgramMgmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CDD.CDDProgramMgmt.dao.UserDao;
import com.CDD.CDDProgramMgmt.entity.TUser;

/**
 * @author Deechean
 * @Description
 * @project User Service Interface
 * @package com.CDD.CDDProgramMgmt.service
 * @date 2019/7/14
 */
@Service("UserService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userdao;
	
	public List<TUser> findAllusers(){
		 List<TUser> users = userdao.findAll();
		 return users;
	}
}
