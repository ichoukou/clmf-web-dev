package com.mwi.clmf.model.meeting;import com.jfinal.plugin.activerecord.Db;import com.jfinal.plugin.activerecord.Model;import com.jfinal.plugin.activerecord.Page;@SuppressWarnings("serial")public class NewsModel extends Model<NewsModel> {	public final static NewsModel nDao = new NewsModel();		public Page<NewsModel> getList(String newTitle, String publishDate,			String validDate, String newsResource, String newsAbstract,			String newsContent,Integer isbind,int currentPage, int currentSize, String pubStatus) {				boolean newTitleNotNull = !"".equals(newTitle) && newTitle != null;		boolean publishDateNotNull = !"".equals(publishDate) && publishDate != null;		boolean validDateNotNull = !"".equals(validDate) && validDate != null;		boolean newsResourceNotNull = !"".equals(newsResource) && newsResource != null;		boolean newsAbstractNotNull = !"".equals(newsAbstract) && newsAbstract != null;		boolean newsContentNotNull = !"".equals(newsContent) && newsContent != null;		boolean isbindNotNull = !"".equals(isbind) && isbind !=null;				String sql = "from cf_news cn where 1=1 ";		if(newTitleNotNull)			sql += " and cn.new_title like '%"+newTitle+"%'";		if(publishDateNotNull)			sql += " and cn.publish_date= '"+publishDate+"'";		if(validDateNotNull)			sql += " and cn.valid_date= '"+validDate+"'";		if(newsResourceNotNull)			sql += " and cn.news_resource like '%"+newsResource+"%'";		if(newsAbstractNotNull)			sql += " and cn.news_abstract like '%"+newsAbstract+"%'";		if(newsContentNotNull)			sql += " and cn.news_content like '%"+newsContent+"%'";		if(isbindNotNull)				sql += " and cn.is_bind_category ='"+isbind+"'";				if(pubStatus != null && !"".equals(pubStatus)){			if("1".equals(pubStatus)){				sql += " and cn.publish_date <= CURDATE() and cn.valid_date >= CURDATE()";			} else if("2".equals(pubStatus)){				sql += " and cn.publish_date > CURDATE()";			} else if("3".equals(pubStatus)){				sql += " and cn.valid_date < CURDATE()";			}		}				System.out.println("last sql:--"+sql);		sql += " order by cn.id  desc";		return nDao.paginate(currentPage, currentSize, "select *", sql);	}		public boolean bathdelNews(Integer newsId){		int num = Db.update("delete from cf_news where id = "+newsId+"");		return num == 1 ? true : false;	}			public Page<NewsModel> getNewsList(String categoryId,int currentPage, int currentSize) {		boolean categoryIdNotNull = !"".equals(categoryId) && categoryId != null;		String sql = "from cf_news cn where 1=1 and cn.publish_date <= CURDATE()";		if(categoryIdNotNull)			sql += " and find_in_set("+categoryId+",cn.category_id)";				System.out.println("last sql:--"+sql);		sql += " order by cn.id  desc";		return nDao.paginate(currentPage, currentSize, "select *", sql);	}	}