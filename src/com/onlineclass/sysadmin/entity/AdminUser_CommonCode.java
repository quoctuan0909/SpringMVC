package com.onlineclass.sysadmin.entity;

import java.sql.Timestamp;

public class AdminUser_CommonCode {
	private int ID;
	private String name;
	private String email;
	private int statusCode;
	private String status;
	private String notes;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	
	public AdminUser_CommonCode(AdminUser adminUser, String status) {
		this.ID = adminUser.getID();
		this.name = adminUser.getName();
		this.email = adminUser.getEmail();
		this.statusCode = adminUser.getStatusCD();
		this.status = status;
		this.notes = adminUser.getNotes();
		this.createdAt = adminUser.getCreatedAt();
		this.updatedAt = adminUser.getUpdatedAt();
		this.deletedAt = adminUser.getDeletedAt();
		
	}
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Timestamp getDeletedAt() {
		return deletedAt;
	}

	public void setDeletedAt(Timestamp deletedAt) {
		this.deletedAt = deletedAt;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	
	
	
}
