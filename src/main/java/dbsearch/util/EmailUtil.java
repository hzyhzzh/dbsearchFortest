package dbsearch.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ContextLoader;

import dbsearch.domain.User;

public class EmailUtil {
	private static String smtpHost;
	private static String smtpPort;
	private static String smtpFrom;
	private static String smtpPassword;

	static {
		Properties prop = (Properties) ContextLoader.getCurrentWebApplicationContext().getBean("appConfig");
		smtpHost = prop.getProperty("mail.smtp.host");
		smtpPort = prop.getProperty("mail.smtp.port");
		smtpFrom = prop.getProperty("mail.from");
		smtpPassword = prop.getProperty("mail.password");
	}

	/**
	 * ע��ɹ���,���û������ʻ��������ӵ��ʼ�
	 * 
	 * @param user
	 *            δ������û�
	 */
	public static void sendAccountActivateEmail(User user) {
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("帐户激活邮件");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(smtpFrom));
			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			message.setContent("<a href='" + GenerateLinkUtil.generateActivateLink(user) + "'>点击激活帐户</a>",
					"text/html;charset=utf-8");
			// �����ʼ�
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ���������������ӵ��ʼ�
	 */
	public static void sendResetPasswordEmail(User user, String urlPrefix) {
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("找回您的帐户与密码");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(smtpFrom));
			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));

			message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + urlPrefix
					+ GenerateLinkUtil.generateResetLinkPath(user) + "'>点击重新设置密码</a>", "text/html;charset=utf-8");
			// �����ʼ�
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Session getSession() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", smtpHost);
		props.setProperty("mail.smtp.port", smtpPort);
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpFrom, smtpPassword);
			}

		});
		return session;
	}

}
