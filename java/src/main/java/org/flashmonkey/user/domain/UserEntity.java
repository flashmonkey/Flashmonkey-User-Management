package org.flashmonkey.user.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name="USER")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="user_type", discriminatorType=DiscriminatorType.STRING)
public class UserEntity implements Serializable, UserDetails {

    private static final long serialVersionUID = 1L;
    
	@Id
    @GeneratedValue
    private int id;
	 
	@Column(name="created_at")
	private Date createdAt;
	
	@Column(name="logged_in")
	private Boolean loggedIn = false;
	
	@Column(name="last_login")
	private Date lastLogin;
	
	private String email;
    
    private String password;
   
    private String username;
    
    @Column(name="user_type", insertable=false, updatable=false)
    private String userType;
    
    @ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinTable(name = "USER_ROLE", 
    		   joinColumns = @JoinColumn(name = "user_id"),
    		   inverseJoinColumns = @JoinColumn(name = "role_id"))
	private List<RoleEntity> roles;
    
    @Transient
    private boolean rolesDirty = true;
    
    @Transient
    private Collection<GrantedAuthority> authorities;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setLoggedIn(Boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
	public Boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }

	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserType() {
		return userType;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
		rolesDirty = true;
	}
	public List<RoleEntity> getRoles() {
		return roles;
	}
	
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		if (rolesDirty) {
			if (authorities == null) {
				authorities = new ArrayList<GrantedAuthority>();
			} else {
				authorities.clear();
			}
			
			for (RoleEntity role : roles) {
				authorities.add(new GrantedAuthorityImpl(role.getName()));
			}
		}
		
		return authorities;
	}
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
