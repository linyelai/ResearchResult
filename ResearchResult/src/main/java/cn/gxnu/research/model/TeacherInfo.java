package cn.gxnu.research.model;

import java.util.Date;
import java.util.List;

public class TeacherInfo 
{
	private Integer id;
	private String name;
	private String jobNum;
	private Integer gender;
	private Date birthday;
	private String degree;
	private String rank;
	private String position;
	private String idCardNum;
	private String academic;
	private List<ResearchResult> resultList;
	private Float totalReward;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJobNum() {
		return jobNum;
	}
	public void setJobNum(String jobNum) {
		this.jobNum = jobNum;
	}

	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getIdCardNum() {
		return idCardNum;
	}
	public void setIdCardNum(String idCardNum) {
		this.idCardNum = idCardNum;
	}
	public String getAcademic() {
		return academic;
	}
	public void setAcademic(String academic) {
		this.academic = academic;
	}
	public List<ResearchResult> getResultList() {
		return resultList;
	}
	public void setResultList(List<ResearchResult> resultList) {
		this.resultList = resultList;
	}
	public Float getTotalReward() {
		return totalReward;
	}
	public void setTotalReward(Float totalReward) {
		this.totalReward = totalReward;
	}
	
}
