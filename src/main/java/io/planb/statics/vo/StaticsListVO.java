package io.planb.statics.vo;

import java.util.List;

public class StaticsListVO {
	private List<StaticsVO> staticsList;

	public StaticsListVO() {}

	public StaticsListVO(List<StaticsVO> staticsList) {
		super();
		this.staticsList = staticsList;
	}

	public List<StaticsVO> getStaticsList() {
		return staticsList;
	}

	public void setStaticsList(List<StaticsVO> staticsList) {
		this.staticsList = staticsList;
	}

	@Override
	public String toString() {
		return "StaticsListVO [staticsList=" + staticsList + "]";
	}

}
