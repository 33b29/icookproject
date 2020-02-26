package com.icook.member.dao;

import java.util.List;

import com.icook.model.MemberBean;


public interface MemberDao {

	void insertMem(MemberBean memberBean);

	void updateMem(MemberBean memberBean);

	void InquireMem(MemberBean memberBean);

	Boolean searchAccount(String account);

	MemberBean searchMemberBean(String account);

	public void verificationLetter(String userId);

	MemberBean getuserById(int userId);

	MemberBean searchMemberBeanuserId(Integer userId);



	
}
