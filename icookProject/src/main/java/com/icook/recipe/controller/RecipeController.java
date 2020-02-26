package com.icook.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.icook.model.RecipeBean;
import com.icook.recipe.service.RecipeService;

@Controller
public class RecipeController {

	RecipeService service;
	ServletContext context;

	@Autowired
	public void setService(RecipeService service) {
		this.service = service;
	}

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

//	取得所有的食譜，傳回食譜列表
	@RequestMapping("/recipes")
	public String allRecipesList(Model model) {
		List<RecipeBean> list = service.getAllRecipes();
		model.addAttribute("recipes", list);
		return "recipe/recipes";
	}

//	依照傳來的recipeNo，找到該筆食譜回傳
	@RequestMapping("/recipe")
	public String getRecipeByRecipeNo(@RequestParam("no") Integer recipeNo, Model model, HttpServletRequest request) {
		RecipeBean rb = service.getRecipeByRecipeNo(recipeNo);
		ArrayList<String[]> ingredList = stringToList(rb.getIngredName(), rb.getIngredQty());
		ArrayList<String[]> group1List = stringToList(rb.getGroup1IngredName(), rb.getGroup1IngredQty());
		ArrayList<String[]> group2List = stringToList(rb.getGroup2IngredName(), rb.getGroup2IngredQty());
		ArrayList<String[]> group3List = stringToList(rb.getGroup3IngredName(), rb.getGroup3IngredQty());

//		先檢查Session有沒有pageView的Attribute，如果有的話，丟下去檢查有沒有看過
		HttpSession Session = request.getSession();
		List pageView = new ArrayList();
		if (Session.getAttribute("pageView") == null) {
			Session.setAttribute("pageView", pageView);
			pageView.add(recipeNo);
			Integer pv = rb.getPageView() + 1;
			rb.setPageView(pv);
			service.updatePageView(rb.getRecipeNo(), pv);
		} else {
			pageView = (List) Session.getAttribute("pageView");
			if (!pageViewed(pageView, recipeNo)) {
				pageView.add(recipeNo);
				Integer pv = rb.getPageView() + 1;
				rb.setPageView(pv);
				service.updatePageView(rb.getRecipeNo(), pv);
			}
		}

		model.addAttribute("ingredList", ingredList);
		model.addAttribute("group1List", group1List);
		model.addAttribute("group2List", group2List);
		model.addAttribute("group3List", group3List);
		model.addAttribute("recipe", rb);
//		食譜左側欄位需要的資料
		List<RecipeBean> top3RecipesList = service.getTop3RecipesByPV();
		model.addAttribute("top3Recipes", top3RecipesList);
		return "recipe/RecipeDetail";
	}

	@RequestMapping("/recipes/list")
	public String getRecipesByMember(Model model, @RequestParam("userId") Integer userId) {
		List<RecipeBean> list = service.getRecipesByMember(userId);
		model.addAttribute("recipes", list);
		return "recipe/memberRecipesList";
	}

	@GetMapping("/recipes/updateRecipe")
	public String updateRecipe(@RequestParam("no") Integer recipeNo, Model model) {
		RecipeBean rb = service.getRecipeByRecipeNo(recipeNo);

		ArrayList<String[]> ingredList = stringToList(rb.getIngredName(), rb.getIngredQty());
		ArrayList<String[]> group1List = stringToList(rb.getGroup1IngredName(), rb.getGroup1IngredQty());
		ArrayList<String[]> group2List = stringToList(rb.getGroup2IngredName(), rb.getGroup2IngredQty());
		ArrayList<String[]> group3List = stringToList(rb.getGroup3IngredName(), rb.getGroup3IngredQty());
		model.addAttribute("ingredList", ingredList);
		model.addAttribute("group1List", group1List);
		model.addAttribute("group2List", group2List);
		model.addAttribute("group3List", group3List);
		model.addAttribute("recipeBean", rb);

		return "recipe/updateRecipe";
	}

	@PostMapping("/recipes/updateRecipe")
	public String updateRecipe(@ModelAttribute("recipeBean") RecipeBean rb,
			@RequestParam("StepImage") MultipartFile[] stepImg, HttpServletRequest request, Model model) {
		MultipartFile coverImg = rb.getRecipeImage();
		RecipeBean rb0 = service.getRecipeByRecipeNo(rb.getRecipeNo());
		System.out.println("-------" + coverImg.isEmpty());
		System.out.println("-------" + coverImg);
		// 如果沒有上傳圖片，就把舊的圖片撈出來使用
		if (coverImg != null && !coverImg.isEmpty()) {
			byte[] b;
			try {
				b = coverImg.getBytes();
				Blob blob = new SerialBlob(b);
				rb.setCoverImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		} else {
			rb.setCoverImg(rb0.getCoverImg());
		}
//		把步驟照片從[ ]撈出轉成blob再存到arrayList裡
		List<Blob> blobList = new ArrayList<>(
				Arrays.asList(null, null, null, null, null, null, null, null, null, null));
		for (int i = 0; i < stepImg.length; i++) {
			if (stepImg[i] != null && !stepImg[i].isEmpty()) {
				byte[] b;
				try {
					b = stepImg[i].getBytes();
					Blob blob = new SerialBlob(b);
					blobList.set(i, blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
				}
			} else {
				blobList.set(i, null);
			}
		}
//		如果沒有上傳照片，就把舊的照片拿出來用
		if (blobList.get(0) != null) {
			rb.setStepPic01(blobList.get(0));
		} else {
			rb.setStepPic01(rb0.getStepPic01());
		}
		if (blobList.get(1) != null) {
			rb.setStepPic02(blobList.get(1));
		} else {
			rb.setStepPic02(rb0.getStepPic02());
		}
		if (blobList.get(2) != null) {
			rb.setStepPic03(blobList.get(2));
		} else {
			rb.setStepPic03(rb0.getStepPic03());
		}
		if (blobList.get(3) != null) {
			rb.setStepPic04(blobList.get(3));
		} else {
			rb.setStepPic04(rb0.getStepPic04());
		}
		if (blobList.get(4) != null) {
			rb.setStepPic05(blobList.get(4));
		} else {
			rb.setStepPic05(rb0.getStepPic05());
		}
		if (blobList.get(5) != null) {
			rb.setStepPic06(blobList.get(5));
		} else {
			rb.setStepPic06(rb0.getStepPic06());
		}
		if (blobList.get(6) != null) {
			rb.setStepPic07(blobList.get(6));
		} else {
			rb.setStepPic07(rb0.getStepPic07());
		}
		if (blobList.get(7) != null) {
			rb.setStepPic08(blobList.get(7));
		} else {
			rb.setStepPic08(rb0.getStepPic08());
		}
		if (blobList.get(8) != null) {
			rb.setStepPic09(blobList.get(8));
		} else {
			rb.setStepPic09(rb0.getStepPic09());
		}
		if (blobList.get(9) != null) {
			rb.setStepPic10(blobList.get(9));
		} else {
			rb.setStepPic10(rb0.getStepPic10());
		}
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
		rb.setPageView(rb0.getPageView());
		service.updateRecipe(rb);
		String status = "修改完成";
		model.addAttribute("status", status);
		return "recipe/status";
	}

	@RequestMapping(value = "/getPicture/{recipeNo}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse response, @PathVariable Integer recipeNo) {
		String filePath = "/WEB-INF/views/images/noImg.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
//		String filename = "";
		int len = 0;
		RecipeBean bean = service.getRecipeByRecipeNo(recipeNo);
		if (bean != null) {
			Blob blob = bean.getCoverImg();
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

	@RequestMapping(value = "/getPicture/{recipeNo}/{step}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getStepPicture(HttpServletResponse response, @PathVariable Integer recipeNo,
			@PathVariable Integer step) {
		String filePath = "/WEB-INF/views/images/noImg.jpg";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		int len = 0;
		RecipeBean bean = service.getRecipeByRecipeNo(recipeNo);
		Blob blob = null;
		if (step.equals(1)) {
			blob = bean.getStepPic01();
		} else if (step.equals(2)) {
			blob = bean.getStepPic02();
		} else if (step.equals(3)) {
			blob = bean.getStepPic03();
		} else if (step.equals(4)) {
			blob = bean.getStepPic04();
		} else if (step.equals(5)) {
			blob = bean.getStepPic05();
		} else if (step.equals(6)) {
			blob = bean.getStepPic06();
		} else if (step.equals(7)) {
			blob = bean.getStepPic07();
		} else if (step.equals(8)) {
			blob = bean.getStepPic08();
		} else if (step.equals(9)) {
			blob = bean.getStepPic09();
		} else if (step.equals(10)) {
			blob = bean.getStepPic10();
		}
		if (blob != null) {
			try {
				len = (int) blob.length();
				media = blob.getBytes(1, len);
			} catch (SQLException e) {
				throw new RuntimeException("Controller的getPicture()發生SQLException:" + e.getMessage());
			}
		} else {
			media = toByteArray(filePath);
		}

		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		MediaType mediaType = MediaType.IMAGE_JPEG;
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		File file = new File(realPath);
		long size = file.length();
		b = new byte[(int) size];
		InputStream fis = context.getResourceAsStream(filepath);
		try {
			fis.read(b);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	@RequestMapping(value = "/recipes/add", method = RequestMethod.GET)
	public String getAddNewRecipeForm(Model model) {
		RecipeBean rb = new RecipeBean();
		model.addAttribute("recipeBean", rb);
		return "recipe/addRecipe";
	}

	@RequestMapping(value = "/recipes/add", method = RequestMethod.POST)
	public String getAddNewRecipeForm(@ModelAttribute("recipeBean") RecipeBean rb,
			@RequestParam("StepImage") MultipartFile[] stepImg, HttpServletRequest request, Model model) {
		MultipartFile coverImg = rb.getRecipeImage();
		if (coverImg != null && !coverImg.isEmpty()) {
			byte[] b;
			try {
				b = coverImg.getBytes();
				Blob blob = new SerialBlob(b);
				rb.setCoverImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		List<Blob> blobList = new ArrayList<>(
				Arrays.asList(null, null, null, null, null, null, null, null, null, null));
//		原本i<stepImg.length，但前端改成可上傳多張照片，所以先改成i<10，之後有空再解決
		System.out.println("length:"+stepImg.length);
		if (stepImg.length <= 10) {
			for (int i = 0; i < stepImg.length; i++) {
				if (stepImg[i] != null && !stepImg[i].isEmpty()) {
					byte[] b;
					try {
						b = stepImg[i].getBytes();
						Blob blob = new SerialBlob(b);
						blobList.set(i, blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
					}
				} else {
					blobList.set(i, null);
				}
			}
		}else {
			for (int i = 0; i < 10; i++) {
				if (stepImg[i] != null && !stepImg[i].isEmpty()) {
					byte[] b;
					try {
						b = stepImg[i].getBytes();
						Blob blob = new SerialBlob(b);
						blobList.set(i, blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
					}
				} else {
					blobList.set(i, null);
				}
			}
		}
		rb.setStepPic01(blobList.get(0));
		rb.setStepPic02(blobList.get(1));
		rb.setStepPic03(blobList.get(2));
		rb.setStepPic04(blobList.get(3));
		rb.setStepPic05(blobList.get(4));
		rb.setStepPic06(blobList.get(5));
		rb.setStepPic07(blobList.get(6));
		rb.setStepPic08(blobList.get(7));
		rb.setStepPic09(blobList.get(8));
		rb.setStepPic10(blobList.get(9));
		Date date = new Date();
		System.out.println(date);
		rb.setLastUpdated(date);
		service.addRecipe(rb);
		String status = "新增完成";
		model.addAttribute("status", status);
		return "recipe/status";
	}

//	陣列轉成字串，暫時沒有用到
	public String listToString(String[] list) {
		String str = "";
		for (int i = 0; i < list.length; i++) {
			if (!list[i].equals("") && list[i] != null) {
				if (i == 0) {
					str += list[i];
				} else {
					str += "," + list[i];
				}
			}
		}
		return str;
	}

//	把字串資料取出來，轉成陣列
	public ArrayList<String[]> stringToList(String name, String qty) {
		if (name == null || qty == null) {
			return null;
		}
		ArrayList<String> ingredNameList = new ArrayList<>(Arrays.asList(name.split(",")));
		ArrayList<String> ingredQtyList = new ArrayList<>(Arrays.asList(qty.split(",")));
		ArrayList<String[]> list = new ArrayList<>();
		if (ingredNameList != null && !ingredNameList.isEmpty()) {
			for (int i = 0; i < ingredNameList.size(); i++) {
				list.add(new String[] { ingredNameList.get(i), ingredQtyList.get(i) });
			}
		}
		return list;
	}

	@RequestMapping(value = "/recipes/deleteRecipe", method = RequestMethod.GET)
	public String deleteRecipe(@RequestParam("no") Integer recipeNo, Model model) {
		RecipeBean rb = service.getRecipeByRecipeNo(recipeNo);
		Integer userId = rb.getUserId();
		model.addAttribute("userId", userId);
		service.deleteRecipe(recipeNo);
		String status = "刪除完成";
		model.addAttribute("status", status);
		return "recipe/status";
	}

//	判斷有沒有看過這一頁
	public Boolean pageViewed(List pageViewedList, Integer recipeNo) {
		for (int i = 0; i < pageViewedList.size(); i++) {
			if (pageViewedList.get(i).equals(recipeNo)) {
				return true;
			}
		}
		return false;
	}
}
