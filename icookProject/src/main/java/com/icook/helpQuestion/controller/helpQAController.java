package com.icook.helpQuestion.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.icook.helpQuestion.service.helpServiceDao;
import com.icook.model.MemberBean;
import com.icook.model.helpQuestion;

@Controller
public class helpQAController {

	@Autowired
	helpServiceDao service;

	@Autowired
	public void setService(helpServiceDao service) {
		this.service = service;
	}

	@RequestMapping(value = "/helpQuestion", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String helpQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return "helpQuestion/mail";
	}
	
	@RequestMapping(value = "/sendQuestion", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String sendQuestion(@RequestParam("Email")String Email,@RequestParam("fname")String Title,@RequestParam("Message")String Message,HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
		MemberBean member = (MemberBean)session.getAttribute("LoginOK");
		helpQuestion temp = new helpQuestion(null,member.getUserId(),Email,Title,Message,"N");
		boolean result = service.saveHelp(temp);
		return "helpQuestion/mail";
	}
}
