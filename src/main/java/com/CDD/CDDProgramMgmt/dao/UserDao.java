package com.CDD.CDDProgramMgmt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CDD.CDDProgramMgmt.entity.TUser;

public interface UserDao extends JpaRepository<TUser, Integer> {
	public List<TUser> findAll();
}
