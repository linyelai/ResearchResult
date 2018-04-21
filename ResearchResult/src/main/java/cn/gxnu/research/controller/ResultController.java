package cn.gxnu.research.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.gxnu.research.mapper.ResearchReportMapper;
import cn.gxnu.research.mapper.ResearchResultMapper;
import cn.gxnu.research.model.ResearchReport;
import cn.gxnu.research.model.ResearchResult;

@Controller
public class ResultController 
{
	@Autowired
	ResearchResultMapper mapper ;
	@RequestMapping(value="findResultByPage")
	@ResponseBody
	public Map<String, Object> findResultByPage(String title,int rows,Integer page)
	{
		//ModelAndView mav = new ModelAndView();
		Map result = new HashMap();
		List<ResearchResult> resultList = new ArrayList<ResearchResult>();
		//mav.setViewName("researchResult");
		Map param = new HashMap();
		param.put("title", title);
		param.put("begin", (page-1)*rows);
		param.put("end", page*rows);
		resultList = mapper.findResearchResultByPage(param);
		Integer count = mapper.countResearchResultByTitle(param);
		//mav.addObject("resultList", resultList);
		//mav.addObject("totalPage", (count/rows)+1);
		result.put("rows", resultList);
		result.put("total",count );
		result.put("currentPage", page);
		//return mav;
		return result;
		
	}
	@RequestMapping(value="researchResult")
	public String researchResult()
	{
		return "researchResult";
	}
	@RequestMapping(value="addResult")
	@ResponseBody
	public Map addResult(ResearchResult result)
	{
		Map map = new HashMap();
		int count = mapper.saveResearchResult(result);
		if(count>0)
		{
			map.put("msg", "添加成功");
		}
		else
		{
			map.put("msg", "添加失败");
		}
		return map;
		
	}
	
	@RequestMapping(value="views/uploadImage")
	public ModelAndView uploadImage(@RequestParam("file") MultipartFile file,
			String title,String participant,String no,Integer type,Integer grade,
			String pulishDate,Float workload,Float reward,
			HttpServletRequest request)
	{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("addResearchResult");
			String imageName = saveFile(request, file);
			ResearchResult result = new ResearchResult();
			result.setTitle(title);
			result.setParticipant(participant);
			result.setNo(no);
			result.setType(type);
			result.setGrade(grade);
			if(pulishDate!=null&&!"".equals(pulishDate))
			{
				result.setPulishDate(new Date(pulishDate));
			}
			else
			{
				result.setPulishDate(Calendar.getInstance().getTime());
			}
			
			result.setWorkload(workload);
			result.setReward(reward);
			mv.addObject("imageName", imageName);
			mv.addObject("result", result);
			
			return mv;  
		
	}
	
	@RequestMapping(value="uploadEditImage")
	public ModelAndView uploadEditImage(@RequestParam("file") MultipartFile file,
			String title,String participant,String no,Integer type,Integer grade,
			String pulishDate,Float workload,Float reward,Integer id,
			HttpServletRequest request)
	{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("editResult");
			String imageName = saveFile(request, file);
			ResearchResult result = new ResearchResult();
			result.setTitle(title);
			result.setParticipant(participant);
			result.setNo(no);
			result.setType(type);
			result.setGrade(grade);
			result.setId(id);
			if(pulishDate!=null&&!"".equals(pulishDate))
			{
				result.setPulishDate(new Date(pulishDate));
			}
			else
			{
				result.setPulishDate(Calendar.getInstance().getTime());
			}
			
			result.setWorkload(workload);
			result.setReward(reward);
			mv.addObject("imageName", imageName);
			mv.addObject("result", result);
			
			return mv;  
		
	}
	
	
	
	/***  
     * 保存文件  
     *  
     * @param file  
     * @return  
     */  
    private String  saveFile(HttpServletRequest request, MultipartFile file) {  
        // 判断文件是否为空  
    	 String imageName  =null;
        if (!file.isEmpty()) 
        {  
            try 
            {  
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中  )  
            	Date submitDate = Calendar.getInstance().getTime();
            	SimpleDateFormat format = new SimpleDateFormat("yymmddHHMMss");
            	String fileName = format.format(submitDate);
            	String extendName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
            	imageName = "upload/"+fileName+extendName;
                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/" + fileName+extendName;  
                File saveDir = new File(filePath);  
                if (!saveDir.getParentFile().exists()) 
                {
                    saveDir.getParentFile().mkdirs();  
                }
                // 转存文件  
                file.transferTo(saveDir);  
                return imageName;  
            }
            catch (Exception e) 
            {  
                e.printStackTrace();  
            }  
        }  
        return imageName;  
    } 
    
    @RequestMapping(value="resultDetail")
	public ModelAndView resultDetail(Integer id)
	{
		ModelAndView mav = new ModelAndView();
		List<ResearchResult> reportList = new ArrayList<ResearchResult>();
		mav.setViewName("resultDetail");
		ResearchResult result = mapper.findResearchResultById(id);
		mav.addObject("result", result);
		return mav;
		
	}
    
    @RequestMapping(value="removeResults")
    @ResponseBody
    public Map removeResults(String ids)
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
        	int count = mapper.removeResearchResultByIds(idList);
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
    
    @RequestMapping(value="editResult")
    public ModelAndView editResult(Integer id)
    {
    	ModelAndView mv = new ModelAndView();
    	ResearchResult result = new ResearchResult();
    	result = mapper.findResearchResultById(id);
    	mv.setViewName("editResult");
    	mv.addObject("result", result);
    	mv.addObject("imageName", result.getImageUrl());
    	return mv;
    }
    
    @RequestMapping(value="updateResult")
    @ResponseBody
    public Map updateResult(ResearchResult result)
    {
    	Map ret = new HashMap();
    	
    	int count = mapper.updateResearchResult(result);
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
    
    
    
  @RequestMapping(value="downloadSum")
  public void downloadSum(HttpServletResponse response) throws IOException
  {
	  Workbook wb = new HSSFWorkbook();
	  Sheet sheet = wb.createSheet();
	  String fileName =new String(( "科研结果汇总表.xls").getBytes(), "iso-8859-1") ;
	  String []header = {"科研课题","参与者","成果编号","类别","等级","发布日期","工作量（人天）","奖励金额（圆）"};
	  initHeader(sheet,header);
	  ByteArrayOutputStream bOut = new ByteArrayOutputStream();
	  //OutputStream out = new FileOutputStream("d:/Test.xls");
	  List<ResearchResult> resultList = mapper.findResearchResult(null);
	  if(resultList!=null&&resultList.size()>0)
	  {
		  fillData(sheet,resultList);
	  }
	  wb.write(bOut);
	  bOut.flush();
	  response.setContentType("application/vnd.ms-excel;charset=utf-8");
      response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
      ServletOutputStream out = response.getOutputStream();
      out.write(bOut.toByteArray());
	  bOut.close();
	  out.flush();
	  out.close();
      return ;
      
  }
private void fillData(Sheet sheet, List<ResearchResult> resultList) 
{
	// TODO Auto-generated method stub
	for(ResearchResult result:resultList)
	{
		
		String participant = result.getParticipant();
		String no = result.getNo();
		String title = result.getTitle();
		Integer type = result.getType();
		Date pulishDate = result.getPulishDate();
		Integer grade =  result.getGrade();
		String imageUrl = result.getImageUrl();
		Float workload = result.getWorkload();
		Float reward =  result.getReward();
		Row row = sheet.createRow(sheet.getLastRowNum()+1);
		Cell titleCell = row.createCell(0);
		Cell participantCell = row.createCell(1);
		Cell noCell = row.createCell(2);
		Cell typeCell = row.createCell(3);
		Cell gradeCell = row.createCell(4);
		Cell pulishDateCell = row.createCell(5);
		Cell workloadCell = row.createCell(6);
		Cell rewardCell = row.createCell(7);
		participantCell.setCellValue(participant);
		noCell.setCellValue(no);
		titleCell.setCellValue(title);
		if(type==0)
		{
			typeCell.setCellValue("论文");
		}
		else if(type==1)
		{
			typeCell.setCellValue("专利");
		}
		else if(type==2)
		{
			typeCell.setCellValue("专著");
		}
		else if(type==3)
		{
			typeCell.setCellValue("软件著作权");
		}
		else if(type==4)
		{
			typeCell.setCellValue("横向项目");
		}
		if(grade==0)
		{
			gradeCell.setCellValue("SCI一区");
		}
		else if(grade==1)
		{
			gradeCell.setCellValue("SCI二区");
		}
		else if(grade==2)
		{
			gradeCell.setCellValue("SCI光盘");
		}
		else if(grade==3)
		{
			gradeCell.setCellValue("EI");
		}
		else if(grade==4)
		{
			gradeCell.setCellValue("普通刊物");
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		pulishDateCell.setCellValue(format.format(pulishDate));
		workloadCell.setCellValue(workload);
		rewardCell.setCellValue(reward);
	}
	
}
private void initHeader(Sheet sheet,String[]headers) 
{
	// TODO Auto-generated method stub
	 Row row = sheet.createRow(0);
	 for(int i=0;i<headers.length;i++)
	 {
		  Cell cell = row.createCell(i);
		  cell.setCellValue(headers[i]);
	 }
	
}

}
