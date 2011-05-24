package org.flashmonkey.user.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.flashmonkey.user.api.UserEntityDAO;
import org.flashmonkey.user.api.UserService;
import org.flashmonkey.user.domain.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
public class UserServiceImpl implements UserService {

    private static Logger log = Logger.getLogger(UserServiceImpl.class);
    
	@Autowired 
	private UserEntityDAO dao;

	@Transactional(readOnly = true)
	public List<UserEntity> findAll() {
		return dao.index();
	}
	
	@Transactional
	public UserEntity register(UserEntity user) {
	    return dao.register(user);
	}
	
	@Transactional(readOnly=true)
	public UserEntity findByName(String username) {
	    return dao.findByName(username);
	}
}
