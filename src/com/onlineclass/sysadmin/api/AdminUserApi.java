package com.onlineclass.sysadmin.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.onlineclass.sysadmin.entity.AdminUser;
import com.onlineclass.sysadmin.service.AdminUserService;

//khai bao de nhan biet restful api
@RestController(value = "API")
public class AdminUserApi {
	
	@Autowired AdminUserService adminUserService;
	
//	restful api
	// du lieu 
	//rest (get, post, put , delete)
	//crud read, create, update, delete
		
	
	//
	@GetMapping(value = "/api/v1/user_list") 
	 public ResponseEntity<List<AdminUser>> getAdminUsers(){
		 List<AdminUser> adminUsers =adminUserService.listAllUsers();
		 return ResponseEntity.ok(adminUsers);
	 }
	
	@PostMapping("/api/v1/user")
	 public ResponseEntity<?> saveAdminUser(@RequestBody AdminUser adminUser){	//nhan du lieu tu view 
		 adminUserService.saveNewUser(adminUser); // tu du lieu tren luu du lieu vao data
		 System.out.println(adminUser);
		 return ResponseEntity.ok().body("CREATED");
	}
	
	@PutMapping("/api/v1/user/{id}")
	 public ResponseEntity<?> updateAdminUser(@PathVariable("id") Integer id, @RequestBody AdminUser adminUser){// nhan du lieu tu view
		 adminUser.setID(id);
		 adminUserService.updateUser(adminUser); //nhan du lieu xong update len data
		 System.out.println(adminUser);
		 return ResponseEntity.ok().body("UPDATED");
	 }
	
	@DeleteMapping("/api/v1/user/{id}")
	 public ResponseEntity<?> deleteAdminUser(@PathVariable("id") Integer id){
		 try {
			 System.out.println(id);
			 AdminUser adminUser =adminUserService.getUserByID(id);
			 adminUserService.deleteUser(adminUser);
			 System.out.println(adminUser);
			 return ResponseEntity.ok().body("DELETED");
		} catch (Exception e) {
			System.out.println(e.toString());
			return null;
		}
		 
	 }

}
