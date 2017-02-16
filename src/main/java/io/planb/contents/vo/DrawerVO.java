package io.planb.contents.vo;

import java.util.List;

public class DrawerVO {

	private String header;
	private List<ContentsVO> cards;
	
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public List<ContentsVO> getCards() {
		return cards;
	}
	public void setCards(List<ContentsVO> cards) {
		this.cards = cards;
	}
	
}
