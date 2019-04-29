package cn.tsingyu.antsblog.common;

import cn.tsingyu.antsblog.controller.ArticleController;
import cn.tsingyu.antsblog.controller.CommentController;
import cn.tsingyu.antsblog.controller.IndexController;
import cn.tsingyu.antsblog.controller.UserController;
import cn.tsingyu.antsblog.model.Article;
import cn.tsingyu.antsblog.model.Comment;
import cn.tsingyu.antsblog.model.User;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

public class Config extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		loadPropertyFile("config.properties");
		me.setViewType(ViewType.JSP);

	}

	@Override
	public void configRoute(Routes me) {
		me.add("/", IndexController.class, "/view/index");
		me.add("/article", ArticleController.class, "/view/article");
		me.add("/user", UserController.class, "/view/user");
		me.add("/comment", CommentController.class, "/view/comment");
	}

	@Override
	public void configPlugin(Plugins me) {
		// 配置Druid数据库连接池插件
//		PropKit.use("dd");
		DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		me.add(dp);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		me.add(arp);
		// 映射模型到数据表
		arp.addMapping("article", Article.class);
		arp.addMapping("user", User.class);
		arp.addMapping("comment", Comment.class);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub

	}

	@Override
	public void configHandler(Handlers me) {
		me.add(new ContextPathHandler("base_path"));
	}

	@Override
	public void configEngine(Engine me) {
		// TODO Auto-generated method stub

	}

}
