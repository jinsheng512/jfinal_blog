package cn.tsingyu.antsblog.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Article extends Model<Article>{
	public static final Article dao = new Article();
	public Page<Article> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from article where cid!=4 or cid is null order by id desc");
	}
	public Page<Article> paginateByCid(int pageNumber, int pageSize,int cid) {
		if(cid!=99){
			return paginate(pageNumber, pageSize, "select *", "from article where cid=? order by id desc",cid);
		}else{
			return paginate(pageNumber, pageSize, "select *", "from article order by id desc");
		}
		
	}
	
}
