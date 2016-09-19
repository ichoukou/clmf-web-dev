package com.mwi.clmf.controller.admin.meeting;import java.io.File;import java.io.FileInputStream;import java.io.FileOutputStream;import java.text.SimpleDateFormat;import java.util.Date;import java.util.List;import com.jfinal.core.Controller;import com.jfinal.plugin.activerecord.Page;import com.jfinal.upload.UploadFile;import com.mwi.clmf.model.meeting.NewCategoryModel;import com.mwi.clmf.model.meeting.NewsModel;import com.mwi.clmf.util.Validator;public class PublishNewsController extends Controller {	public void index(){				String newsTitle = getPara("newsTitle");		String publishDate = Validator.isNull(getPara("publishDate")) ? null : getPara("publishDate");		String validDate = Validator.isNull(getPara("validDate")) ? null : getPara("validDate");		String newsResource = Validator.isNull(getPara("newsResource")) ? null : getPara("newsResource");		String newsAbstract = Validator.isNull(getPara("newsAbstract")) ? null : getPara("newsAbstract");		String newsContent = Validator.isNull(getPara("newsContent")) ? null : getPara("newsContent");		Integer currentPage = getParaToInt("currentPage") == null ? 1 : getParaToInt("currentPage");		Integer currentSize = getParaToInt("currentSize") == null ? 10 : getParaToInt("currentSize");		Integer isbind= getParaToInt("isbind");		String pubStatus = getPara("pubStatus");				Page<NewsModel> pageList = NewsModel.nDao.getList(newsTitle, publishDate, validDate, newsResource, newsAbstract, newsContent, isbind, currentPage, currentSize, pubStatus);				List<NewsModel> newsList = pageList.getList();		for(int i=0; i<newsList.size(); i++){			newsList.get(i).put("categoryList", NewCategoryModel.NCDao.catListById(newsList.get(i).getStr("category_id")));		}				setAttr("curdate", new SimpleDateFormat("YYYY-MM-dd").format(new Date(System.currentTimeMillis())));		setAttr("pageList", pageList);		setAttr("newsTitle", newsTitle);		setAttr("currentPage", currentPage);		setAttr("currentSize", currentSize);		setAttr("totalPage", pageList.getTotalPage());		setAttr("publishDate", publishDate);		setAttr("validDate", validDate);		setAttr("newsResource", newsResource);		setAttr("newsAbstract", newsAbstract);		setAttr("newsContent", newsContent);		setAttr("isbind", isbind);		setAttr("pubStatus", pubStatus);				setAttr("catList", NewCategoryModel.NCDao.getCategoryList());		render("news.jsp");	}		public void saveCategory(){		String admission_rules_standard_name = getPara("admission_rules_standard_name");		String admission_rules_description = getPara("admission_rules_description");		new NewCategoryModel().				set("category_name", admission_rules_standard_name).				set("category_desc", admission_rules_description).set("is_show", 1).save();		redirect("/publishNews");	}		public void findByCatId(){		renderJson("newsCategory", NewCategoryModel.NCDao.findById(getPara()));	}		public void updateCategory(){		String categoryId = getPara("categoryId");		String admission_rules_standard_name = getPara("admission_rules_standard_name_update");		String admission_rules_description = getPara("admission_rules_description_update");		System.out.println(admission_rules_standard_name+admission_rules_description);		new NewCategoryModel().findById(categoryId).				set("category_name", admission_rules_standard_name).				set("category_desc", admission_rules_description).set("is_show", 1).update();		redirect("/publishNews");	}			public void saveNews(){		UploadFile uploadFile = getFile("newImg");		String path = "/data/newImg/";		String filePath = "";		String fileName = "";		if(uploadFile != null){			File source = uploadFile.getFile();			fileName = source.getName();			String uploadfileName = "newImg" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + uploadFile.getFileName();			filePath = path + uploadfileName;			try {				FileInputStream fis = new FileInputStream(source);				File targetDir = new File(path);				if (!targetDir.exists()) {					targetDir.mkdirs();				}				File target = new File(targetDir, uploadfileName);				if (!target.exists()) {					target.createNewFile();				}				FileOutputStream fos = new FileOutputStream(target);				byte[] bts = new byte[300];				while (fis.read(bts, 0, 300) != -1) {					fos.write(bts, 0, 300);				}				fos.close();				fis.close();				source.delete();			} catch (Exception e) {				e.printStackTrace();			}		}						Integer newsId=getParaToInt("newsId");		String newsTitle = getPara("newsTitle");		String publishDate = getPara("publishDate");		String validDate = getPara("validDate");		String newsResource = getPara("newsResource");		String newsAbstract = getPara("newsAbstract");		String newsContent = getPara("newsContent");				if(newsId!=null){			if(uploadFile == null){				filePath = getPara("oldNewsImg");				fileName = getPara("oldFileName");			}			new NewsModel().findById(newsId).					set("new_title", newsTitle).					set("publish_date", publishDate).					set("valid_date", validDate).					set("news_resource", newsResource).					set("news_abstract", newsAbstract).					set("news_content",newsContent).					set("news_imgurl", filePath).					set("category_id", null).					set("is_bind_category", 0).					set("img_name", fileName).update();		}else{			new NewsModel().				set("new_title", newsTitle).				set("publish_date", publishDate).				set("valid_date", validDate).				set("news_resource", newsResource).				set("news_abstract", newsAbstract).				set("news_content",newsContent).				set("category_id", null).				set("news_imgurl", filePath).				set("is_bind_category", 0).set("img_name", fileName).save();					}		redirect("/publishNews");	}		public void findByNewsId(){		renderJson("news", NewsModel.nDao.findById(getPara()));	}		public void deleteByNewsId(){		new NewsModel().deleteById(getPara());		redirect("/publishNews");	}		public void deleteByCId(){		new NewCategoryModel().deleteById(getPara());		redirect("/publishNews");	}		public void bindCategory(){		Integer newId = getParaToInt("newsId");		String[] catId = getParaValues("catId");		String cat_id = "";		for (String str : catId) {			cat_id += str + ",";		}		new NewsModel().findById(newId).set("is_bind_category",1).set("category_id", cat_id.substring(0, cat_id.length() - 1)).update();		redirect("/publishNews");	}		public void bathdelNews(){		String news_id = getPara("newsId");		String[] newsIds = news_id.split(",");		for(int i=0; i<newsIds.length; i++){			new NewsModel().bathdelNews(Integer.valueOf(newsIds[i]));		}		redirect("/publishNews");	}		public void bathbindCategory(){		String news_id = getPara("newsId");		String[] newsIds = news_id.split(",");		String[] catId = getParaValues("catId");		String cat_id = "";		for (String str : catId) {			cat_id += str + ",";		}		cat_id = cat_id.substring(0, cat_id.length()-1);				for(int i=0; i<newsIds.length; i++){			new NewsModel().findById(newsIds[i]).set("category_id", cat_id).set("is_bind_category",1).update();		}		redirect("/publishNews");	}}