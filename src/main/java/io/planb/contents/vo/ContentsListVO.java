package io.planb.contents.vo;

import java.util.List;


public class ContentsListVO {
	
	private List<ContentsVO> contentsList;

	public ContentsListVO() {}

	public ContentsListVO(List<ContentsVO> contentsList) {
		super();
		this.contentsList = contentsList;
	}

	public List<ContentsVO> getContentsList() {
		return contentsList;
	}

	public void setContentsList(List<ContentsVO> contentsList) {
		this.contentsList = contentsList;
	}

	@Override
	public String toString() {
		return "ContentsListVO [contentsList=" + contentsList + "]";
	}

}
