package org.flashmonkey.user.api;

import java.util.List;

import org.flashmonkey.user.domain.UserEntity;

public interface UserEntityDAO {

    UserEntity register(UserEntity user);

    UserEntity findByName(String username);

    UserEntity findById(Integer id);
    
    UserEntity update(UserEntity user);

    UserEntity destroy(int id);
    
    List<UserEntity> index();
}
