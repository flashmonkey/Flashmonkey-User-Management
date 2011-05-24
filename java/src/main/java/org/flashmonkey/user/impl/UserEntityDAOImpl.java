package org.flashmonkey.user.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.flashmonkey.user.api.UserEntityDAO;
import org.flashmonkey.user.domain.UserEntity;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

public class UserEntityDAOImpl implements UserEntityDAO {

    private static Logger log = Logger.getLogger(UserEntityDAOImpl.class);
    
    @Autowired
    private SessionFactory sessionFactory;

    public UserEntity register(UserEntity user) {
        sessionFactory.getCurrentSession().save(user);
        return user;
    }

    public UserEntity findByName(String username) {
    	return (UserEntity) sessionFactory.getCurrentSession().createCriteria(UserEntity.class).add(Restrictions.eq( "username", username ) ).uniqueResult();
    }

    public UserEntity findById(Integer id) {
    	return (UserEntity) sessionFactory.getCurrentSession().createCriteria(UserEntity.class).add(Restrictions.eq( "id", id ) ).uniqueResult();
    }
    public UserEntity update(UserEntity user) {
        sessionFactory.getCurrentSession().update(user);
        return user;
    }

    @SuppressWarnings("unchecked")
	public List<UserEntity> index() {
    	List<UserEntity> list = (List<UserEntity>) sessionFactory.getCurrentSession().createQuery("from UserEntity").list();
    
    	log.debug("The list is " + list.size() + " long");
    	
    	return list;
    }
    
    public UserEntity destroy(Integer id) {
        UserEntity user = (UserEntity) sessionFactory.getCurrentSession().load(UserEntity.class, id);
        if (null != user) {
            sessionFactory.getCurrentSession().delete(user);
        }
        return user;
    }

}
