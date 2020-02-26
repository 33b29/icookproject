package com.icook.helpQuestion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.helpQuestion.dao.helpDao;
import com.icook.model.helpQuestion;

@Transactional
@Service
public class helpService implements helpServiceDao {
	helpDao dao;
	@Autowired
	public void setDao(helpDao dao) {
		this.dao = dao;
	}
	@Override
	public boolean saveHelp(helpQuestion temp) {
		boolean result = dao.saveHelpQuestion(temp);
		if(result == true) return true;
		else return false;
	}
	
 }
