package cn.gxnu.research.mapper;

import java.util.List;
import java.util.Map;

import cn.gxnu.research.model.TeacherInfo;

public interface TeacherInfoMapper
{
	public int saveTeacherInfo(TeacherInfo teacher);
	public int removeTeacherInfo(List<String> ids);
	public int updateTeacherInfo(TeacherInfo teacher);
	public List<TeacherInfo> findTeacherInfo(TeacherInfo teacher);
	public List<TeacherInfo> findTeacherInfoByPage(Map param);
	public List<TeacherInfo> findTeacherInfoByName(String name);
	public TeacherInfo findTeacherInfoById(Integer id);
	public Integer countTeacherInfoByName(Map param);
	public TeacherInfo findTeacherInfoByJobNum(String jobNum);
	public List<TeacherInfo> findAllTeacher();
}
