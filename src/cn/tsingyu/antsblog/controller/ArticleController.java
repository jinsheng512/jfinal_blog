package cn.tsingyu.antsblog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.tsingyu.antsblog.interceptor.LoginInterceptor;
import cn.tsingyu.antsblog.model.Article;

import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;

@Before (LoginInterceptor.class)
public class ArticleController extends Controller {
	public void index(){
		Integer id = getParaToInt();
		if(id!=null){
			setAttr("article", Article.dao.findById(id));
		}
		render("article.jsp");
	}
	public void save(){
		Article article = getModel(Article.class);
		String title = getPara("title").trim();
		String content = getPara("content").trim();
		//替换文本中的换行符，前端再替换回去，解决有换行符不能在编辑器赋值的问题
		content=content.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");  
		Integer id = getParaToInt("id");
		Integer cid = getParaToInt("cid");
		article.set("cid", cid);
		article.set("title", title);
		article.set("content", content);
		boolean r = false;
		try{
			if(id!=null){
				article.set("id", id);
				//是博文的原作者才可以编辑
				Integer originCreateUserId=Article.dao.findById(id).get("createUserId");
				if(getSessionAttr("uid")!=null&&originCreateUserId.toString().equals(getSessionAttr("uid").toString())){
					r=article.update();
				}else{
					setAttr("msg", "您不是原文的作者，不能编辑,现在为您跳转到首页");
					setAttr("redirectPage", "");
				}
			}else{
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				article.set("createTime",df.format(new Date()));
				article.set("createUserId", getSessionAttr("uid"));
				article.set("createUserName", getSessionAttr("uname"));
				r = article.save();
			}
			if(r){
				setAttr("msg", "恭喜哈，文章发布成功了,现在为您跳转到首页");
				setAttr("redirectPage", "");
			}else{
				setAttr("msg", "糟糕，文章发布失败了,现在为您跳转到首页");
				setAttr("redirectPage", "");
			}
		}catch(Exception e){
			setAttr("msg", "糟糕，文章发布失败了,现在为您跳转到首页");
			setAttr("redirectPage", "");
		}
		render("/view/common/msg.jsp");
	}
	@Clear
	public void view(){
		Article article = Article.dao.findById(getParaToInt());
		setAttr("article", article);
		Integer uid = getSessionAttr("uid");
		Integer createUserId = article.get("createUserId");
		if(uid!=null&&createUserId!=null){
			setAttr("isAuthor", createUserId.toString().equals(uid.toString()));
		}
		render("view.jsp");
	}
	@Clear
	public void list(){
		setAttr("articlePage",  Article.dao.paginateByCid(getParaToInt(1, 1), 10,getParaToInt(0, 99)));
		render("/view/index/index.jsp");
	}
	
}
