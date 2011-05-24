package org.flashmonkey.user.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="userType", discriminatorType=DiscriminatorType.STRING)
public class UserEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    
	@Id
    @GeneratedValue
    private int id;
	
	private String email;
	
    private String firstName;
  
    private String lastName;
    
    private Date dob;
    
    private String password;
   
    private String username;
   
    private boolean isActive;
   
    public String confirmPassword;
    
    @Column(insertable=false, updatable=false)
    private String userType;
    
//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinTable(name = "user_address", joinColumns = { @JoinColumn(name = "user_id") },
//            inverseJoinColumns = { @JoinColumn(name = "address_id") })
//    private Set<Address> userAddress = new HashSet<Address>(0);
    /*******************************************************************************/
//    @OneToMany(cascade = CascadeType.ALL)
//    @JoinTable(name = "user_security_role", joinColumns = { @JoinColumn(name = "user_id") },
//            inverseJoinColumns = { @JoinColumn(name = "security_role_id") })
//    private Set<SecurityRoleEntity> userSecurityRoleEntity = new HashSet<SecurityRoleEntity>(0);

//    public Set<Address> getUserAddress(){
//        return this.userAddress;
//    }
//
//    public void setUserAddress(Set<Address> userAddress) {
//        this.userAddress = userAddress;
//    }
    /*****************************************************************************/

//    public Set<SecurityRoleEntity> getUserSecurityRoleEntity(){
//        return this.userSecurityRoleEntity;
//    }
//
//    public void setUserSecurityRoleEntity(Set<SecurityRoleEntity> userSecurityRoleEntity) {
//        this.userSecurityRoleEntity = userSecurityRoleEntity;
//    }
    
    public Collection<GrantedAuthority> getAuthorities() {
    	GrantedAuthority auth = new GrantedAuthorityImpl("ROLE_USER");
    	
    	Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    	authorities.add(auth);
    	
    	return authorities;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String first_name) {
        this.firstName = first_name;
    }
    public String getLast_name() {
        return lastName;
    }
    public void setLastName(String last_name) {
        this.lastName = last_name;
    }
    public Date getDob() {
        return dob;
    }
    public void setDob(Date dob) {
        this.dob = dob;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
//    public int getUser_types_id() {
//        return user_types_id;
//    }
//    public void setUser_types_id(int user_types_id) {
//        this.user_types_id = user_types_id;
//    }

	public void setUserType(String transactionType) {
		this.userType = transactionType;
	}

	public String getUserType() {
		return userType;
	}
}
