package cn.gxnu.research.mapper;

import java.util.List;
import java.util.Map;

import cn.gxnu.research.model.ResearchResult;

public interface ResearchResultMapper 
{
	public int saveResearchResult(ResearchResult result);
	public int removeResearchResultByIds(List<String>ids);
	public int updateResearchResult(ResearchResult result);
	public List<ResearchResult> findResearchResult(ResearchResult result);
	public List<ResearchResult> findResearchResultByPage(Map param);
	public List<ResearchResult> findResearchResultByTitle(ResearchResult result);
	public ResearchResult findResearchResultById(Integer id);
	public Integer countResearchResultByTitle(Map param);
}
