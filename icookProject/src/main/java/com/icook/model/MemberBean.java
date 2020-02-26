package com.icook.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="member", uniqueConstraints = { @UniqueConstraint(columnNames = "account") })
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	//請依資料表欄位名稱取名
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer userId;
	String account;
	String password;
	String lastname;
	String firstname;
	String nickname;
	String birthday;
	String gender;
	String phone;
	String address;
	String checkstatus;
	Blob userimg;
	//String filename;
	@Transient
	MultipartFile userimage;
	
	public MemberBean(Integer userId, String account, String password, String lastname, String firstname, String nickname, String birthday, String gender, String phone, String address, String checkstatus,Blob userimg) {
		this.userId = userId;
		this.account = account;
		this.password = password;
		this.lastname = lastname;
		this.firstname = firstname;
		this.nickname = nickname;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.checkstatus = checkstatus;
		this.userimg = userimg;
		//this.filename = filename;
	}
	
	public String getCheckstatus() {
		return checkstatus;
	}

	public void setCheckstatus(String checkstatus) {
		this.checkstatus = checkstatus;
	}

	public MemberBean() {
		super();
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public Blob getUserimg() {
		return userimg;
	}

	public void setUserimg(Blob userimg) {
		this.userimg = userimg;
	}
	
	public MultipartFile getUserimage() {
		return userimage;
	}

	public void setUserimage(MultipartFile userimage) {
		this.userimage = userimage;
	}

//	public String getFileName() {
//		return filename;
//	}
//
//	public void setFileName(String fileName) {
//		this.filename = fileName;
//	}
	
}
	