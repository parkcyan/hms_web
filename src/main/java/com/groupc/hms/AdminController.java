package com.groupc.hms;

import java.io.FileInputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.FileInputStream;
import java.net.http.HttpRequest;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;



@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);

	
  @RequestMapping(value = "/push.ad", method = RequestMethod.GET)
   public String home(HttpServletRequest request) {
        try {
           
           
           
            FileInputStream refreshToken = 
                  new FileInputStream("D:\\serviceAccountKey.json");
            
            FirebaseOptions options = FirebaseOptions.builder()
                   .setCredentials(GoogleCredentials.fromStream(refreshToken))
                   .build();
            
            //Firebase 처음 호출시에만 initializing 처리
            if(FirebaseApp.getApps().isEmpty()) {
               FirebaseApp.initializeApp(options);
            }
            
            //메세지 작성
            Notification noti = Notification.builder().setTitle("efg").setBody("abcd").build();
            Message msg = Message.builder()
                  .putData("title", "aaa")
                  .putData("name", "aaa")
                  .putData("body", "aaa")
                  .putData("color", "#f45342")
                  .setNotification(noti)
                  .setToken("eGyKY9KTRtuNukCTMZ74l5:APA91bEvuCAj-7C_eFD4iwrewV1CgGQepXn3_InrA1q24DXznw_9LHlfBxgIgc6qrjErZZBC4Is2WftrWTWIIERHhR9v5IUVWahz5XGHUwYahE8Atmdwhf83Xoa-8u16kGvGtY397wux")
                  .build();
            
            //메세지를 FirebaseMessaging에 보내기
            String response = FirebaseMessaging.getInstance().send(msg);
            //결과출력
            System.out.println("Successfully: " + response);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         return "admin/index";
         }
	
	
	
	@RequestMapping(value = "/qr.ad")
	public String qr() {
	
		return "admin/qr/qr";
	}
	
	
	
}
