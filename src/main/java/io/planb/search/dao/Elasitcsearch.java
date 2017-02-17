package io.planb.search.dao;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import io.planb.contents.vo.ContentsVO;
import io.planb.search.vo.SearchVO;
import io.planb.tools.JsonReader;

/**
 * 
 * @author JK Kim (kirsnow@gmail.com)
 *
 */
public class Elasitcsearch {
	
	/**
     * 최대 검색결과 수를 지정하는  int형의 고정값.
     * 미지정 시, 상위 10건이 표시된다.
     */
	private final int searchSize = 100;
	private final String ipAmazon = "35.166.249.194";
	private final String ipBit = "192.168.1.64";

	/**
	 * Elasticsearch URI Search
	 * https://www.elastic.co/guide/en/elasticsearch/reference/5.2/search-uri-request.html
	 * 
	 * @param q
	 * @param ip
	 * @return SearchVO
	 */
	public SearchVO searchURI(String q, String ip) {
		SearchVO searchResult = null;
		String searchIP = null;
		
		/* IP setup */
		if(ip == null) {
			searchIP = ipBit;
		} else {
			ip = ip.toLowerCase();
			
			switch(ip) {
			
			case "b": 
			case "bit": 
			case "l": 
			case "local": 
			case "localhost": searchIP = ipBit;

			case "a":
			case "amazon":
			case "e":
			case "ec2":
			case "c":
			case "cloud": searchIP = ipAmazon;
			
			default: searchIP = ip;
			}
		}
		
		/* Search */
		try {
			String restAPI = "http://" + searchIP + ":9200/_all/_search?pretty=true" 
							+ "&q=" + URLEncoder.encode(q, "UTF-8");
			if(searchSize > 0) restAPI += "&size=" + searchSize;
			
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl(restAPI);
			searchResult = parseJsonToSearchHeader(json);
			searchResult.setQuery(q);
			
			/* Highlight search query ** only one word
			searchResult.setContents(highlighter(q, searchResult.getContents()));
			 *  */
			
		} catch(JSONException | IOException e) {
			e.printStackTrace();
		}

		return searchResult;
	}
	
	/**
	 * Elasticsearch Request Body Search
	 * https://www.elastic.co/guide/en/elasticsearch/reference/5.2/search-request-body.html
	 * 
	 * @param q
	 * @param ip
	 * @return SearchVO
	 */
	public SearchVO searchRequestBody(String q, String ip) {
		SearchVO searchResult = new SearchVO();
		
		//do something! - not yet
		
		return searchResult;
	}

	
	
	/**
	 * Elasticsearch JSON parser
	 * 
	 * @param JSONObject hits
	 * @param int total
	 * @return List<ContentsVO>
	 */
	private SearchVO parseJsonToSearchHeader(JSONObject json) {
		JSONObject hits = json.getJSONObject("hits");
		
		SearchVO searchResult = null;
		int total = hits.has("total") ? hits.getInt("total") : 0;
		
		if(total != 0) {
			//Search result
			searchResult = new SearchVO();
			searchResult.setTotal(total);
			searchResult.setMaxScore(hits.getDouble("max_score"));
			
			List<ContentsVO> contentsList = parseJsonToSearchResult(hits, total);
			searchResult.setContents(contentsList);
		}
		return searchResult;
	}
	
	private List<ContentsVO> parseJsonToSearchResult(JSONObject hits, int total) {
		  
		  List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
			
			for(int i=0; i<total; i++) {
				JSONObject document = hits.getJSONArray("hits").getJSONObject(i).getJSONObject("_source");
				
				//Document Contents
				int no				  = document.has("no")				 ? document.getInt("no")				 : 1;
				String title		  = document.has("title")			 ? document.getString("title")			 : null;
				String summary	 	  = document.has("summary")			 ? document.getString("summary")		 : null;
				String url			  = document.has("url")				 ? document.getString("url")			 : null;
				String imgUrl		  = document.has("imgurl")			 ? document.getString("imgurl")			 : null;
				/*String lastScraped	  = document.has("lastscraped")		 ? document.getString("lastscraped")	 : null;*/
				String scrapedDaysAgo = document.has("scrapedDaysAgo")	 ? document.getString("scrapedDaysAgo")	 : null;
				char ban		 	  = document.has("ban")				 ? document.getString("ban").charAt(0)	 : null;
				
				String source	 = document.has("source")	 ? document.getString("source")		 : "source";
				String sourceUrl = document.has("sourceurl") ? document.getString("sourceurl")	 : null;
				String category	 = document.has("category")	 ? document.getString("category")	 : "category";
				String dataType	 = document.has("datatype")	 ? document.getString("datatype")	 : "dataType";
				
				int saveCnt		 = document.has("savecnt")	 ? document.getInt("savecnt")	 : 0;
				int likeCnt		 = document.has("likecnt")	 ? document.getInt("likecnt")	 : 0;
				int viewCnt		 = document.has("viewcnt")	 ? document.getInt("viewcnt")	 : 0;
				
				//Save search result to ContentsVO
				ContentsVO contentsVO = new ContentsVO();
				contentsVO.setContentsNo(no);
				contentsVO.setTitle(title);
				contentsVO.setSummary(summary);
				contentsVO.setUrl(url);
				contentsVO.setImgUrl(imgUrl);
				/*
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date scrapedDate;
				try {
					scrapedDate = transFormat.parse(lastScraped);
					contentsVO.setScrapedDate(scrapedDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				*/
				contentsVO.setBan(ban);
				
				contentsVO.setSourceName(source);
				contentsVO.setSourceUrl(sourceUrl);
				contentsVO.setCategoryName(category);
				contentsVO.setDataTypeName(dataType);
				contentsVO.setScrapedDaysAgo(scrapedDaysAgo);
				
				contentsVO.setSavedCnt(saveCnt);
				contentsVO.setLikeCnt(likeCnt);
				contentsVO.setViewCnt(viewCnt);
				
				//Save ContentsVO to Contents List
				if(ban != 'Y') contentsList.add(contentsVO);
			}
			return contentsList;
	  }
	/*
	public List<ContentsVO> highlighter(String q, List<ContentsVO> contentsList) {
		
		List<ContentsVO> highlighted = new ArrayList<ContentsVO>();
		
		for(ContentsVO contents : contentsList) {
			String title = contents.getTitle();
			String summary = contents.getSummary();
			
			List<String> qCases = new ArrayList<String>();
			qCases.add(q.toLowerCase());
			qCases.add(q.toUpperCase());
			qCases.add(q.toLowerCase().substring(0, 1).toUpperCase() + q.substring(1));
			
			title = title.replace(q, "<mark>" + q + "</mark>");
			summary = summary.replace(q, "<mark>" + q + "</mark>");
			
			for(String qCase : qCases) {
				if(!qCase.equals(q)) {
					title = title.replace(qCase, "<mark>" + qCase + "</mark>");
					summary = summary.replace(qCase, "<mark>" + qCase + "</mark>");
				}
			}
			
			contents.setTitle(title);
			contents.setSummary(summary);
			highlighted.add(contents);
		}
		return highlighted;
	}*/
}
