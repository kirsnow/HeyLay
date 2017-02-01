package io.planb.contents.vo;

public class ContentsVO {
	private int no;
	private String title;
	private String summary;
	private String url;
	private String imgUrl;
	private String lastScraped;
	private String ban;
	
	private String source;
	private String sourceUrl;
	private String category;
	private String dataType;
	
	private int saveCnt;
	private int reportCnt;
	private int likeCnt;
	private int viewCnt;
	
	public ContentsVO() {}
	
	public ContentsVO(int no, String title, String summary, String url, String imgUrl, String lastScraped, String ban,
			String source, String sourceUrl, String category, String dataType, int saveCnt, int reportCnt, int likeCnt,
			int viewCnt) {
		super();
		this.no = no;
		this.title = title;
		this.summary = summary;
		this.url = url;
		this.imgUrl = imgUrl;
		this.lastScraped = lastScraped;
		this.ban = ban;
		this.source = source;
		this.sourceUrl = sourceUrl;
		this.category = category;
		this.dataType = dataType;
		this.saveCnt = saveCnt;
		this.reportCnt = reportCnt;
		this.likeCnt = likeCnt;
		this.viewCnt = viewCnt;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getLastScraped() {
		return lastScraped;
	}
	public void setLastScraped(String lastScraped) {
		this.lastScraped = lastScraped;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getSourceUrl() {
		return sourceUrl;
	}
	public void setSourceUrl(String sourceUrl) {
		this.sourceUrl = sourceUrl;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public int getSaveCnt() {
		return saveCnt;
	}
	public void setSaveCnt(int saveCnt) {
		this.saveCnt = saveCnt;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "ContentsVO [no=" + no + ", title=" + title + ", summary=" + summary + ", url=" + url + ", imgUrl="
				+ imgUrl + ", lastScraped=" + lastScraped + ", ban=" + ban + ", source=" + source + ", sourceUrl="
				+ sourceUrl + ", category=" + category + ", dataType=" + dataType + ", saveCnt=" + saveCnt
				+ ", reportCnt=" + reportCnt + ", likeCnt=" + likeCnt + ", viewCnt=" + viewCnt + "]";
	}

	public String toJson() {
		return "{ \"update\" : { \"_index\": \"planbs\", \"_type\": \"planb\", \"_id\": " + no + "\"} }\n"
				+ "{ \"title\": \"" + title + "\", \"summary\": \"" + summary + "\", \"url\": \"" + url 
				+ "\", \"lastScraped\": \"" + lastScraped + "\", \"ban\": \"" + ban + "\", \"source\": \"" + source
				+ "\", \"sourceUrl\": \"" + sourceUrl + "\", \"category\": \"" + category + "\", \"dataType\": \"" + dataType 
				+ "\", \"saveCnt\": \"" + saveCnt + "\", \"reportCnt\": \"" + reportCnt + "\", \"likeCnt\": \"" + likeCnt 
				+ "\", \"viewCnt\": \"" + viewCnt;
	}
}
