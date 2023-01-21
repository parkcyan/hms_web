package com.groupc.hms;

import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;

import admin.AdminService;
import admin.AdminServiceImpl;

@Controller
public class AdminController {
	@Autowired private AdminServiceImpl service;
	
	//환자목록조회
	@RequestMapping(value = "/patient.ad", method = RequestMethod.GET)
	public String patient_list(Model model) {
		model.addAttribute("list", service.patient_list());
		
		return "admin/patient_list";
	}
	
	  @RequestMapping(value = "/push.ad", method = RequestMethod.GET)
	   public void home(HttpServletRequest request) {
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
	                  .setToken("c9ZD6e9RTVKYG_lUrupFzC:APA91bFUYb7isz4jLYF24TXAAgFqM6oNsb4RjdNplHKI3IjbhiWFx3Ujt9LnKIjQCQmKiK1D6rJ1uLeKt3om5VB1pQqUqNiqn6-RTBI6ehF097R3a5CsT6GWTNEssrdEQ8mBr2ui3-Om")
	                  .build();
	            
	            //메세지를 FirebaseMessaging에 보내기
	            String response = FirebaseMessaging.getInstance().send(msg);
	            //결과출력
	            System.out.println("Successfully: " + response);
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	         }

	         }
	
	
}
