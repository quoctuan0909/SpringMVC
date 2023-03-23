package com.onlineclass.sysadmin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onlineclass.sysadmin.entity.CommonCode;
import com.onlineclass.sysadmin.repository.CommonCodeRepository;
import com.onlineclass.sysadmin.service.CommonCodeService;

@Service
@Transactional
public class CommonCodeServiceImpl implements CommonCodeService {
	
	@Autowired
	CommonCodeRepository codeRepository;
	
	@Override
	public List<CommonCode> getListCommonCode() {
		return (List<CommonCode>) codeRepository.findAll();
	}

	@Override
	public List<String> getListStatus() {
		List<CommonCode> comList = (List<CommonCode>) codeRepository.findAll();
		List<String> result = new ArrayList<String>();
		for(CommonCode c : comList) {
			result.add(c.getCodeName());
		}
		return result;
	}

}
