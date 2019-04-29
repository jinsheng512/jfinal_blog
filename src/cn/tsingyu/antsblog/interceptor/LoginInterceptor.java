package cn.tsingyu.antsblog.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * 登录拦截
 */
public class LoginInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
		String uname = controller.getSessionAttr("uname");
		if (null == uname) {
			controller.setAttr("msg", "您还没有登录，现在为您跳转到登录页");
			controller.setAttr("redirectPage", "user/login");
			controller.render("/view/common/msg.jsp");
		} else {
			inv.invoke();
		}
	}
}
