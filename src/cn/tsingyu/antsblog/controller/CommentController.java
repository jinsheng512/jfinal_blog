package cn.tsingyu.antsblog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.tsingyu.antsblog.common.Json;
import cn.tsingyu.antsblog.model.Comment;

import com.jfinal.core.Controller;

public class CommentController extends Controller{
	public void index(){
		Integer objCode = getParaToInt("objCode");
		Integer objId = getParaToInt("objId");
		renderJson(Comment.dao.findByObj(objId,objCode));
	}
	public void add(){
		String content = getPara("content").trim();
		Integer objCode = getParaToInt("objCode");
		Integer objId = getParaToInt("objId");
		Comment comment = getModel(Comment.class);
		comment.set("content", content);
		comment.set("objCode", objCode);
		comment.set("objId", objId);
		comment.set("createUserId", getSessionAttr("uid"));
		comment.set("createUserName", getSessionAttr("uname"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		comment.set("createTime",df.format(new Date()));
		boolean r = comment.save();
		Json j=new Json();
		j.setSuccess(r);
		if(r){
			j.setMsg("评论成功");
		}else{
			j.setMsg("评论失败");
		}
		renderJson(j);
	}
}
