package com.bian.spring.entites;

public class Course {
	private Integer cId;

	private String cName;

	private String cTeacher;

	private String cType;

	private Integer sId;

	private String cImg;
	
	private String cContent;
	
	private Video video;
	
	private SecondCourse secondCourse;

	
	public Course() {
		super();
	}

	public Course(Integer cId, String cName, String cTeacher, String cType, Integer sId, String cImg, String cContent,
			Video video) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cTeacher = cTeacher;
		this.cType = cType;
		this.sId = sId;
		this.cImg = cImg;
		this.cContent = cContent;
		this.video = video;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	
	public void setVideo(Video video) {
		this.video = video;
	}
	
	public Video getVideo() {
		return video;
	}
	
	public String getcContent() {
		return cContent;
	}

	public void setSecondCourse(SecondCourse secondCourse) {
		this.secondCourse = secondCourse;
	}
	
	public SecondCourse getSecondCourse() {
		return secondCourse;
	}
	
	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Integer getcId() {
		return cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName == null ? null : cName.trim();
	}

	public String getcTeacher() {
		return cTeacher;
	}

	public void setcTeacher(String cTeacher) {
		this.cTeacher = cTeacher == null ? null : cTeacher.trim();
	}

	public String getcType() {
		return cType;
	}

	public void setcType(String cType) {
		this.cType = cType == null ? null : cType.trim();
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

	public String getcImg() {
		return cImg;
	}

	public void setcImg(String cImg) {
		this.cImg = cImg;
	}

	@Override
	public String toString() {
		return "Course [cId=" + cId + ", cName=" + cName + ", cTeacher=" + cTeacher + ", cType=" + cType + ", sId="
				+ sId + ", cImg=" + cImg + ", cContent=" + cContent + ", video=" + video + ", secondCourse="
				+ secondCourse + "]";
	}

	


}