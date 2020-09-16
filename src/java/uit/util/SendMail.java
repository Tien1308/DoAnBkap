package uit.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public static boolean sendMail(String to, String subject, String text) {
//		final String email = "bintkltt@gmail.com";
//		final String password = "Chelsea20041998";
//		Properties props = new Properties();
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
//		props.put("mail.smtp.port", "587");
//		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
//			@Override
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(email, password);
//			}
//		});
//		try {
//			Message message = new MimeMessage(session);
//			message.setHeader("Content-Type", "text/plain ; charset=UTF-8");
//			message.setFrom(new InternetAddress(email));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//			message.setSubject(subject);
//			message.setText(text);
//			Transport.send(message);
//			System.out.println("Gửi Mail Thành Công");
//		} catch (MessagingException e) {
//			// throw new RuntimeException(e);
//			e.printStackTrace();
//			System.out.println("Gửi Mail Thất Bại");
//			return false;
//		}
		return true;

	}

	public static void main(String[] arg) {
		//System.out.println(sendMail("hieudth01@gmail.com", "HTT Mobile", "Hello, Hieu Boy"));
	}
}
