package com.CDD.CDDProgramMgmt.controller;

import java.util.Optional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.CDD.CDDProgramMgmt.dao.ProgramInfoDao;
import com.CDD.CDDProgramMgmt.entity.TProgramInfo;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ProgramControllerTest {
	@Autowired
	private ProgramInfoDao programDao;

	@Test
	public void testAdd() {
		//TProgramInfo info = programDao.getOne(Integer.valueOf(1));
		/*Optional<TProgramInfo> info = programDao.findById(Integer.valueOf(1));
		System.out.println("id="+info.get().getId()+";name="+info.get().getProgramname());	*/
	}
}
