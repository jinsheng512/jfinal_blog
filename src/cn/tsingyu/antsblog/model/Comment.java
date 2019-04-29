package cn.tsingyu.antsblog.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Comment extends Model<Comment>{
	public static final Comment dao = new Comment();
	public Page<Comment> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from comment order by id desc");
	}
	public List<Comment> findByObj(Object ... paras){
		return find("select * from comment where objId = ? and objCode=? order by id desc",paras);
	}
}
