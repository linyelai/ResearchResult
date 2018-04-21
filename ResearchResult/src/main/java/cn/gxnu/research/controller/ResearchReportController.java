package cn.gxnu.research.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.gxnu.research.mapper.ResearchReportMapper;
import cn.gxnu.research.model.ResearchReport;
import cn.gxnu.research.model.ResearchResult;

@Controller
public class ResearchReportController
{
	@Autowired
	ResearchReportMapper mapper ;
	@RequestMapping(value="addResearchReport")
	public String addResearchReport()
	{
		return "addResearchReport";
	}
	
	@RequestMapping(value="addReport")
	public String addReport(String data,String title,String source,String author)
	{
		if(data!=null&&title!=null)
		{
			ResearchReport report = new ResearchReport();
			Date submitDate = Calendar.getInstance().getTime();
			String imgPath = null;
			if(data.contains("src="))
			{
				String [] datas = data.split("src=");
				if(datas!=null&&datas.length>1)
				{
					String []imgPaths = datas[1].split(" ");
					if(imgPaths!=null)
					{
						imgPath =  imgPaths[0];
					}
				}
			}
			report.setImgPath(imgPath);
			report.setTitle(title);
			report.setContent(data);
			report.setSubmitDate(submitDate);
			if(source!=null&&!"".equals(source))
			{
				report.setSource(source);
			}
			else
			{
				report.setSource("本站");
			}
			if(author!=null&&!"".equals(author))
			{
				report.setAuthor(author);
			}
			else
			{
				report.setAuthor("站点管理员");
			}
			
			mapper.saveResearchReport(report);
			
		}
		return "addResearchReport";
	}
	
	@RequestMapping(value="findReportByPage")
	@ResponseBody
	public Map findReportByPage(String title,int rows,Integer page)
	{
		//ModelAndView mav = new ModelAndView();
		List<ResearchReport> reportList = new ArrayList<ResearchReport>();
		//mav.setViewName("researchTrend");
		Map result = new HashMap();
		Map param = new HashMap();
		param.put("title", title);
		param.put("begin", (page-1)*rows);
		param.put("end", page*rows);
		reportList = mapper.findResearchReportByPage(param);
		Integer count = mapper.countResearchReportByTitle(param);
		//mav.addObject("reportList", reportList);
		//mav.addObject("totalPage", (count/rows)+1);
		result.put("rows",reportList);
		result.put("total",count);
		result.put("currentPage",page);
		return result;
		
	}
	@RequestMapping(value="researchTrend")
	public String researchTrend()
	{
		return "researchTrend";
	}
	@RequestMapping(value="reportDetail")
	public ModelAndView reportDetail(Integer id)
	{
		ModelAndView mav = new ModelAndView();
		List<ResearchReport> reportList = new ArrayList<ResearchReport>();
		mav.setViewName("reportDetail");
		ResearchReport report = mapper.findResearchReportById(id);
		mav.addObject("report", report);
		return mav;
		
	}
	
	 @RequestMapping(value="removeReports")
	  @ResponseBody
	    public Map removeReports(String ids)
	    {
	    	Map result = new HashMap();
	    	if(ids!=null)
	    	{
	    		String [] idArray = ids.split(",");
	    		List<String> idList = new ArrayList<String>();
	    		
	    		if(idArray!=null&&idArray.length>0)
	    		{
	    			for(String id:idArray)
	    			{
	    				idList.add(id);
	    			}
	    		}
	        	int count = mapper.removeResearchReportByIds(idList);
	        	if(count>0)
	        	{
	        		result.put("msg", "删除成功!");
	        	}
	        	else
	        	{
	        		result.put("msg", "删除失败!");
	        	}
	    	}
	    	
	    	return result;
	    }
	
@RequestMapping(value="editReport")
 public ModelAndView editReport(Integer id)
{
	ModelAndView mv = new ModelAndView();
    ResearchReport report = new ResearchReport();
    report = mapper.findResearchReportById(id);
	mv.setViewName("editResearchReport");
	mv.addObject("report", report);
   return mv;
}
	
@RequestMapping(value="updateReport")
@ResponseBody
public Map updateReport(ResearchReport report)
{
	Map ret = new HashMap();
	String imgPath = null;
	String data = report.getContent();
	if(data.contains("src="))
	{
		String [] datas = data.split("src=");
		if(datas!=null&&datas.length>1)
		{
			String []imgPaths = datas[1].split(" ");
			if(imgPaths!=null)
			{
				imgPath =  imgPaths[0];
			}
		}
	}
	report.setImgPath(imgPath);
	int count = mapper.updateResearchReport(report);
	if(count>0)
	{
		ret.put("msg", "修改成功！");
	}
	else
	{
		ret.put("msg", "修改失败！");
	}
	return ret;
}
	 
}
