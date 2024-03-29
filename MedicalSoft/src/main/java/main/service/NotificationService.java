package main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import main.entities.Notification;

@Service
public class NotificationService {
	  @Autowired
	  private SimpMessagingTemplate messagingTemplate;

	  public void notify(Notification notification, String username) {
	    messagingTemplate.convertAndSendToUser(
	      username, 
	      "/queue/notify", 
	      notification
	    );
	    return;
	  }
}
