package com.dgit.domain;

import java.util.Date;

public class ProjectVO {
	private int pno;
	private String pName;
	private String pDetail;
	private Date startDate;
	private Date endDate;
	private String pCondition;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getpCondition() {
		return pCondition;
	}

	public void setpCondition(String pCondition) {
		this.pCondition = pCondition;
	}

	@Override
	public String toString() {
		return String.format("ProjectVO [pno=%s, pName=%s, pDetail=%s, startDate=%s, endDate=%s, pCondition=%s]", pno,
				pName, pDetail, startDate, endDate, pCondition);
	}

}
