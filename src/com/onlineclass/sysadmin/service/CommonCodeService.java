package com.onlineclass.sysadmin.service;

import java.util.List;

import com.onlineclass.sysadmin.entity.CommonCode;

public interface CommonCodeService {
	public List<CommonCode> getListCommonCode();
	
	public List<String> getListStatus();
}
