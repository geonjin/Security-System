package kr.or.project.main.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.project.main.model.CmgRegstr;
import kr.or.project.main.model.DailyCmgSttus;
import kr.or.project.main.service.MainService;

@RequestMapping(value="/api")
@Controller
public class ApiController {
	
	private int num=0;
	@Autowired //interface랑 연결 (상속받은 mainserviceimp 로 연결됨)
	MainService mainService;
	
	@RequestMapping(value="/screen",method=RequestMethod.POST)
	public void Test(@RequestParam("coming_tm") String coming_tm,@RequestParam("url")String url,@RequestParam("file") MultipartFile file ,Model model) {
		System.out.println("라즈베리에서 데이터 들어옴");
		model.addAttribute("data",coming_tm);
		System.out.println(url);
		
		
		String path = "C:\\server\\"+url; //폴더 경로
		File Folder = new File(path);
		
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Files.createDirectories(Paths.get(path));
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}

		String name=file.getOriginalFilename();
		File f=new File(path+"\\"+name);
		System.out.println(f);
		try {
			file.transferTo(f);
		}catch(Exception e) {
			e.printStackTrace();
		}
		CmgRegstr cmgRegstrParam = new CmgRegstr();
		url = url.replace("/", "\\");
		cmgRegstrParam.setCgpnPhoto(url + "\\" + name);
		System.out.println("path : " + url + "\\" + name);
		coming_tm = coming_tm.replace("/", "");
		System.out.println("coming_tm : " + coming_tm);
		cmgRegstrParam.setComingTm(coming_tm);
		cmgRegstrParam.setRegistdt(coming_tm);
		cmgRegstrParam.setRegister("raspberry");
		DailyCmgSttus dailyCmgSttusParam = new DailyCmgSttus();
		dailyCmgSttusParam.setCmgCo("1");
		dailyCmgSttusParam.setCmgDt(coming_tm);
		dailyCmgSttusParam.setRegistDt(coming_tm);
		
		int result = mainService.insertCmgRegstr(cmgRegstrParam);
		mainService.insertDailyCmgSttus(dailyCmgSttusParam);
		System.out.println("result :: " + result);
	}
	
	@RequestMapping(value="/setGoingTm", method=RequestMethod.POST)
	public void setGoingTm(@RequestParam("goingTm") String goingTm, Model model) {
		System.out.println("나간시간 확인 : " + goingTm);
		CmgRegstr cmgRegstrParam = new CmgRegstr();
		cmgRegstrParam.setGoingTm(goingTm);
		mainService.updateGoingTm(cmgRegstrParam);
	}
	
	@RequestMapping(value="/setSensor",method=RequestMethod.POST)
	public void setSensor(@RequestParam("sensor") String sensor,Model model) {
		System.out.println("센서동작");
		num=Integer.parseInt(sensor);
		System.out.println(num);
	}
	

	@RequestMapping(value="/getSensor")
	public ModelAndView getSensor(HttpSession session, Locale locale,Model model) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", num);
		mv.setViewName( "/main/test");
		return mv;
	}


	@RequestMapping(value="/setMotor", method=RequestMethod.POST)
	public void getMotor(@RequestParam("going_tm") String going_tm,Model model) throws Exception{
		System.out.println("모터 동작");
		System.out.println(going_tm);
		
	}
	
	@RequestMapping(value="/getPython", method=RequestMethod.POST)
	public void getPython(@RequestParam("code") String code,Model model) throws Exception{
		System.out.println("Python 코드 : ");
		System.out.println(code);
		
	}
}
