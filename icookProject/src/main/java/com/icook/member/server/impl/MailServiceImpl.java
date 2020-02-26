package com.icook.member.server.impl;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.icook.member.server.mailService;
import com.icook.model.ProductOrder;

@Service("mailService")
public class MailServiceImpl implements mailService{

	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public void sendEmail(Object object) {
		ProductOrder order = (ProductOrder) object;
        MimeMessagePreparator preparator = getMessagePreparator(order);
 
        try {
            mailSender.send(preparator);
            System.out.println("Message Send...Hurrey");
        } catch (MailException ex) {
            System.err.println(ex.getMessage());
        }
	}

	private MimeMessagePreparator getMessagePreparator(final ProductOrder order) {
		 
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
 
            public void prepare(MimeMessage mimeMessage) throws Exception {
            	InternetAddress test = new InternetAddress("chang123456@gmail.com");
                mimeMessage.setFrom(test);
                mimeMessage.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(order.getCustomerInfo().getEmail()));
                if(order.getProductName() == "forgetPassword") {
                	mimeMessage.setText("Dear " + order.getCustomerInfo().getName()
                            + ", 請點擊以下網址修改你的密碼 " + "http://localhost:8080/icookProjectSpringMVC200203/signUp/updatePassword/"+ order.getStatus());
                }
                else {
                	mimeMessage.setText("Dear " + order.getCustomerInfo().getName()
                            + ", 您的帳號已註冊成功  請點擊以下網址" + "http://localhost:8080/icookProjectSpringMVC200203/memberCheck?userId="+ order.getStatus());
                }
                mimeMessage.setSubject("Your order on Demoapp");
            }
        };
        return preparator;
    }
}
