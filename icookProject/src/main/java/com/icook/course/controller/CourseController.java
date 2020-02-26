package com.icook.course.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.icook.course.service.CourseService;
import com.icook.model.CourseBean;

@Controller
public class CourseController {
	CourseService service;

	@Autowired
	public void setService(CourseService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// 課程首頁: 搜尋表單 + 全部課程清單
	@GetMapping("/course/courseHomePage")
	public String searchCoursesForm(Model model) {
		System.out.println("進入controller: searchCoursesForm");
		String courseName = null;
		List<CourseBean> list = service.queryAllCourse();
		for (CourseBean cb : list) {
			String courTime = cb.getCourseTime().substring(0, 2);
			Integer i = Integer.parseInt(courTime) + cb.getCourseHour();
			cb.setCourseTime(cb.getCourseTime().substring(0, 5) + "~" + Integer.toString(i)
					+ cb.getCourseTime().substring(2, 5));
		}
		model.addAttribute("courseName", courseName);
		model.addAttribute("courses", list);
		return "course/courseHomePage";
	}

	// 課程首頁: 模糊搜尋課程清單
	@PostMapping("/course/courseHomePage")
	public String searchCoursesList(@RequestParam("courseName") String courseName, Model model) {
		System.out.println("進入controller: searchCoursesList");
		List<CourseBean> list = null;
		
		if (courseName == null) {
			System.out.println("courses is null.");
			list = service.queryAllCourse();
		} else {
			System.out.println("courses is not null.");
			list = service.queryCourse(courseName);
			for (CourseBean cb : list) {
				String courTime = cb.getCourseTime().substring(0, 2);
				Integer i = Integer.parseInt(courTime) + cb.getCourseHour();
				cb.setCourseTime(cb.getCourseTime().substring(0, 5) + "~" + Integer.toString(i)
						+ cb.getCourseTime().substring(2, 5));
			}
		}
		model.addAttribute("courses", list);
		return "course/courseHomePage";
	}

//	取得照片
	@GetMapping(value = "/getPic/{courseId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer courseId) {
		String filePath = "/WEB-INF/views/course/image/food1.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
		int len = 0;
		CourseBean bean = service.getCourseById(courseId);
		
		String courTime = bean.getCourseTime().substring(0, 2);
		Integer i = Integer.parseInt(courTime) + bean.getCourseHour();
		bean.setCourseTime(bean.getCourseTime().substring(0, 5) + "~" + Integer.toString(i)
				+ bean.getCourseTime().substring(2, 5));
		
		if (bean != null) {
			Blob blob = bean.getCourseImage();
//			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("Controller的getPicture()發生SQLException:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
//				filename = filePath;
			}
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//		String mimeType = context.getMimeType(filePath);
		MediaType mediaType = MediaType.IMAGE_JPEG;
//		System.out.println("mediaType= " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

//取得很多張照片
	private byte[] toByteArray(String filePath) {
		byte[] b = null;
		String realPath = context.getRealPath(filePath);
		File file = new File(realPath);
		long size = file.length();
		b = new byte[(int) size];
		InputStream fis = context.getResourceAsStream(filePath);
		try {
			fis.read(b);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
