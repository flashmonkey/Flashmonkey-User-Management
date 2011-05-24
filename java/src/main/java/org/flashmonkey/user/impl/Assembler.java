package org.flashmonkey.user.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.flashmonkey.user.domain.UserEntity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.transaction.annotation.Transactional;

public class Assembler {

	  @Transactional(readOnly = true)
	  public User buildUserFromUserEntity(UserEntity userEntity) {
	
	    String username = userEntity.getUsername();
	    String password = userEntity.getPassword();
	    boolean enabled = userEntity.isActive();
	    boolean accountNonExpired = userEntity.isActive();
	    boolean credentialsNonExpired = userEntity.isActive();
	    boolean accountNonLocked = userEntity.isActive();
	    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    authorities.add(new GrantedAuthorityImpl("ROLE_USER"));
//	    for (SecurityRoleEntity role : userEntity.getUserSecurityRoleEntity()) {
//	      authorities.add(new GrantedAuthorityImpl(role.getName()));
//	    }
	
	    User user = new User(username, password, enabled,
	      accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	    return user;
	  }

}
