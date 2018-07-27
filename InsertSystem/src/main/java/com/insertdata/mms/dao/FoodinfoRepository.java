package com.insertdata.mms.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.insertdata.mms.dto.Foodinfo;

@Repository
public class FoodinfoRepository {
	
	@Autowired
	SqlSession session;
	
	public int insert(Foodinfo foodinfo) {
		FoodinfoMapper mapper = session.getMapper(FoodinfoMapper.class);
		int result = mapper.insert(foodinfo);
		
		return result;
	}
	
}
