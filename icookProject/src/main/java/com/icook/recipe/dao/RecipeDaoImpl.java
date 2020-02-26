package com.icook.recipe.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icook.model.MemberBean;
import com.icook.model.RecipeBean;

@Repository
public class RecipeDaoImpl implements RecipeDao {

	SessionFactory factory;
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeBean> getAllRecipes() {
		String hql = "From RecipeBean order by lastUpdated desc";
		Session session = factory.getCurrentSession();
		List<RecipeBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public RecipeBean getRecipeByRecipeNo(int recipeNo) {
		Session session = factory.getCurrentSession();
		RecipeBean rb = session.get(RecipeBean.class, recipeNo);
		return rb;
	}

	@Override
	public void addRecipe(RecipeBean recipe) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberId(recipe.getUserId());  //把userId加進來
		recipe.setMemberBean(mb);
		recipe.setPageView(0);
		session.save(recipe);
	}

	@Override
	public MemberBean getMemberId(int userId) {
		Session session = factory.getCurrentSession();
		MemberBean mb = null;
		mb = session.get(MemberBean.class, userId);
		return mb;
	}

	@Override
	public void updateRecipe(RecipeBean recipe) {
		Session session = factory.getCurrentSession();
		MemberBean mb = getMemberId(recipe.getUserId());  //把userId加進來
		recipe.setMemberBean(mb);
		session.update(recipe);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeBean> getRecipesByMember(int userId) {
		Session session = factory.getCurrentSession();
		String hql = "From RecipeBean where userId=:uid order by lastUpdated desc";
		List<RecipeBean> list = new ArrayList<>();
		try {
			list = session.createQuery(hql).setParameter("uid", userId).getResultList();
		}catch(NoResultException e) {
			return null;
		}
		return list;
	}

	@Override
	public void deleteRecipe(int recipeNo) {
		Session session = factory.getCurrentSession();
		RecipeBean rb = new RecipeBean();
		rb.setRecipeNo(recipeNo);
		session.delete(rb);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RecipeBean> getTop3RecipesByPV() {
		Session session = factory.getCurrentSession();
		String hql = "From RecipeBean order by pageView desc";
		List<RecipeBean> list = new ArrayList<>();
		list = session.createQuery(hql).setMaxResults(3).getResultList();
		return list;
	}

	@Override
	public void updatePageView(int recipeNo, int pageView) {
		Session session = factory.getCurrentSession();
		String hql = "Update RecipeBean set pageView = :pageView Where recipeNo = :no";
		
		int n = session.createQuery(hql)
				.setParameter("pageView", pageView)
				.setParameter("no", recipeNo)
				.executeUpdate();
	}

		
}
