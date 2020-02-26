package com.icook.webScoket.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icook.model.chatMember;
import com.icook.model.socketBean;
import com.icook.webScoket.service.socketServiceDao;



@Controller
public class SocketController {
	@Autowired
	socketServiceDao service;

	@Autowired
	public void setService(socketServiceDao service) {
		this.service = service;
	}

	
	@RequestMapping(value = "/WebSocket")
	@ResponseBody
	public String WebSocket(@RequestParam("Message") String message,@RequestParam("Id") int userId,HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		boolean checkResult = service.checkMessageExist(userId);
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
		String date = sdFormat.format(new Date());
		socketBean temp = new socketBean(null, 1, userId, message, date);
		boolean saveResult;
//		if(checkResult == true) {
//			saveResult = service.saveMessage(temp);
//		}
//		else {
//			saveResult = service.saveMessage(temp);
//		}
		saveResult = true;
		if(saveResult == true) {
			date = date.substring(0,16);
			return date;
		}
		else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/searchChatMember")
	@ResponseBody
	public boolean searchChatMember(@RequestParam("userId") int userId,@RequestParam("nickname") String nickname,HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
		String date = sdFormat.format(new Date());
		chatMember temp = new chatMember(null,userId,nickname,date);
		boolean result = service.checkChatMemberExist(userId,temp);
		return true;
	}
}
