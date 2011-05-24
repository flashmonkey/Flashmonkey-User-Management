package org.flashmonkey.user.impl;

import org.apache.log4j.Logger;
import org.flashmonkey.user.api.UserEntityDAO;
import org.flashmonkey.user.domain.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {

    private static Logger log = Logger.getLogger(UserDetailsServiceImpl.class);
    
	@Autowired private UserEntityDAO dao;
	
	@Autowired private Assembler assembler;
	
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		
		log.debug("loading user by username " + username);

        UserEntity userEntity = dao.findByName(username);
         if (userEntity == null)
              throw new UsernameNotFoundException("user not found");

        return  assembler.buildUserFromUserEntity(userEntity);

	}

}
