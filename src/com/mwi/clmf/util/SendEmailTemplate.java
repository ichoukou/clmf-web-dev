package com.mwi.clmf.util;import java.io.IOException;import java.text.SimpleDateFormat;import java.util.Date;import java.util.List;import com.jfinal.plugin.redis.Cache;import com.jfinal.plugin.redis.Redis;import com.mwi.clmf.model.EmailSendLogModel;import com.mwi.clmf.model.guest.GuestInforModel;public class SendEmailTemplate extends Thread {		public SendEmailTemplate(String key){		super(key);	}		@Override	public void run() {		boolean sendSuc = false;		Cache emailCache = Redis.use("emailList");		String key = this.getName();				//获取redis数据放入变量		List list = emailCache.get(key+"toMail");		String subject = emailCache.get(key+"subject");		String emailContent = emailCache.get(key+"content");		String filePath = emailCache.get(key+"filePath");		String password = emailCache.get(key+"password");				//删除redis里的数据		emailCache.del(key+"toMail");		emailCache.del(key+"subject");		emailCache.del(key+"content");		emailCache.del(key+"filePath");				for(int i=0; i<list.size(); i++){			GuestInforModel gi = GuestInforModel.guestDao.getGuestByEmail(list.get(i).toString());			emailContent = emailContent.replace("#chinese_name#", gi.getStr("chinese_name"));			emailContent = emailContent.replace("#english_name#", gi.getStr("english_name"));			emailContent = emailContent.replace("#passport_no#", gi.getStr("passport_no"));			emailContent = emailContent.replace("#username#", gi.getStr("email"));			emailContent = emailContent.replace("#password#", password);			emailContent = emailContent.replace("#post#", gi.getStr("post"));			sendSuc = SendEmail.sendMail(list.get(i).toString(), emailContent, subject, filePath);			String isSuc = "1";			if(sendSuc){				isSuc = "0";			}			new EmailSendLogModel().set("to_mail", list.get(i).toString()).				set("mail_subject", subject).				set("mail_content", emailContent).				set("file_name", filePath).				set("send_time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis()))).				set("is_success", isSuc).save();		}			}	public static void main(String[] args) throws IOException {		String test = null;		String temp = "123456789";		temp = temp.replace("23", test);		System.out.println(temp);	}		}