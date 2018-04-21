package cn.gxnu.research.mapper;

import java.util.List;
import java.util.Map;

import cn.gxnu.research.model.ResearchReport;

public interface ResearchReportMapper 
{
	public int saveResearchReport(ResearchReport report);
	public int removeResearchReportByIds(List<String> ids);
	public int updateResearchReport(ResearchReport report);
	public List<ResearchReport> findResearchReport(ResearchReport report);
	public List<ResearchReport> findResearchReportByPage(Map param);
	public List<ResearchReport> findResearchReportByTitle(String title);
	public ResearchReport findResearchReportById(Integer id);
	public Integer countResearchReportByTitle(Map param);
}
