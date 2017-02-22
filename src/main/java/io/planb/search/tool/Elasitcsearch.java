package io.planb.search.tool;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
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
	private final String ipBit = "192.168.1.21";
	private String searchIP = ipBit;

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
			q = URLDecoder.decode(q, "UTF-8");
			q = URLEncoder.encode(q, "UTF-8");
			
			/* 기본 검색
			String restAPI = "http://" + searchIP + ":9200/_all/_search?pretty=true" 
							+ "&q=" + q;
				if(searchSize > 0) restAPI += "&size=" + searchSize;
			*/
			
			/*  */
			String restAPI = "http://" + searchIP + ":9200/contents/_search?source={"
					+ "\"query\":{\"multi_match\":{"
					+ 	"\"query\":\"" + q
					+	"\",\"fields\":[\"title\",\"summary\",\"source\"],\"type\":\"best_fields\"}"
					+ "},\"size\":" + searchSize
					+ ",\"highlight\":{"
					+ 	"\"fields\":{"
					+ 		"\"title\":{},\"summary\":{}},"
					+ 		"\"pre_tags\":[\"<mark>\"],\"post_tags\":[\"</mark>\"]"
					+ "}"
					+ "}&pretty=true";
			
			
			System.out.println("restAPI: " + restAPI);
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl(restAPI);
			searchResult = parseJsonToSearchHeader(json);
			
		} catch(JSONException | IOException e) {
			e.printStackTrace();
			return null;
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
		SearchVO searchResult = null;
		
		if(json.has("hits")) {
			JSONObject hits = json.getJSONObject("hits");
			int total = hits.has("total") ? hits.getInt("total") : 0;
			if(total != 0) {
				//Search result
				searchResult = new SearchVO();
				searchResult.setMaxScore(hits.getDouble("max_score"));
				
				JSONArray hitsArray = hits.getJSONArray("hits");
				List<ContentsVO> contentsList = parseJsonToSearchResult(hitsArray);
				searchResult.setCards(contentsList);
				searchResult.setTotal(contentsList.size());
			}
		}
		
		return searchResult;
	}
	
	private List<ContentsVO> parseJsonToSearchResult(JSONArray hitsArray) {
			
		List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
			
		for(int i=0; i<hitsArray.length(); i++) {
			
			JSONObject results = hitsArray.getJSONObject(i);
			ContentsVO contentsVO = new ContentsVO();
			
			JSONObject document = results.has("_source") ? results.getJSONObject("_source") : null;
			if(document != null) {
				//Document Contents
				String summary	 	  = document.has("summary")		 ? document.getString("summary")		 : null;
				int no				  = document.has("no")			 ? document.getInt("no")				 : 1;
				String source	 = document.has("source")	 ? document.getString("source")		 : "source";
				String title		  = document.has("title")		 ? document.getString("title")			 : null;
				String url			  = document.has("url")			 ? document.getString("url")			 : null;
				String imgUrl		  = document.has("imgurl")		 ? document.getString("imgurl")			 : null;
				String ban		 	  = document.has("ban")			 ? document.getString("ban")	 : null;
				
				String sourceUrl = document.has("sourceurl") ? document.getString("sourceurl")	 : null;
				String dataType	 = document.has("datatype")	 ? document.getString("datatype")	 : "dataType";
				String lastscraped = document.has("lastscraped")	 ? document.getString("lastscraped")	 : null;
				String category	 = document.has("category")	 ? document.getString("category")	 : "category";
				
				//Save search result to ContentsVO
				contentsVO.setContentsNo(no);
				contentsVO.setTitle(title);
				contentsVO.setSummary(summary);
				contentsVO.setUrl(url);
				contentsVO.setImgUrl(imgUrl);
				contentsVO.setBan(ban);
				
				contentsVO.setSourceName(source);
				contentsVO.setSourceUrl(sourceUrl);
				contentsVO.setCategoryName(category);
				contentsVO.setDataTypeName(dataType);
				contentsVO.setScrapedDaysAgo(lastscraped);
			}
			
			JSONObject highlights = results.has("highlight") ? results.getJSONObject("highlight") : null;
			if(highlights != null) {
				
				if(highlights.has("title")) {
					JSONArray titleArray = highlights.getJSONArray("title");
					
					String title = "";
					for(int j=0; j<titleArray.length(); j++) {
						if(j > 0) title += " ";
						title += titleArray.getString(j);
					}
					contentsVO.setTitle(title);
				}
				
				if(highlights.has("summary")) {
					JSONArray summaryArray = highlights.getJSONArray("summary");
					
					String summary = "";
					for(int j=0; j<summaryArray.length(); j++) {
						if(j > 0) summary += " ";
						summary += summaryArray.getString(j);
					}
					contentsVO.setSummary(summary);
				}
			}
			//Save ContentsVO to Contents List
			if(contentsVO.getBan().equals("N")) contentsList.add(contentsVO);
		}
		return contentsList;
	}

}
