package com.onlineclass.sysadmin.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineclass.sysadmin.entity.AdminUser;
import com.onlineclass.sysadmin.helper.Helper;
import com.onlineclass.sysadmin.repository.AdminUserRepository;
import com.onlineclass.sysadmin.service.AdminUserService;

@Service
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	AdminUserRepository repo;

	public List<AdminUser> listAllUsers() {
		return (List<AdminUser>) repo.findAll();
//		return (List<AdminUser>) repo.getListUserInRange_2();
	}

	public List<AdminUser> getListUserInRange(int limit, int skip, String colnmSort, String sortType) {
		
		switch (colnmSort) {
		case "Name":
			return sortType.equals("asc") ? repo.getListUserByNameASC(limit, skip) : repo.getListUserByNameDESC(limit, skip);

		case "Email":
			return sortType.equals("asc") ? repo.getListUserByEmailASC(limit, skip) : repo.getListUserByEmailDESC(limit, skip);

		case "Status":
			return sortType.equals("asc") ? repo.getListUserByStatusASC(limit, skip) : repo.getListUserByStatusDESC(limit, skip);

		case "Notes":
			return sortType.equals("asc") ? repo.getListUserByNotesASC(limit, skip) : repo.getListUserByNotesDESC(limit, skip);

		case "CreatedAt":
			return sortType.equals("asc") ? repo.getListUserByCreatedAtASC(limit, skip) : repo.getListUserByCreatedAtDESC(limit, skip);

		case "UpdatedAt":
			return sortType.equals("asc") ? repo.getListUserByUpdatedAtASC(limit, skip) : repo.getListUserByUpdatedAtDESC(limit, skip);

		default:
			return sortType.equals("asc") ? repo.getListUserInRange_2(limit, skip) : repo.getListUserInRange_2(limit, skip);
		}
		
	}

	@Override
	public int totalUserInDB() {
		return (int) repo.count();
	}

	@Override
	public void saveNewUser(AdminUser adminUser) {
		java.util.Date date= new java.util.Date();
		adminUser.setCreatedAt(new Timestamp(date.getTime()));
		adminUser.setUpdatedAt(new Timestamp(date.getTime()));
		adminUser.setPassword(adminUser.getPassword() == "" ? null : Helper.encryptPassword(adminUser.getPassword()));
		repo.save(adminUser);
	}

	@Override
	public void updateUser(AdminUser adminUser) {
		String updatedAt = (new Timestamp(new java.util.Date().getTime())).toString();
		adminUser.setPassword(Helper.encryptPassword(adminUser.getPassword()));
		repo.updateUserName(adminUser.getID(), adminUser.getName(), 
				adminUser.getPassword(), adminUser.getAgentID(), 
				adminUser.getStatusCD(), adminUser.getNotes(), updatedAt);
	}

	@Override
	public void deleteUser(AdminUser adminUser) {
		java.util.Date date= new java.util.Date();
		repo.deleteUser(adminUser.getID(), (new Timestamp(date.getTime())).toString());
	}

	@Override
	public AdminUser getUserByID(Integer userID) {
		Optional<AdminUser> result = repo.findById(userID);
		return result.get();

	}

	@Override
	public int totalUserNotDeleteInDB() {		
		return repo.totalUserNotDeleteInDB();
	}
	
	public boolean isEmailExist(String email) {
		// Return true if Email exist
		return repo.getUserByEmail(email) != null ? true : false;
	}

}