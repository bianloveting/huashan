package com.bian.spring.entites;

public class SecondCourse {
    private Integer sId;
    private String sName;
    private Integer fId;

    private ThirdCourse thirdCourse;
    
    public void setThirdCourse(ThirdCourse thirdCourse) {
		this.thirdCourse = thirdCourse;
	}
    
    public ThirdCourse getThirdCourse() {
		return thirdCourse;
	}

	public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

	@Override
	public String toString() {
		return "SecondCourse [sId=" + sId + ", sName=" + sName + ", fId=" + fId + ", thirdCourse=" + thirdCourse + "]";
	}
    
}