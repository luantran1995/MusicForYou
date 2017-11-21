package com.luantran.nashtech.musicstore.service;

import nashtech.luantran.musicstore.model.Users;

public interface UserService { 
	 void save(Users user);

	  Users findByUsername(String username);

}
