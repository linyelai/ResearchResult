package cn.gxnu.research.model;

import java.util.Date;

public class ResearchResult 
{
	private Integer id;
	private String participant;
	private String no;
	private String title;
	private Integer type;
	private Date pulishDate;
	private Integer grade;
	private String imageUrl;
	private Float workload;
	private Float reward;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParticipant() {
		return participant;
	}
	public void setParticipant(String participant) {
		this.participant = participant;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Date getPulishDate() {
		return pulishDate;
	}
	public void setPulishDate(Date pulishDate) {
		this.pulishDate = pulishDate;
	}
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Float getWorkload() {
		return workload;
	}
	public void setWorkload(Float workload) {
		this.workload = workload;
	}
	public Float getReward() {
		return reward;
	}
	public void setReward(Float reward) {
		this.reward = reward;
	}
	
	
}
