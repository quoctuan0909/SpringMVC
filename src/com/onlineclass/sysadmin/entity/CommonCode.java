package com.onlineclass.sysadmin.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "commoncode", schema = "online_class")
@Entity
public class CommonCode {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private int ID;
	
	@Column(name = "ParentID")
	private Integer parentID;
	
	@Column(name = "ColumnFullName")
	private String columnFullName;
	
	@Column(name = "Name")
	private String codeName;
	
	@Column(name = "FullName")
	private String codeFullName;
	
	@Column(name = "Value")
	private int codeValue;
	
	
	@Column(name = "TextValue")
	private String textValue;
	
	@Column(name = "Title")
	private String codeTitle;
	
	@Column(name = "CssClass")
	private String cssClass;
	
	@Column(name = "Priority")
	private int priority;
	
	@Column(name = "Notes")
	private String codeNotes;
	
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

	public Integer getParentID() {
		return parentID;
	}

	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getCodeFullName() {
		return codeFullName;
	}

	public void setCodeFullName(String codeFullName) {
		this.codeFullName = codeFullName;
	}

	public int getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(int codeValue) {
		this.codeValue = codeValue;
	}

	public String getTextValue() {
		return textValue;
	}

	public void setTextValue(String textValue) {
		this.textValue = textValue;
	}

	public String getCodeTitle() {
		return codeTitle;
	}

	public void setCodeTitle(String codeTitle) {
		this.codeTitle = codeTitle;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getCodeNotes() {
		return codeNotes;
	}

	public void setCodeNotes(String codeNotes) {
		this.codeNotes = codeNotes;
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
	
	
	
}
