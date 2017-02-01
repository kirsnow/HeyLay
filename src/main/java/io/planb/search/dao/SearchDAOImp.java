package io.planb.search.dao;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.contents.vo.ContentsVO;
import io.planb.memo.vo.MemoVO;
import io.planb.search.vo.SearchVO;
import io.planb.tools.JsonReader;

@Repository
public class SearchDAOImp {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public SearchVO searchResult(String q, String host) {
		
		SearchVO searchResult = null;
		int searchSize = 100;
		
		try {
			String restAPI = "http://" + host + ":9200/_all/_search?pretty=true&size=" + searchSize + "&q="
					+ URLEncoder.encode(q, "UTF-8");
			System.out.println(restAPI);
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl(restAPI);
			JSONObject hits = json.getJSONObject("hits");
			
			//Search result
			int total = hits.has("total") ? hits.getInt("total") : 0;
			System.out.println(total);
			System.out.println(json);
			if(total == 0) {
				
				return null;
				
			} else {
				searchResult = new SearchVO();
				searchResult.setQuery(q);
				if(total > searchSize) total = searchSize;	//엘라스틱 서치 설정 확인 중 (현재 10건 이상 검색되지 않음)
				searchResult.setTotal(total);
				searchResult.setMaxScore(hits.getDouble("max_score"));
				
				List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
				
				for(int i=0; i<total; i++) {
					JSONObject document = hits.getJSONArray("hits").getJSONObject(i).getJSONObject("_source");
					
					//Document Contents
					int no			   = document.has("no")				 ? document.getInt("no")				 : 1;
					String title	   = document.has("title")			 ? document.getString("title")			 : null;
					String summary	   = document.has("summary")		 ? document.getString("summary")		 : null;
					String url		   = document.has("url")			 ? document.getString("url")			 : null;
					String imgUrl	   = document.has("img_url")			 ? document.getString("img_url")	 : null;
					String lastScraped = document.has("last_scraped")	 ? document.getString("last_scraped")	 : null;
					String ban		   = document.has("ban")			 ? document.getString("ban")			 : null;
					
					String source	 = document.has("sourceName")		 ? document.getString("sourceName")		 : "source";
					String sourceUrl = document.has("sourceUrl")		 ? document.getString("sourceUrl")		 : null;
					String category	 = document.has("categoryName")		 ? document.getString("categoryName")	 : "category";
					String dataType	 = document.has("dataType")			 ? document.getString("dataType")		 : "dataType";
					
					int saveCnt		 = document.has("saveCnt")	 ? document.getInt("saveCnt")	 : 0;
					int reportCnt	 = document.has("reportCnt") ? document.getInt("reportCnt")	 : 0;
					int likeCnt		 = document.has("likeCnt")	 ? document.getInt("likeCnt")	 : 0;
					int viewCnt		 = document.has("view_cnt")	 ? document.getInt("view_cnt")	 : 0;
					
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
				searchResult.setContents(contentsList);
			}
			
		} catch(JSONException | IOException e) {
			e.printStackTrace();
		}
		
		return searchResult;
	}
	
	public void saveKeyword(SearchVO searchResult) {
		sqlSessionTemplate.insert("io.planb.serach.dao.SearchDAO.insertKeyword", searchResult);
		
	}

	public ContentsVO getContents(int contentsNo) {
		
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contents;
	}

	public List<MemoVO> getMemo(int contentsNo) {
		List<MemoVO> memoList = sqlSessionTemplate.selectList("io.planb.serach.dao.SearchDAO.selectMemoByNo", contentsNo);
		return memoList;
	}
}
