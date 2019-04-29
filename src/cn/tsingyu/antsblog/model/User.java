package cn.tsingyu.antsblog.model;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class User extends Model<User>{
	public static final User dao = new User();
    // 用户登录
    public User login(String uname, String pwd){
        return dao.findFirst("select * from user where uname = ? and pwd = ? limit 1", uname, pwd);
    }
}
