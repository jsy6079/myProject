package com.green.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="usertbl")
@Getter
@Setter
public class User {
	
	@Id
	@Column(name="id", nullable = false)
	private String id;
	
	@Column(name="password", nullable = false)
	private String password;
	
	@Column(name="role", nullable = false)
	private String role = "Role_User";
	
	@Column(name="joindate", nullable = false)
	private Date joindate;
	
	
    @PrePersist
    protected void onCreate() {
        this.joindate = new Date();
    }
}
