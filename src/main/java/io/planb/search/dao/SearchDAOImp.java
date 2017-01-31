package io.planb.search.dao;

import java.io.IOException;
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
		
		try {
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl("http://" + host + ":9200/_all/_search?pretty=true&q=" + q);
			JSONObject hits = json.getJSONObject("hits");
			
			//Search result
			int total = hits.getInt("total");
			
			if(total == 0) {
				
				return null;
				
			} else {
				searchResult = new SearchVO();
				searchResult.setQuery(q);
				searchResult.setTotal(total);
				searchResult.setMaxScore(hits.getDouble("max_score"));
				
				List<ContentsVO> contentsList = new ArrayList<ContentsVO>();
				
				for(int i=0; i<total; i++) {
					JSONObject document = hits.getJSONArray("hits").getJSONObject(i).getJSONObject("_source");
					
					//Document Contents
					int no			   = document.getInt("no") < 1 ? 1 : document.getInt("no");
					String title	   = document.getString("title")		 == null ? null : document.getString("title");
					String summary	   = document.getString("summary")		 == null ? null : document.getString("summary");
					String url		   = document.getString("url")			 == null ? null : document.getString("url");
					String lastScraped = document.getString("lastScraped")	 == null ? null : document.getString("lastScraped");
					String ban		   = document.getString("ban")			 == null ? null : document.getString("ban");
					
					String source	 = document.getString("source")	   == null ? null : document.getString("source");
					String sourceUrl = document.getString("sourceUrl") == null ? null : document.getString("sourceUrl");
					String category	 = document.getString("category")  == null ? null : document.getString("category");
					String dataType	 = document.getString("dataType")  == null ? null : document.getString("dataType");
					
					int saveCnt		 = document.getInt("saveCnt")	> 0 ? document.getInt("saveCnt")   : 0;
					int reportCnt	 = document.getInt("reportCnt") > 0 ? document.getInt("reportCnt") : 0;
					int likeCnt		 = document.getInt("likeCnt")	> 0 ? document.getInt("likeCnt")   : 0;
					int viewCnt		 = document.getInt("viewCnt")	> 0 ? document.getInt("viewCnt")   : 0;
					
					//Save search result to ContentsVO
					ContentsVO contentsVO = new ContentsVO();
					contentsVO.setNo(no);
					contentsVO.setTitle(title);
					contentsVO.setSummary(summary);
					contentsVO.setUrl(url);
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

	public ContentsVO getContents(int contentsNo) {
		
		ContentsVO contents = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contents;
	}

	public List<MemoVO> getMemo(int contentsNo) {
		List<MemoVO> memoList = sqlSessionTemplate.selectList("io.planb.serach.dao.SearchDAO.selectMemoByNo", contentsNo);
		return memoList;
	}
}
