package kr.or.project.main.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.project.main.model.CmgRegstr;
import kr.or.project.main.model.DailyCmgSttus;
import kr.or.project.main.model.MonthCmgSttus;
import kr.or.project.main.model.NoticeInfo;
import kr.or.project.main.service.MainService;

@Controller 
public class MainActionController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainActionController.class);

	@Autowired //interface랑 연결 (상속받은 mainserviceimp 로 연결됨)
	MainService mainService;
	
	@RequestMapping(value = {"/","/home"})
	public ModelAndView home(HttpSession session, Locale locale, Model model) throws Exception{
		
		System.out.println("홈페이지 입니다.");

		List<NoticeInfo> ln=new ArrayList<NoticeInfo>();
		List<CmgRegstr> lc=new ArrayList<CmgRegstr>();
		
		ModelAndView mv = new ModelAndView();
		Date now = new Date();
		 
        // 현재 날짜/시간 출력
        System.out.println(now); // Thu Jun 17 06:57:32 KST 2021
 
        // 포맷팅 정의
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 
        // 포맷팅 적용
        String formatedNow = formatter.format(now);
		List<MonthCmgSttus> lm=new ArrayList<MonthCmgSttus>();
			lm=mainService.selectMonthCmgSttus(formatedNow);
			
			List<Integer> month = new ArrayList<Integer>();
			for(int i=0;i<lm.size();i++) {
			month.add((int)Double.parseDouble(lm.get(i).getYmAvg()));
			}
			
		mv.addObject( "month", month);

		DailyCmgSttus dc=mainService.selectDailyCmgSttus(formatedNow);
		int today=Integer.parseInt(dc.getCmgCo());
		mv.addObject( "today", today);
		ln=mainService.selectHomeNoticeInfo();
		lc=mainService.selectHomeCmgRegstr();
		System.out.println(ln.get(1).getIdx());
		System.out.println(lc.get(2).getIdx());
		
		mv.addObject("limitCmg", lc);
		mv.addObject("limitNot", ln);
		mv.setViewName( "/main/home");
		
		return mv;
	}
	
	@RequestMapping(value = "/photoClick",method=RequestMethod.GET)
	public ModelAndView photoClick(@RequestParam("idx") int idx, Model model) throws Exception{
		
		System.out.println("출입대장 내용 확인 및 수정 페이지입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		CmgRegstr cmgRegstrParam = mainService.selectCmgRegstr(idx);
		
		System.out.println(cmgRegstrParam);
		
		System.out.println("성명 : " + cmgRegstrParam.getCgpnNm());
		System.out.println("나간 시간 : " + cmgRegstrParam.getComingTm());
		System.out.println("들어온 시간 : " + cmgRegstrParam.getGoingTm());
		System.out.println("작업 내역 : " + cmgRegstrParam.getWrDtls());
		
//		Date today = new Date();
//		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
//		cmgRegstr.setUpdtDt(date.format(today));
		
		mv.addObject( "mainResult", cmgRegstrParam);
		mv.addObject("idx",idx);
		mv.setViewName( "/main/photoClick");
		
		return mv;
	}
	
	@RequestMapping(value = "/mngrBbs")
	public ModelAndView mngrBbs(HttpSession session, Locale locale, Model model) throws Exception{
		
		System.out.println("관리자 게시판 목록입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageName", "검색어 테스트 페이지 입니다.");
		
		List<NoticeInfo> mainResult = new ArrayList<NoticeInfo>();
		// List<NoticeInfo> mainResult = mainService.selectMainInfo(noticeParam);
//		
//		for(int i = 1; i <= 100; i++) {
//			NoticeInfo noticeInfo = new NoticeInfo();
//			noticeInfo.setCn( i + "번째 내용부분 입니다.");
//			noticeInfo.setSj( i + "번째 제목부분 입니다.");
//			noticeInfo.setFixingAt(i+"");
//			Date today = new Date();
//			SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
//			noticeInfo.setUpdtDt(date.format(today));
//			noticeInfo.setRegister("홍길동"+i);
//			noticeInfo.setUpdusr("홍길동"+i);
//			mainResult.add(noticeInfo);
//		}
		
		mainResult=mainService.selectAllNoticeInfo();
		Collections.reverse(mainResult);
		mv.addObject( "mainResult", mainResult);
		mv.setViewName( "/main/mngrBbs");
		
		return mv;
	}
	
	@RequestMapping(value = "write")
	public ModelAndView write(HttpSession session, Locale locale, Model model) throws Exception{
		
		System.out.println("관리자 게시판 글쓰기 페이지입니다.");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageName", "검색어 테스트 페이지 입니다.");
		mv.setViewName( "/main/write");
		
		return mv;
	}
	
	/*
	 * @RequestMapping(value = "changeWrite" ,method=RequestMethod.GET) public
	 * ModelAndView changeWrite(@RequestParam("idx") int idx, HttpSession session,
	 * Locale locale, Model model) throws Exception{
	 * 
	 * System.out.println("관리자 게시판 수정 페이지입니다.");
	 * 
	 * ModelAndView mv = new ModelAndView();
	 * 
	 * mv.addObject("pageName", "검색어 테스트 페이지 입니다.");
	 * mv.addObject("mainResult",noticeInfoParam); mv.setViewName(
	 * "/main/changeWrite");
	 * 
	 * return mv; }
	 */
	@RequestMapping(value = "cmgStatus")
	public ModelAndView cmgStatus(HttpSession session, Locale locale, Model model) throws Exception{
		 
		System.out.println("출입현황판 페이지입니다.");
	
		ModelAndView mv = new ModelAndView();
		Date now = new Date();
        // 포맷팅 정의
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        // 포맷팅 적용
        String formatedNow = formatter.format(now);
        
        List<MonthCmgSttus> lm=new ArrayList<MonthCmgSttus>();
		lm=mainService.selectMonthCmgSttus(formatedNow);
		
		List<Integer> month = new ArrayList<Integer>();
		for(int i=0;i<lm.size();i++) {
		month.add((int)Double.parseDouble(lm.get(i).getYmAvg()));
		}
		
		mv.addObject( "month", month);
		
		
		DailyCmgSttus dc=mainService.selectDailyCmgSttus(formatedNow);
		int today=Integer.parseInt(dc.getCmgCo());
		mv.addObject( "today", today);
		mv.setViewName( "/main/cmgStatus");
		
		return mv;
	}
	
//	@RequestMapping(value = "/main/getMainInfos.do")
//	@ResponseBody //비동기로 작동하려면 해당 어노테이션 추가해야됨 (ajax)
//	public Map getMainInfos(HttpServletRequest request, Model model, @RequestBody NoticeInfo noticeParam) throws Exception{
//		
//		Map<String, Object> rMap = new HashMap<String, Object>();
//		
//		List<NoticeInfo> mainResult = mainService.selectMainInfo(noticeParam);
//		
//		rMap.put("mainResult", mainResult);
//		
//		return rMap;
//	}
	
		
	@RequestMapping(value = "/cmg/insertCmgRegstr.do")
	@ResponseBody //비동기로 작동하려면 해당 어노테이션 추가해야됨 (ajax)
	public Map insertCmgRegstr(HttpServletRequest request, Model model, @RequestBody CmgRegstr cmgRegstrParam) throws Exception{
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		System.out.println("cmgRegstrParam :: " + cmgRegstrParam);
		
		System.out.println("성명 : " + cmgRegstrParam.getCgpnNm());
		System.out.println("나간 시간 : " + cmgRegstrParam.getComingTm());
		System.out.println("들어온 시간 : " + cmgRegstrParam.getGoingTm());
		System.out.println("작업 내역 : " + cmgRegstrParam.getWrDtls());
		
		// int result = cmgRegstrService.insertCmgRegstr(cmgRegstrParam);
//		int result = mainService.insertCmgRegstr(cmgRegstrParam);
		mainService.updateCmgRegstr(cmgRegstrParam);
		System.out.println(cmgRegstrParam.getIdx());
//		System.out.println(cmgRegstrParam.getIdx());
//		System.out.println(cmgRegstrParam.getIdx().getClass());
//		System.out.println("result :: " + result);
		int result1=1;
		rMap.put("result", result1);
		
		return rMap;
	}
	
	@RequestMapping(value = "/notice/insertNoticeInfo.do")
	@ResponseBody
	public Map insertNoticeInfo(HttpServletRequest request, Model model, @RequestBody NoticeInfo noticeInfoParam) throws Exception{
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		System.out.println("noticeInfoParam :: " + noticeInfoParam);
		
		System.out.println("제목 : " + noticeInfoParam.getSj());
		System.out.println("내용 : " + noticeInfoParam.getCn());
		System.out.println("등록자 : " + noticeInfoParam.getRegister());
		System.out.println("등록자 : " + noticeInfoParam.getFixingAt());
		
		Date now = new Date();
		 
        // 현재 날짜/시간 출력
        System.out.println(now); // Thu Jun 17 06:57:32 KST 2021
 
 
        // 포맷팅 정의
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
        // 포맷팅 적용
        String formatedNow = formatter.format(now);
        System.out.println(formatedNow);
        
		noticeInfoParam.setRegistdt(formatedNow);
		noticeInfoParam.setUpdtDt(formatedNow);
		
		if(noticeInfoParam.getFixingAt().equals("true")) {
			noticeInfoParam.setFixingAt("T");
		} else {
			noticeInfoParam.setFixingAt("F");
		}
		
		int result = mainService.insertNoticeInfo(noticeInfoParam);
		System.out.println("result :: " + result);
		System.out.println("prac"+noticeInfoParam.getRegistdt());
		rMap.put("result", result);
		
		return rMap;
	}
	
	
	@RequestMapping(value = "/notice/updateNoticeInfo.do")
	@ResponseBody
	public Map updateNoticeInfo(HttpServletRequest request, Model model, @RequestBody NoticeInfo noticeInfoParam) throws Exception{
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		System.out.println("noticeInfoParam :: " + noticeInfoParam);
		
		System.out.println("제목 : " + noticeInfoParam.getSj());
		System.out.println("내용 : " + noticeInfoParam.getCn());
		System.out.println("등록자 : " + noticeInfoParam.getRegister());
		System.out.println("등록자 : " + noticeInfoParam.getFixingAt());
		
		Date now = new Date();
		 
        // 현재 날짜/시간 출력
        System.out.println(now); // Thu Jun 17 06:57:32 KST 2021
 
        // 포맷팅 정의
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 
        // 포맷팅 적용
        String formatedNow = formatter.format(now);
        System.out.println(formatedNow);
        
		noticeInfoParam.setUpdtDt(formatedNow);
		
		if(noticeInfoParam.getFixingAt().equals("true")) {
			noticeInfoParam.setFixingAt("T");
		} else {
			noticeInfoParam.setFixingAt("F");
		}
		
		mainService.updateNoticeInfo(noticeInfoParam);
		rMap.put("result", 1);
		
		return rMap;
	}
//	@RequestMapping(value = "/cmg/getCmgRegstrIdx.do")
//	@ResponseBody
//	public ModelAndView getCmgRegstrSelect(HttpSession session, Locale locale, Model model, @RequestBody CmgRegstr cmgRegstr) throws Exception{
//		
//		Map<String, Object> rMap = new HashMap<String, Object>();
//		
//		System.out.println("글 번호 : " + cmgRegstr.getIdx());
//		
//		ModelAndView mv = new ModelAndView();
//		System.out.println(cmgRegstr.getIdx());
//		mv.setViewName("/main/photoClick");
//		
//		photoClick(session, locale, model, Integer.parseInt(cmgRegstr.getIdx()));
//		
//		return mv;
//	}
//	
}