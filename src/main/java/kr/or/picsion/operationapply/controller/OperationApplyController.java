package kr.or.picsion.operationapply.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.picsion.board.dto.Board;
import kr.or.picsion.comment.dto.Comment;
import kr.or.picsion.notice.service.NoticeService;
import kr.or.picsion.operationapply.dto.OperationApply;
import kr.or.picsion.operationapply.service.OperationApplyService;
import kr.or.picsion.user.dto.User;

@Controller
@RequestMapping("")
public class OperationApplyController {

	@Autowired
	private View jsonview;

	@Autowired
	private  OperationApplyService applyService;
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "apply.ps")
	public String insertOperationApply(OperationApply operationApply, HttpSession session) {
		User user = (User)session.getAttribute("user");
		System.out.println("insertoperation 컨트롤러");
		operationApply.setOperUserNo(user.getUserNo());
		System.out.println(operationApply);
		int result = applyService.insertOperationApply(operationApply);
		System.out.println(operationApply);
		
		if(result == 1) {
			HashMap<String, Object> noticeMap = new HashMap<String, Object>();
			
			noticeMap.put("no", operationApply.getBrdNo());
			noticeMap.put("operApplyNo", operationApply.getOperApplyNo());
			noticeMap.put("receiveUserNo", operationApply.getOperUserNo());
			noticeMap.put("sendUserNo", operationApply.getRequestUserNo());
			noticeMap.put("table", "brdNo,operApplyNo");
			noticeMap.put("tableNo", 3);
			
			System.out.println("과아아앙아아아아아아앙아아아아아아아아여어어어어어어어어어어어어어언");
			System.out.println(noticeMap.values());			
			
			noticeService.insertNotice(noticeMap);
		}
		
		return "board.boardInfo";
	}
	/*
	@RequestMapping(value = "applylist.ps")
	public View OperationApplyList(OperationApply operationApply, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		System.out.println("OperationApplyList 컨트롤러");
		List<OperationApply> list = applyService.operationApplyList(operationApply);
		System.out.println(list);
		model.addAttribute("applylist", list);
		
		return jsonview;
	}*/
	
	
}
