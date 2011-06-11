package org.flashmonkey.user.api;

import java.util.List;

import org.flashmonkey.user.domain.UserEntity;

public interface UserService {

	List<UserEntity> findAll();
	
	UserEntity findByName(String username);
	
	UserEntity register(UserEntity user);
	
	UserEntity destroy(UserEntity user);
	
	UserEntity update(UserEntity user);
}
