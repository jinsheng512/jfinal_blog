package cn.tsingyu.antsblog.controller;

import cn.tsingyu.antsblog.model.Article;

import com.jfinal.core.Controller;

public class IndexController extends Controller{
	public void index(){
		setAttr("articlePage", Article.dao.paginate(getParaToInt(0, 1), 10));
		render("index.jsp");
//		render("index.html");
	}
}
