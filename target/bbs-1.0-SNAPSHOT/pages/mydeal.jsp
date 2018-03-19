<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*,javax.activation.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String messageText = request.getParameter("content");
		String password = request.getParameter("pass");
		
		// 生成SMTP主机名称
		int n = from.indexOf('@');
		int m = from.length();
		String mailserver = "smtp." + from.substring(n + 1, m);
		
		// 建立邮件会话
		Properties pro = new Properties();
		pro.put("mail.smtp.host", mailserver);
		pro.put("mail.smtp.auth", true);
		Session sess = Session.getDefaultInstance(pro);
		sess.setDebug(true);
		
		// 新建一个消息对象
		MimeMessage Message = new MimeMessage(sess);
		// 设置发件人
		InternetAddress from_mail = new InternetAddress(from);
		Message.setFrom(from_mail);
		// 设置收件人
		InternetAddress to_mail = new InternetAddress(to);
		Message.setRecipient(Message.RecipientType.TO, to_mail);
		// 设置主题和内容及发送时间
		Message.setSubject(subject);
		//Message.setText(messageText);
		Message.setText(messageText, "utf-8");
		Message.setSentDate(new Date());
		// 发送邮件
		Message.saveChanges(); // 保证报头域同会话内容保持一致
		
		Transport trans = sess.getTransport("smtp");
		trans.connect(mailserver, from, password);
		trans.sendMessage(Message, Message.getAllRecipients());
		trans.close();
		
		out.println("<script language='javascript'>alert('邮件已发送！');windows.location.href='sendmail.jsp';</script>");
	}catch(Exception e){
		System.out.println("发送邮件产生的错误！" + e.getMessage());
		out.println("<script language='javascript'>alert('邮件发送失败！');windows.location.href='sendmail.jsp';</script>");
	}
%>
<a href="sendmail.jsp" onclick="history.back()">发送成功，返回输入验证码</a>
</body>
</html>