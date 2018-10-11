package com.bian.spring.entites;

public class Video {
    private Integer cId;

    private String vDesc;

    private String vId;

    private Integer tId;
    
    private String vName;
    
    
    public Video(Integer cId, String vDesc, String vId, Integer tId, String vName) {
		super();
		this.cId = cId;
		this.vDesc = vDesc;
		this.vId = vId;
		this.tId = tId;
		this.vName = vName;
	}

	public void setvName(String vName) {
		this.vName = vName;
	}

    public String getvName() {
		return vName;
	}
    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getvDesc() {
        return vDesc;
    }

    public void setvDesc(String vDesc) {
        this.vDesc = vDesc == null ? null : vDesc.trim();
    }
    
    public String getvId() {
		return vId;
	}

	public void setvId(String vId) {
		this.vId = vId;
	}

	public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

	@Override
	public String toString() {
		return "Video [cId=" + cId + ", vDesc=" + vDesc + ", vId=" + vId + ", tId=" + tId + ", vName=" + vName + "]";
	}

	public Video() {
		super();
	}


}