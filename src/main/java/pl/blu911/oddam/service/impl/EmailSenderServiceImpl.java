package pl.blu911.oddam.service.impl;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import pl.blu911.oddam.domain.User;
import pl.blu911.oddam.registration.ConfirmationToken;
import pl.blu911.oddam.service.EmailSenderService;

@Service
public class EmailSenderServiceImpl implements EmailSenderService {
    private final JavaMailSender javaMailSender;

    public EmailSenderServiceImpl(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void sendEmail(User user, ConfirmationToken confirmationToken) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getEmail());
        mailMessage.setSubject("Complete Registration!");
        mailMessage.setFrom("krys.blu@gmail.com");
        mailMessage.setText("To confirm your account, please click here : "
                + "http://localhost:8080/register/confirm-account?token=" + confirmationToken.getConfirmationToken());
        javaMailSender.send(mailMessage);
    }
}
