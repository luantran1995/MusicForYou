package com.luantran.nashtech.musicstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nashtech.luantran.musicstore.model.Users;
import nashtech.luantran.musicstore.repository.RoleRepository;
import nashtech.luantran.musicstore.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public void save(Users user) {
//        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
	}

	@Override
	public Users findByUsername(String username) {
        return userRepository.findByEmail(username);

	}

}
