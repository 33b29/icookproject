package com.icook.helpQuestion.dao;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.model.helpQuestion;
import com.icook.model.orderBean;
import com.icook.model.orderDetail;

@Repository
public class helpDaoImpl implements helpDao{
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	@Override
	public boolean saveHelpQuestion(helpQuestion temp) {
		try {
			Session session = factory.getCurrentSession();
			session.save(temp);
			System.out.println("---------------correct----------------");
		} catch (Exception e) {
			System.out.println("---------------error----------------");
			return false;
		}
		return true;
	}
}
