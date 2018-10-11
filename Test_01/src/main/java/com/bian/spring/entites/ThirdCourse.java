package com.bian.spring.entites;

public class ThirdCourse {
    private Integer tId;

    private String tName;

    private Integer sId;

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName == null ? null : tName.trim();
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

	@Override
	public String toString() {
		return "ThirdCourse [tId=" + tId + ", tName=" + tName + ", sId=" + sId + "]";
	}
    
    
}