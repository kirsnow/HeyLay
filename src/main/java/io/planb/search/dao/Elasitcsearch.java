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
	private final String ipES = "52.35.61.184";
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
		String searchIP = ip != null ? ip : ipBit;
		try {
			String restAPI = "http://" + searchIP + ":9200/_all/_search?pretty=true" 
							+ "&q=" + URLEncoder.encode(q, "UTF-8");
			if(searchSize > 0) restAPI += "&size=" + searchSize;
			
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl(restAPI);
			searchResult = parseJsonToSearchHeader(json);
			
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
				int no			   = document.has("no")				 ? document.getInt("no")				 : 1;
				String title	   = document.has("title")			 ? document.getString("title")			 : null;
				String summary	   = document.has("summary")		 ? document.getString("summary")		 : null;
				String url		   = document.has("url")			 ? document.getString("url")			 : null;
				String imgUrl	   = document.has("imgurl")			 ? document.getString("imgurl")			 : null;
				String lastScraped = document.has("lastscraped")	 ? document.getString("lastscraped")	 : null;
				String ban		   = document.has("ban")			 ? document.getString("ban")			 : null;
				
				String source	 = document.has("source")		 ? document.getString("source")		 : "source";
				String sourceUrl = document.has("sourceurl")	 ? document.getString("sourceurl")	 : null;
				String category	 = document.has("category")		 ? document.getString("category")	 : "category";
				String dataType	 = document.has("datatype")		 ? document.getString("datatype")	 : "dataType";
				
				int saveCnt		 = document.has("savecnt")	 ? document.getInt("savecnt")	 : 0;
				int reportCnt	 = document.has("reportcnt") ? document.getInt("reportcnt")	 : 0;
				int likeCnt		 = document.has("likecnt")	 ? document.getInt("likecnt")	 : 0;
				int viewCnt		 = document.has("viewcnt")	 ? document.getInt("viewcnt")	 : 0;
				
				//Save search result to ContentsVO
				ContentsVO contentsVO = new ContentsVO();
				contentsVO.setNo(no);
				contentsVO.setTitle(title);
				contentsVO.setSummary(summary);
				contentsVO.setUrl(url);
				contentsVO.setImgUrl(imgUrl);
				contentsVO.setLastScraped(lastScraped);
				contentsVO.setBan(ban);
				
				contentsVO.setSource(source);
				contentsVO.setSourceUrl(sourceUrl);
				contentsVO.setCategory(category);
				contentsVO.setDataType(dataType);
				
				contentsVO.setSaveCnt(saveCnt);
				contentsVO.setReportCnt(reportCnt);
				contentsVO.setLikeCnt(likeCnt);
				contentsVO.setViewCnt(viewCnt);
				
				//Save ContentsVO to Contents List
				contentsList.add(contentsVO);
			}
			return contentsList;
	  }
}
