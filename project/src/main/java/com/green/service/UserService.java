package com.green.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.entity.User;
import com.green.repository.UserRepository;

import org.springframework.transaction.annotation.Transactional;


@Service
public class UserService {
	
	@Autowired
	private UserRepository userrepository;
	
	 @Transactional
	 public User getsignin(User user) {
		 userrepository.save(user);
		 return user;
	 }
	 

}
