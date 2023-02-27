package kr.or.project.board.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.project.main.model.CmgRegstr;
import kr.or.project.main.model.NoticeInfo;
import kr.or.project.main.service.MainService;

@Controller 
public class BoardActionController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardActionController.class);
	
	@Autowired //interface랑 연결 (상속받은 mainserviceimp 로 연결됨)
	MainService mainService;

	@RequestMapping(value ="/board")
	public ModelAndView board(HttpSession session, Locale locale, Model model) throws Exception{
		
		System.out.println("출입대장 페이지입니다.");
		
		List<CmgRegstr> mainResult = new ArrayList<CmgRegstr>();
		
		ModelAndView mv = new ModelAndView();
		
//		for(int i = 1; i <= 100; i++) {
//			CmgRegstr noticeInfo = new CmgRegstr();
//			noticeInfo.setIdx(Integer.toString(i));
//			Date today = new Date();
//			SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
//			noticeInfo.setComingTm(date.format(today));
//			noticeInfo.setCgpnNm("홍길동"+i);
//			noticeInfo.setGoingTm(date.format(today));
//			mainResult.add(noticeInfo);
//		}
		
		mainResult = mainService.selectAllCmgRegstr();
		Collections.reverse(mainResult);
		mv.addObject("mainResult", mainResult);
		mv.setViewName( "/main/board");
		
		return mv;
	}
	
	@RequestMapping(value ="/boardRead", method=RequestMethod.GET)
	public ModelAndView boardRead(@RequestParam("idx") int idx, Model model) throws Exception{
		
		System.out.println("관리자 게시판 내용 확인 페이지입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		NoticeInfo noticeInfoParam = mainService.selectNoticeInfo(idx);
		System.out.println(noticeInfoParam);
		noticeInfoParam.setIdx(Integer.toString(idx));
		System.out.println("번호 : " + noticeInfoParam.getIdx());
		System.out.println("제목 : " + noticeInfoParam.getSj());
		System.out.println("작성자 : " + noticeInfoParam.getRegister());
		System.out.println("작성일 : " + noticeInfoParam.getRegistdt());
		System.out.println("내용 : " + noticeInfoParam.getCn());
		
		mv.addObject( "mainResult", noticeInfoParam);
		
		mv.addObject("pageName", "작업 내역 작성 페이지 입니다.");
		mv.setViewName( "/main/boardRead");
		
		return mv;
	}
	
	@RequestMapping(value ="/changeWrite", method=RequestMethod.GET)
	public ModelAndView changeWrite(@RequestParam("idx") int idx, Model model) throws Exception{
		
		System.out.println("관리자 게시판 내용 확인 페이지입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		NoticeInfo noticeInfoParam = mainService.selectNoticeInfo(idx);
		System.out.println(noticeInfoParam);
		noticeInfoParam.setIdx(Integer.toString(idx));
		System.out.println("번호 : " + noticeInfoParam.getIdx());
		System.out.println("제목 : " + noticeInfoParam.getSj());
		System.out.println("작성자 : " + noticeInfoParam.getRegister());
		System.out.println("작성일 : " + noticeInfoParam.getRegistdt());
		System.out.println("내용 : " + noticeInfoParam.getCn());
		System.out.println(noticeInfoParam.getFixingAt());
		mv.addObject( "mainResult", noticeInfoParam);
		mv.addObject("type",noticeInfoParam.getFixingAt());
		mv.addObject("pageName", "작업 내역 작성 페이지 입니다.");
		mv.setViewName( "/main/changeWrite");
		
		return mv;
	}
	
	@RequestMapping(value ="/st")
	public ModelAndView st(Model model) throws Exception{
		
		System.out.println("관리자 게시판 내용 확인 페이지입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageName", "작업 내역 작성 페이지 입니다.");
		mv.setViewName( "/main/st");
		
		return mv;
	}
	
}
