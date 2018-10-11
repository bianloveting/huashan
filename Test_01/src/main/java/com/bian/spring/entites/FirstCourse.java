package com.bian.spring.entites;

public class FirstCourse {
    private Integer fId;
    private String fName;
    
    private SecondCourse secondCourse;
    
    public SecondCourse getSecondCourse() {
		return secondCourse;
	}

	public void setSecondCourse(SecondCourse secondCourse) {
		this.secondCourse = secondCourse;
	}
    

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName == null ? null : fName.trim();
    }

	@Override
	public String toString() {
		return "FirstCourse [fId=" + fId + ", fName=" + fName + ", secondCourse=" + secondCourse + "]";
	}
    
    
}