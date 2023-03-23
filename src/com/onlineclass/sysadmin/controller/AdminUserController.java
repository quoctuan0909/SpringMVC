package com.onlineclass.sysadmin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlineclass.sysadmin.entity.AdminUser;
import com.onlineclass.sysadmin.entity.AdminUser_CommonCode;
import com.onlineclass.sysadmin.entity.CommonCode;
import com.onlineclass.sysadmin.helper.Helper;
import com.onlineclass.sysadmin.service.AdminUserService;
import com.onlineclass.sysadmin.service.CommonCodeService;

@Controller
@RequestMapping("adminuser")
public class AdminUserController {

	@Autowired
	private AdminUserService adminUserService;
	
	@Autowired
	private CommonCodeService codeService;
	
	@RequestMapping(method = RequestMethod.GET)	
	public ModelAndView  adminUserListPage(@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "sort", required = false) String sort,@RequestParam(value = "col", required = false) String colnmSort) {
		ModelAndView mav = new ModelAndView("AdminUserView");
		
		page = page==null ?  "1" : page;
		
		colnmSort = colnmSort == null ? "ID" : colnmSort;
		
		sort = sort == null ? "asc" : (sort.equals("asc") ? "desc" : "asc");
		
		int itemPerPage = 20;
		int totalUser = adminUserService.totalUserNotDeleteInDB();
		int totalPage =(int) Math.ceil((float)totalUser/(float)itemPerPage);
		int skip = (Integer.parseInt(page) * itemPerPage)-itemPerPage;
		
		
		List<AdminUser> listUser = adminUserService.getListUserInRange(itemPerPage, skip, colnmSort, sort);
		List<CommonCode> listCommonCode = codeService.getListCommonCode();
		List<AdminUser_CommonCode> dataList = new ArrayList<AdminUser_CommonCode>();
		for(AdminUser user : listUser) {
			for(CommonCode commonCode : listCommonCode) {
				if(commonCode.getCodeValue() == user.getStatusCD()) {
					dataList.add(new AdminUser_CommonCode(user,commonCode.getCodeName()));
				}
			}
		}
		
		System.out.println("Curent Page: " + page);
		System.out.println("Curent SortType: " + sort);
		System.out.println(listUser);
		System.out.println("Total User: " + adminUserService.totalUserInDB());
		
		mav.addObject("listUser", dataList);
		mav.addObject("totalPage", totalPage);
		mav.addObject("currentPage",page);
		mav.addObject("sortType",sort);

		return mav;
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public ModelAndView editAdminUser(@RequestParam(value = "id", required =true)Integer ID) {
		ModelAndView mav =  new ModelAndView("UpdateAdminUserView");
		AdminUser adminuser = adminUserService.getUserByID(ID);
		adminuser.setPassword(Helper.decryptPassword(adminuser.getPassword()) == null ? adminuser.getPassword() : Helper.decryptPassword(adminuser.getPassword()));
		List<CommonCode> codes = codeService.getListCommonCode();

		mav.addObject("adminuser", adminuser);
		mav.addObject("statusList", codes);
		System.out.println(adminuser.getName());
		return mav;
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST, params = "update")
	public String updateAdminUser(@ModelAttribute("adminuser") AdminUser adminuser) {
//		adminUserService.updateUser(adminuser);
		return "redirect:/adminuser";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST, params = "delete")
	public String deleteAdminUser(@ModelAttribute("adminuser") AdminUser adminuser) {
		System.out.println("Hello you call the delee");
		System.out.println("UserID: " + adminuser.getID());
//		adminUserService.deleteUser(adminuser);
		return "redirect:/adminuser";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public ModelAndView addNewAdminUser(@ModelAttribute("adminuser") AdminUser adminuser, RedirectAttributes redirectAttributes) {
		 ModelAndView mv_Success = new ModelAndView("redirect:/adminuser");
		 ModelAndView mv_Error = new ModelAndView("redirect:/adminuser/new");
		 System.out.println("Email: " + adminuser.getEmail());
		String error = null;
		if(adminuser.getName().equals("")) {
			error = "Please_input_name";
		}else if(adminUserService.isEmailExist(adminuser.getEmail())) {
			error = "Email_already_existed";
		}else if(!Helper.isEmailValidateRFC5322(adminuser.getEmail())) {
			error = "Email_not_validate";
		}
		
		if(error != null) {
			// If have Error
			redirectAttributes.addAttribute("error",error);
			return mv_Error;
		}
		
		
//		adminUserService.saveNewUser(adminuser);
		return mv_Success;
	}
	
			
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String newAdminUserPage(Map<String, Object> model) {
		List<CommonCode> codes = codeService.getListCommonCode();
		model.put("adminuser", new AdminUser());	
		model.put("statusList", codes);
		return "NewAdminUserView";
	}
	
	
}
