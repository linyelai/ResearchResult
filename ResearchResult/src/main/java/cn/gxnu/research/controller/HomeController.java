package cn.gxnu.research.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.gxnu.research.mapper.ResearchReportMapper;
import cn.gxnu.research.mapper.ResearchResultMapper;
import cn.gxnu.research.model.ResearchReport;
import cn.gxnu.research.model.ResearchResult;

@Controller
public class HomeController 
{
	@Autowired
	ResearchResultMapper mapper ;
	@Autowired
	ResearchReportMapper reportMapper ;
	
	@RequestMapping(value="home")
	public ModelAndView home()
	{
		//查询
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		List<ResearchResult> resultList = new ArrayList<ResearchResult>();
		List<ResearchReport> reportList = new ArrayList<ResearchReport>();
		Map param = new HashMap();
		param.put("begin", 0);
		param.put("end",4);
		resultList = mapper.findResearchResultByPage(param);
		param.put("begin", 0);
		param.put("end", 6);
		reportList = reportMapper.findResearchReportByPage(param);
		mv.addObject("resultList", resultList);
		mv.addObject("reportList", reportList);
		return mv;
	}
}
