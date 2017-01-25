package io.planb.search.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.planb.search.vo.SearchVO;
import io.planb.tools.JsonReader;

@Repository
public class SearchDAOImp {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<SearchVO> searchResult(SearchVO searchVO) throws JSONException, IOException {
		
		JsonReader jsonReader = new JsonReader();
		JSONObject json = jsonReader.readJsonFromUrl(searchVO.getHostIP() + ":9200/_all/_search?pretty=true&q=" + searchVO.getSearchQuery());
	    JSONObject hits = json.getJSONObject("hits");
	    
	    System.out.println(json.toString() + "\n");
	    
	    //Search result
	    int total = hits.getInt("total");
	    if(total == 0) {
	    	
	    	return null;
	    	
	    } else {
	    	JSONObject document = hits.getJSONArray("hits").getJSONObject(0);
	    	JSONObject source = document.getJSONObject("_source");
	    	SearchVO searchResult = new SearchVO();
	    	searchResult.setTotal(total);
	    	searchResult.setMaxScore(hits.getDouble("max_score"));
	    	
	    	//Document Contents
	    	searchResult.setTitle(source.getString("title"));
	    	searchResult.setSource(source.getString("author"));
	    	searchResult.setContent(source.getString("plot"));
	    	
	    	List<SearchVO> searchResults = new ArrayList<SearchVO>();
	    	searchResults.add(searchResult);
	    	
	    	return searchResults;
	    }
	}

	public SearchVO getContents(int contentsNo) {
		
		SearchVO contents = sqlSessionTemplate.selectOne("io.planb.serach.dao.SearchDAO.selectContentsByNo", contentsNo);
		return contents;
	}
}
