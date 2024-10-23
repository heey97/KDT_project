package util;

import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class mailService {
    
	/**
	 * SendMail
	 */
	public static void sendMail(String pw, String email) {
	  // 메일 인코딩
	  final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
	  
	  String subject = "임시비밀번호 발송";
	  String fromEmail = email;
	  String fromUsername = "호박마켓";
	  String toEmail = email;
	  
	  final String username = "twk0223@gmail.com";         
	  final String password = "hbwtfktkcvajwlly";
	  
	  // 메일에 출력할 텍스트
	  StringBuffer sb = new StringBuffer();
	  sb.append("<h3>안녕하세요. 호박마켓입니다.</h3>\n");
	  sb.append("<h4> 임시 비밀번호:"+ pw +"</h4>\n");    
	  String html = sb.toString();
	  
	  // 메일 옵션 설정
	  Properties props = new Properties();    
	  props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
	  props.put("mail.transport.protocol", "smtp");
	  props.put("mail.smtp.host", "smtp.gmail.com");
	  props.put("mail.smtp.port", "587");
	  props.put("mail.smtp.auth", "true");
	  props.put("mail.smtp.starttls.enable", "true");
	
	  props.put("mail.smtp.quitwait", "false");
	  
	  try {
		    // 메일 서버 인증 계정 설정
		    Authenticator auth = new Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(username, password);
		        }
		    };

		    // 메일 세션 생성
		    Session session = Session.getInstance(props, auth);

		    // 메일 송/수신 옵션 설정
		    Message message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(fromEmail, fromUsername));
		    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		    message.setSubject(subject);
		    message.setSentDate(new Date());

		    // 메일 콘텐츠 설정
		    Multipart mParts = new MimeMultipart();
		    MimeBodyPart mTextPart = new MimeBodyPart();

		    // 메일 콘텐츠 - 내용
		    mTextPart.setText(html, bodyEncoding, "html");
		    mParts.addBodyPart(mTextPart);

		    // 메일 콘텐츠 설정
		    message.setContent(mParts);

		    // MIME 타입 설정
		    MailcapCommandMap mailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		    mailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		    mailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		    mailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		    mailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		    mailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		    CommandMap.setDefaultCommandMap(mailcapCmdMap);

		    // 메일 발송
		    Transport.send(message);
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}

}
