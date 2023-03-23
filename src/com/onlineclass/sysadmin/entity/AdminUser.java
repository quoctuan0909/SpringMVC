package com.onlineclass.sysadmin.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name = "adminuser", schema = "online_class")
@Entity
public class AdminUser {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private int ID;
	
	@Column(name="Name")
	private String name;
	
	@Column(name = "Email")
	private String email;
	
	@Column(name = "Password")
	private String password;
	
	@Column(name = "AgentID")
	private String agentID;
	
	@Column(name = "StatusCD")
	private int statusCD;
	
	@Column(name = "Notes")
	private String notes;
	
	@Column(name = "CreatedAt")
	private Timestamp createdAt;
	
	@Column(name = "UpdatedAt")
	private Timestamp updatedAt;
	
	@Column(name = "DeletedAt")
	private Timestamp deletedAt;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAgentID() {
		return agentID;
	}

	public void setAgentID(String agentID) {
		this.agentID = agentID;
	}

	public int getStatusCD() {
		return statusCD;
	}

	public void setStatusCD(int statusCD) {
		this.statusCD = statusCD;
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

	@Override
	public String toString() {
		return "AdminUser [ID=" + ID + ", name=" + name + ", email=" + email + ", password=" + password + ", agentID="
				+ agentID + ", statusCD=" + statusCD + ", notes=" + notes + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", deletedAt=" + deletedAt + "]";
	}
	
	
	
}
