package kr.or.picsion.operationapply.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.picsion.operationapply.dao.OperationApplyDao;
import kr.or.picsion.operationapply.dto.OperationApply;
import kr.or.picsion.picture.dto.Picture;
import kr.or.picsion.user.dao.UserDao;

@Service
public class OperationApplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public String operationStatus(int operStateNo){
		OperationApplyDao operationApplyDao = sqlSession.getMapper(OperationApplyDao.class);
		
		String operState = operationApplyDao.operationStatus(operStateNo);
		
		return operState;
	}
	//신청하기
	public int insertOperationApply(OperationApply operationApply){
		System.out.println("insertoperation 서비스");
		OperationApplyDao operationApplyDao = sqlSession.getMapper(OperationApplyDao.class);
		
		int check = operationApplyDao.insertOperationApply(operationApply);
		
		return check;
	}
}
