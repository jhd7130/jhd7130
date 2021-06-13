package com.spring.sample.web.practice.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sample.common.bean.PagingBean;
import com.spring.sample.common.service.IPagingService;
import com.spring.sample.web.practice.service.IPracticeLService;

@Controller
public class practiceLController {
	
	@Autowired
	public IPracticeLService iPracticeLService;
	
	@Autowired
	public IPagingService IPagingService;

	@RequestMapping(value="/practiceLogin")
	public ModelAndView practiceLogins(ModelAndView mav) {
		
		
		mav.setViewName("practice/practiceLogin");
		
		return mav;
	}
	
	
	// 로그인 정보를 받아서 체크하고 true라면 값을 저장해서 들고 다녀야한다.
	//따라서 session이 필요하다.(session은 매개변수에서 선언한다. 이유는 request에 포함된 메서드이기 때문이다.
	@RequestMapping(value="/practiceLogins")
	public ModelAndView practiceLogins(ModelAndView mav, HttpSession session,
										@RequestParam HashMap<String,String> params) throws Throwable{
		// 우선 아이디와 비밀번호가 맞는지 체크가 필요 sql에서 해서 가져올 예정
		
		HashMap<String, String> data
				= iPracticeLService.getM(params);
		
		if(data != null) {
			session.setAttribute("sMNo", data.get("M_NO"));
			session.setAttribute("sMNm", data.get("M_NM"));
			mav.addObject("res", "success");
		} else {
			mav.addObject("res", "failed");
		}
		
		mav.setViewName("practice/practiceLogins");
		return mav;
	}
	
	@RequestMapping(value="practiceO")
	public ModelAndView practiceO(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {
		//목록을 다 가져오는데 내가 작성한 목록은 수정 또는 삭제할 수 있게 변경해주어야한다.
		
		int page = 1;
		
		// 현재 페이지 체크
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		//총게시글 수
		int cnt = iPracticeLService.getObCnt(params);
		
		PagingBean pb = IPagingService.getPagingBean(page, cnt);
		
		params.put("startCnt",Integer.toString(pb.getStartCount()));
		params.put("endCnt",Integer.toString(pb.getEndCount()));
		
		
		List<HashMap<String,String>> list =
					iPracticeLService.getObList(params);
		
		mav.addObject("list", list);
		mav.addObject("pb", pb);
		mav.addObject("page", page);
		
		mav.setViewName("practice/practiceO");
		return mav;
	}
	
	@RequestMapping(value="practiceLogout")
	public ModelAndView practiceLogout(ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("redirect:practiceLogin"); // don't have space with sentence
		return mav;
	}
}
