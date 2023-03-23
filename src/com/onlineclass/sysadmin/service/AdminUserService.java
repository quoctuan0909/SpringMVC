package com.onlineclass.sysadmin.service;

import java.util.List;

import com.onlineclass.sysadmin.entity.AdminUser;

public interface AdminUserService {

	public List<AdminUser> listAllUsers();

	public List<AdminUser> getListUserInRange(int limit, int skip, String colnmSort, String sortType);
	
	public int totalUserInDB();
	
	public int totalUserNotDeleteInDB();
	
	public void saveNewUser(AdminUser adminUser);

	public void updateUser(AdminUser adminUser);
	
	public void deleteUser(AdminUser adminUser);
	
	public AdminUser getUserByID(Integer userID);
	
	public boolean isEmailExist(String email);
}
