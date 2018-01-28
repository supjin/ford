package com.ft.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import sun.security.krb5.internal.PAData;

import com.ft.util.PageData;

public class SendMail {

	// 发件人的 邮箱 和 密码（替换为自己的邮箱和密码）
	// PS: 某些邮箱服务器为了增加邮箱本身密码的安全性，给 SMTP 客户端设置了独立密码（有的邮箱称为“授权码”）,
	// 对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。
	//public static String myEmailAccount = "672892075@qq.com";
	//public static String myEmailPassword = "vzqjtyjylujkbdej";
	public static String myEmailAccount = "shunping.zhu@rebo-group.com";
	public static String myEmailPassword = "CQboao2016";
	// 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
	// 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
	public static String myEmailSMTPHost = "smtp.office365.com";

	// 收件人邮箱（替换为自己知道的有效邮箱）
	// public static String receiveMailAccount = "1762667021@qq.com";

	public void sinkMail(String receiveMailAccount,PageData pds) {
		//System.out.println(EMAIL+"======================================="+receiveMailAccount);
		// 1. 创建参数配置, 用于连接邮件服务器的参数配置
		Properties props = new Properties(); // 参数配置
		props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", myEmailSMTPHost); // 发件人的邮箱的 SMTP
																// 服务器地址
		props.setProperty("mail.smtp.auth", "true"); // 需要请求认证

		// PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
		// 如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
		// 打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。

		// SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
		// 需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
		// QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
		final String smtpPort = "587";
		props.setProperty("mail.smtp.port", smtpPort);
		/*props.setProperty("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");*/
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", "25");
		props.setProperty("mail.smtp.starttls.enable", "true");
		// props.put("mail.smtp.starttls.enable", "true");

		/*
		 * Properties properties = new Properties();
		 * properties.setProperty("mail.host", "smtp.qq.com");
		 * properties.setProperty("mail.transport.protocol", "smtp");
		 * properties.setProperty("mail.smtp.auth", "true");
		 * properties.setProperty("mail.smtp.socketFactory.class",
		 * "javax.net.ssl.SSLSocketFactory");
		 * properties.setProperty("mail.smtp.port", 465);
		 * properties.setProperty("mail.smtp.socketFactory.port", 465);
		 */

		// 2. 根据配置创建会话对象, 用于和邮件服务器交互
		Session session = Session.getDefaultInstance(props);
		session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log

		// 3. 创建一封邮件
		MimeMessage message = null;
		try {
			if(null != pds.getString("DANTYPE") && pds.getString("DANTYPE").equals("1")){
				message = createTimeMessage(session, myEmailAccount,receiveMailAccount, pds);
			}else {
				message = createMimeMessage(session, myEmailAccount,receiveMailAccount, pds);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 4. 根据 Session 获取邮件传输对象
		Transport transport = null;
		try {
			transport = session.getTransport();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
		//
		// PS_01: 成败的判断关键在此一句, 如果连接服务器失败, 都会在控制台输出相应失败原因的 log,
		// 仔细查看失败原因, 有些邮箱服务器会返回错误码或查看错误类型的链接, 根据给出的错误
		// 类型到对应邮件服务器的帮助网站上查看具体失败原因。
		//
		// PS_02: 连接失败的原因通常为以下几点, 仔细检查代码:
		// (1) 邮箱没有开启 SMTP 服务;
		// (2) 邮箱密码错误, 例如某些邮箱开启了独立密码;
		// (3) 邮箱服务器要求必须要使用 SSL 安全连接;
		// (4) 请求过于频繁或其他原因, 被邮件服务器拒绝服务;
		// (5) 如果以上几点都确定无误, 到邮件服务器网站查找帮助。
		//
		// PS_03: 仔细看log, 认真看log, 看懂log, 错误原因都在log已说明。
		try {
			transport.connect(myEmailAccount, myEmailPassword);
		} catch (MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人,
		// 抄送人, 密送人
		try {
			transport.sendMessage(message, message.getAllRecipients());
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 7. 关闭连接
		try {
			transport.close();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Exception {
		// 1. 创建参数配置, 用于连接邮件服务器的参数配置
		Properties props = new Properties(); // 参数配置
		props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
		props.setProperty("mail.smtp.host", myEmailSMTPHost); // 发件人的邮箱的 SMTP
																// 服务器地址
		props.setProperty("mail.smtp.auth", "true"); // 需要请求认证

		// PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
		// 如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
		// 打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。

		// SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
		// 需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
		// QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
		final String smtpPort = "465";
		props.setProperty("mail.smtp.port", smtpPort);
		props.setProperty("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.socketFactory.port", smtpPort);

		// 2. 根据配置创建会话对象, 用于和邮件服务器交互
		Session session = Session.getDefaultInstance(props);
		session.setDebug(true); // 设置为debug模式, 可以查看详细的发送 log

		// 3. 创建一封邮件
		/*
		 * MimeMessage message = createMimeMessage(session, myEmailAccount,
		 * receiveMailAccount,SAK);
		 */

		// 4. 根据 Session 获取邮件传输对象
		Transport transport = session.getTransport();

		// 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
		//
		// PS_01: 成败的判断关键在此一句, 如果连接服务器失败, 都会在控制台输出相应失败原因的 log,
		// 仔细查看失败原因, 有些邮箱服务器会返回错误码或查看错误类型的链接, 根据给出的错误
		// 类型到对应邮件服务器的帮助网站上查看具体失败原因。
		//
		// PS_02: 连接失败的原因通常为以下几点, 仔细检查代码:
		// (1) 邮箱没有开启 SMTP 服务;
		// (2) 邮箱密码错误, 例如某些邮箱开启了独立密码;
		// (3) 邮箱服务器要求必须要使用 SSL 安全连接;
		// (4) 请求过于频繁或其他原因, 被邮件服务器拒绝服务;
		// (5) 如果以上几点都确定无误, 到邮件服务器网站查找帮助。
		//
		// PS_03: 仔细看log, 认真看log, 看懂log, 错误原因都在log已说明。
		transport.connect(myEmailAccount, myEmailPassword);

		// 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人,
		// 抄送人, 密送人
		/* transport.sendMessage(message, message.getAllRecipients()); */

		// 7. 关闭连接
		transport.close();
	}

	/**
	 * 创建一封发送供应商问题通知邮件
	 *
	 * @param session
	 *            和服务器交互的会话
	 * @param sendMail
	 *            发件人邮箱
	 * @param receiveMail
	 *            收件人邮箱
	 * @return
	 * @throws Exception
	 */
	public static MimeMessage createMimeMessage(Session session,
			String sendMail, String receiveMail,PageData pds) throws Exception {
		// 1. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 2. From: 发件人
		message.setFrom(new InternetAddress(sendMail, "朱", "UTF-8"));

		// 3. To: 收件人（可以增加多个收件人、抄送、密送）
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(
				receiveMail, "您好", "UTF-8"));

		// 4. Subject: 邮件主题
		message.setSubject("睿博光电不良问题反馈", "UTF-8");
		
		// 5. Content: 邮件正文（可以使用html标签）
		StringBuilder sbd = new StringBuilder();
		/*sbd.append( "请点击以下链接找回您的密码。(十分钟内有效)<br/>");
		sbd.append("<font style='color:red;font-size:20px;'><a style='color:red;' href='"+baseUrl+"/pc/findlink.html?ASK="+ ASK +"&&UCODE="+UCODE+"' target='_blank'");
		sbd.append(">"+baseUrl+"/pc/findlink.html?WEIKE="+ ASK +"&&XxxY="+UCODE+"==<br/>点击重置密码</a></font><br/>");
		sbd.append("这是一封来自未客网重置密码的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。");*/
		sbd.append("<!DOCTYPE html>\n"
				+"<html>\n"
				+"	<head>\n"
				+"		<meta charset=\"UTF-8\">\n"
				+"		<title>问题反馈</title>\n"
				+"	</head>\n"
				+"	<body>\n"
				+"		<div style=\"color: #666666;\">\n"
				+"			<div style=\"font-size: 20px;height: 40px;line-height: 40px;\">基本信息</div>\n"
				+"			<ul style=\"list-style: none;padding-left: 0px;overflow: hidden;\">\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>申请人：</span><span>"+resulkon(pds.getString("SENNAME"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>录入日期：</span><span>"+resulkon(pds.get("BILLDATE").toString())+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>跟踪号：</span><span>"+resulkon(pds.getString("TRACKINGNUMBER"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>零件编码：</span><span>"+resulkon(pds.getString("MACODE"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>零件名称：</span><span>"+resulkon(pds.getString("MANAME"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>供应商名称：</span><span>"+resulkon(pds.getString("NAME"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>到货日期：</span><span>"+resulkon(pds.get("DAOHUODATE").toString())+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>批次号：</span><span>"+resulkon(pds.getString("BATCHNUMBER"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>抽样数量：</span><span>"+resulkon(pds.getString("SANPLI"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>失效模式：</span><span>"+resulkon(pds.getString("FAILURENAME"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>缺陷数量：</span><span>"+resulkon(pds.getString("DEFECTSNUMBER"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>发生日期：</span><span>"+resulkon(pds.get("OCCURENTDATE").toString())+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>责任人：</span><span>"+resulkon(pds.getString("USERNAME"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>缺陷症状描述：</span><span>"+resulkon(pds.getString("DEFECTDESCRIP"))+"</span></li>\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 25%;\"><span>备注：</span><span>"+resulkon(pds.getString("REMARK"))+"</span></li>\n"
				+"			</ul>\n"

				+"			<div style=\"height: 30px;line-height: 30px;\"><span>是否需要8D：</span><span>是</span></div>\n"
				+"			<div style=\"height: 30px;line-height: 30px;\"><span>要求回复日期：</span><span>2017-02-22</span></div>\n"
				+"		</div>\n"
				+"	</body>\n"
				+"</html>");
		
		
		message.setContent(sbd.toString(),"text/html;charset=UTF-8");

	
		
		
		
		// 6. 设置发件时间
		message.setSentDate(new Date());

		// 7. 保存设置
		message.saveChanges();

		return message;
	}
	
	/**
	 * 创建一封已超期/即将超期的简单邮件
	 *
	 * @param session
	 *            和服务器交互的会话
	 * @param sendMail
	 *            发件人邮箱
	 * @param receiveMail
	 *            收件人邮箱
	 * @return
	 * @throws Exception
	 */
	public static MimeMessage createTimeMessage(Session session,
			String sendMail, String receiveMail,PageData pds) throws Exception {
		// 1. 创建一封邮件
		MimeMessage message = new MimeMessage(session);

		// 2. From: 发件人
		message.setFrom(new InternetAddress(sendMail, "睿博光电股份有限公司", "UTF-8"));

		// 3. To: 收件人（可以增加多个收件人、抄送、密送）
		message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(
				receiveMail, "您好", "UTF-8"));

		// 4. Subject: 邮件主题
		message.setSubject("睿博光电质量管理系统待办注意", "UTF-8");
		
		// 5. Content: 邮件正文（可以使用html标签）
		StringBuilder sbd = new StringBuilder();
		/*sbd.append( "请点击以下链接找回您的密码。(十分钟内有效)<br/>");
		sbd.append("<font style='color:red;font-size:20px;'><a style='color:red;' href='"+baseUrl+"/pc/findlink.html?ASK="+ ASK +"&&UCODE="+UCODE+"' target='_blank'");
		sbd.append(">"+baseUrl+"/pc/findlink.html?WEIKE="+ ASK +"&&XxxY="+UCODE+"==<br/>点击重置密码</a></font><br/>");
		sbd.append("这是一封来自未客网重置密码的邮件；如果您并未要求但收到这封信件，您不需要进行任何操作。");*/
		sbd.append("<!DOCTYPE html>\n"
				+"<html>\n"
				+"	<head>\n"
				+"		<meta charset=\"UTF-8\">\n"
				+"		<title>即将超期/超期处理提醒</title>\n"
				+"	</head>\n"
				+"	<body>\n"
				+"		<div style=\"color: #666666;\">\n"
				+"			<div style=\"font-size: 20px;height: 40px;line-height: 40px;\">"+pds.getString("TITLE")+"</div>\n"
				+"			<ul style=\"list-style: none;padding-left: 0px;overflow: hidden;\">\n"
				+"				<li style=\"float: left;line-height: 25px;padding: 5px 0px;width: 80%;\"><span>您好：</span><span>睿博光电质量管理系统提醒您，此问题"+pds.getString("SHIJIT")+"未处理，请及时处理</span></li>\n"
				
				+"			</ul>\n"

				+"			<div style=\"height: 30px;line-height: 30px;\"><span></span><span></span></div>\n"
				+"			<div style=\"height: 30px;line-height: 30px;\"><span></span><span></span></div>\n"
				+"		</div>\n"
				+"	</body>\n"
				+"</html>");
		
		
		message.setContent(sbd.toString(),"text/html;charset=UTF-8");

	
		
		
		
		// 6. 设置发件时间
		message.setSentDate(new Date());

		// 7. 保存设置
		message.saveChanges();

		return message;
	}
	
public static String resulkon(String NAMES){
	if(NAMES == null || NAMES.length() == 0){
		NAMES="";	
	}
	return NAMES;
}
public Boolean checkEmail(String email){
	Boolean flag;
	final String pattern1 = "\\w+@\\w+(\\.\\w+)+"; 
	/* final Pattern pattern = Pattern.compile(pattern1); 
    final Matcher mat = pattern.matcher(email); */
    if (email.matches(pattern1)) { 
    	flag =true;
    } else {
    	flag =false;
	}
	return flag;
}
}