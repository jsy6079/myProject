package com.green.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.green.entity.User;

public interface UserRepository extends JpaRepository<User, String> {

}
