package com.luantran.nashtech.musicstore.service;

public interface SecurityService {
	 String findLoggedInEmail();
	 void autologin(String username, String password);
}
