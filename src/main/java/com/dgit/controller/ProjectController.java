package com.dgit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.ProjectVO;
import com.dgit.service.ProjectService;

@Controller
@RequestMapping("/pro/*")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectService service;
	
	@RequestMapping(value="listpage", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception{
		List<ProjectVO> list = service.readAll();
		logger.info("=============LIST ==================");
		logger.info("===========NAME : "+list.get(0).getpName());
		model.addAttribute("list", list);
		return "listpage";
	}
	
	@RequestMapping(value="register", method=RequestMethod.GET)
	public String insertGet(){
		return "insert";
	}
	
	@RequestMapping(value="register", method=RequestMethod.POST)
	public String insertPost(ProjectVO vo, String sd, String ed, RedirectAttributes rttr) throws Exception{
		Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sd);
		Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(ed);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		service.register(vo);
		// 입력한 제일 마지막 pno값 가져와야 함
		rttr.addAttribute("pno", service.lastPno());
		return "redirect:read";
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(int pno, Model model) throws Exception{
		logger.info("===========read PNO : "+pno);
		ProjectVO vo = service.read(pno);
		logger.info("=============read ==================");
		logger.info("===========read : "+vo.toString());
		model.addAttribute("vo", vo);
		return "read";  
	}
	
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public String modifyGet(ProjectVO vo, String sd, String ed, Model model) throws Exception{
		//ProjectVO vo = service.read(pno);
		logger.info("=============modify ==================");
		logger.info("===========modify : "+vo.toString());
		Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sd);
		Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(ed);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		model.addAttribute("vo", vo);
		return "modify";
	}
	
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPost(ProjectVO vo, String sd, String ed, RedirectAttributes rttr) throws Exception{
		//ProjectVO vo = service.read(pno);
		logger.info("=============modify POSTPOST==================");
		logger.info("===========modify POST: "+vo.toString());
		Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sd);
		Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(ed);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		
		service.modify(vo);
		
		rttr.addAttribute("pno", vo.getPno());
		return "redirect:read";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(ProjectVO vo) throws Exception{
		logger.info("=============delete ==================");
		logger.info("===========delete : "+vo.toString());
		service.remove(vo.getPno());
		
		return "redirect:listpage";
	}
	
}
