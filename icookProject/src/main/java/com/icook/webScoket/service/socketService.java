package com.icook.webScoket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icook.model.chatMember;
import com.icook.model.socketBean;
import com.icook.webScoket.dao.socketDao;

@Transactional
@Service
public class socketService implements socketServiceDao {
	socketDao dao;
	@Autowired
	public void setDao(socketDao dao) {
		this.dao = dao;
	}
	@Override
	public boolean saveMessage(socketBean temp) {
		boolean result = dao.saveWebSocketMessage(temp);
		if(result == true) return true;
		else return false;
	}
	@Override
	public boolean checkMessageExist(int userId) {
		boolean result = dao.checkWebSocketMessage(userId);
		if(result == true) return true;
		else return false;
	}
	@Override
	public boolean checkChatMemberExist(int userId,chatMember temp) {
		boolean result = dao.checkChatMember(userId);
		System.out.println(result);
		if(result == true) {
			return true;
		}
		else {
			dao.saveChatMember(temp);
			return false;
		}
	}
	
	
 }
