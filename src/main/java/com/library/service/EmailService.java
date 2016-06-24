package com.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * Created by Matexo on 2016-06-13.
 */
@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public static String host = "http://localhost:8080/shop/";
    public static String email = "matexo15@gmail.com";
    private StringBuilder sb;

    public void sendEmail(String to, String subject, String text)
    {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(to);
        email.setSubject(subject);
        email.setText(text);
        mailSender.send(email);
    }

    public String getConfirmationOfOrderText(String orderNumber , String totalCost)
    {
        sb = new StringBuilder();
        sb.append("Witaj!\n");
        sb.append("Twoje zamówienie o numerze" + orderNumber + "zostało przekazane do sklepu.\n");
        sb.append("W celu dalszej realizacji zamówienie należy wysłać wpłatę na nr konta: XXXX-XXXX-XXXX-XXXX-XXXX-XXXX\n");
        sb.append("W tytule przelewu zamieść swój numer zamówienia. Przyspieszy to weryfikację.\n");
        sb.append("Kwota, która należy wysłać to: " + totalCost + "\n");
        //sb.append(footer(orderNumber));
        return sb.toString();
    }

    public String getConfirmationOfOrderSubject(String orderNumber)
    {
        return "Zamówienie nr: " + orderNumber + " jest w trakcie realizacji.\n";
    }

    public String getConfirmationOfPaymentText(String orderNumber)
    {
        sb = new StringBuilder();
        sb.append("Witaj!\n");
        sb.append("Otrzymaliśmy twoją wpłatę.");
        sb.append("Wysyłka nastąpi w ciągu 24h od potwierdzenia wpłaty.\n");
        sb.append(footer(orderNumber));
        return sb.toString();
    }

    public String getConfirmationOfPaymentSubject()
    {
        return "Otrzymaliśmy twoją wpłatę";
    }


    public String getConfirmationOfSendingOrderText(String orderNumber , String shippingMethod , String shippingNumber)
    {
        sb = new StringBuilder();
        sb.append("Witaj!\n");
        sb.append("Twoja paczka została wysłana.\n");
        sb.append("Metoda wysyłki: " + shippingMethod  + " \nNumer przewozowy: " + shippingNumber + "\n");
        sb.append(footer(orderNumber));
        return sb.toString();
    }


    public String getConfirmationOfSendingSubject()
    {
        return "Twoja paczka jest już w drodze";
    }

    private String footer(String orderNumber)
    {
        StringBuilder sb = new StringBuilder();
        sb.append("Wszystkie dodatkowe dane o twoim zamówienie znajdują się pod adresem:  " + host + "/checkOrder?orderNumber=" + orderNumber + " \n");
        sb.append("W razię jakiś pytań proszę pisać na podany email: " + email + "\n");
        sb.append("Dziękujemy za zakup i zapraszamy ponownie.\n");
        return sb.toString();
    }

    public String getActivationMessage(String token)
    {
        StringBuilder sb = new StringBuilder();
        sb.append("Link aktywujacy konto: " + host + "user/activate/" + token);
        return sb.toString();
    }

}