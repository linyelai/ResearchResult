package cn.gxnu.research.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.gxnu.research.mapper.TeacherInfoMapper;
import cn.gxnu.research.model.TeacherInfo;
import cn.gxnu.research.model.UserInfo;

@Controller
public class TeacherController 
{
	@Autowired
	TeacherInfoMapper mapper;
	@RequestMapping(value="findTeachers")
	@ResponseBody
	public  Map<String, Object> findTeachers(String name,int rows,Integer page)
	{
		List<TeacherInfo> teachers = new ArrayList<TeacherInfo>();
		Map<String,Object> result = new HashMap<String,Object>();
		Integer total =0;
		Map param = new HashMap();
		param.put("name", name);
		param.put("begin", (page-1)*rows);
		param.put("end", page*rows);
		teachers.addAll(mapper.findTeacherInfoByPage(param));
		if(teachers.size()>0)
		{
			total = mapper.countTeacherInfoByName(param);
		}
		
		result.put("rows", teachers);
		result.put("total", total);
		return result;
	}
	
	@RequestMapping(value="findAllTeachers")
	@ResponseBody
	public  List findAllTeachers()
	{
		List<TeacherInfo> teachers = new ArrayList<TeacherInfo>();
		teachers = mapper.findAllTeacher();
		return teachers;
	}
	
	@RequestMapping(value="addTeacher")
	@ResponseBody
	public Map addTeacher(TeacherInfo teacher)
	{
		Map result = new HashMap();
		try {
			if(teacher!=null&&teacher.getJobNum()!=null&&teacher.getName()!=null)
			{
				
				TeacherInfo retTeacher = mapper.findTeacherInfoByJobNum(teacher.getJobNum());
				if(retTeacher!=null)
				{
					result.put("msg", "该教师信息已存在！");
					return result;
				}
				else
				{
					//设置一下教师的出生年月日，以及性别，根据身份证号码获取
					String birthdayYear = teacher.getIdCardNum().substring(6,10);
					String birthdayMonth = teacher.getIdCardNum().substring(10,12);
					String birthdayDay = teacher.getIdCardNum().substring(12,14);
					String genderStr = teacher.getIdCardNum().substring(16,17);
					Integer gender = Integer.parseInt(genderStr)%2;
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");    
					Date birthday = format.parse(birthdayYear+"-"+birthdayMonth+"-"+birthdayDay);
					teacher.setBirthday(birthday);
					if(gender==0)
					{
						teacher.setGender(1);
					}
					else
					{
						teacher.setGender(0);
					}
					
					mapper.saveTeacherInfo(teacher);
				}
				result.put("msg", "添加成功");
			}
			else
			{
				result.put("msg", "添加失败");
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="removeTeacher")
	@ResponseBody
	public Map removeTeacher(String jobNums)
	{
		Map result = new HashMap();
		//
		String [] jobNumArray = jobNums.split(",");
		List<String> jobNumList = new ArrayList<String>();
		
		if(jobNumArray!=null&&jobNumArray.length>0)
		{
			for(String jobNum:jobNumArray)
			{
				jobNumList.add(jobNum);
			}
		}
		int count = mapper.removeTeacherInfo(jobNumList);
		if(count>0)
		{
			result.put("msg", "删除成功");
		}
		else
		{
			result.put("msg", "删除失败！");
		}
		
		return result;
	}
	
	
	@RequestMapping(value="updateTeacherInfo")
	@ResponseBody
	public Map updateTeacherInfo(TeacherInfo teacher)
	{
		Map result = new HashMap();
		try 
		{
			if(teacher!=null&&teacher.getJobNum()!=null)
			{
				Integer id = teacher.getId();
				TeacherInfo queryTeacher = mapper.findTeacherInfoByJobNum(teacher.getJobNum());
				if(queryTeacher!=null)
				{
					//工号不能重复
					Integer queryId = queryTeacher.getId();
					if(queryId!=null&&!queryId.equals(teacher.getId()))
					{
						result.put("msg", "修改失败，已经存在该工号");
					}
					else
					{
						String birthdayYear = teacher.getIdCardNum().substring(6,10);
						String birthdayMonth = teacher.getIdCardNum().substring(10,12);
						String birthdayDay = teacher.getIdCardNum().substring(12,14);
						String genderStr = teacher.getIdCardNum().substring(16,17);
						Integer gender = Integer.parseInt(genderStr)%2;
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");    
						Date birthday = format.parse(birthdayYear+"-"+birthdayMonth+"-"+birthdayDay);
						teacher.setBirthday(birthday);
						if(gender==0)
						{
							teacher.setGender(1);
						}
						else
						{
							teacher.setGender(0);
						}
						int count = mapper.updateTeacherInfo(teacher);
						if(count>0)
						{
							result.put("msg", "修改成功");
						}
						else
						{
							result.put("msg", "修改失败");
						}
					}
					
				}
				else
				{
					String birthdayYear = teacher.getIdCardNum().substring(6,10);
					String birthdayMonth = teacher.getIdCardNum().substring(10,12);
					String birthdayDay = teacher.getIdCardNum().substring(12,14);
					String genderStr = teacher.getIdCardNum().substring(16,17);
					Integer gender = Integer.parseInt(genderStr)%2;
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");    
					Date birthday = format.parse(birthdayYear+"-"+birthdayMonth+"-"+birthdayDay);
					teacher.setBirthday(birthday);
					if(gender==0)
					{
						teacher.setGender(1);
					}
					else
					{
						teacher.setGender(0);
					}
					int count = mapper.updateTeacherInfo(teacher);
					if(count>0)
					{
						result.put("msg", "修改成功");
					}
					else
					{
						result.put("msg", "修改失败");
					}
				}
			}
			else
			{
				result.put("msg", "修改失败,请输入必要的教师信息");
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
