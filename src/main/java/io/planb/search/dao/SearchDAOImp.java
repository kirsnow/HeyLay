package io.planb.search.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;

import io.planb.search.vo.SearchVO;
import io.planb.tools.JsonReader;

@Repository
public class SearchDAOImp {

	public List<SearchVO> searchResult(SearchVO searchVO) throws JSONException, IOException {
		
		JsonReader jsonReader = new JsonReader();
		JSONObject json = jsonReader.readJsonFromUrl(searchVO.getHostIP() + ":9200/_all/_search?pretty=true&q=" + searchVO.getSearchQuery());
	    JSONObject hits = json.getJSONObject("hits");
	    JSONObject document = hits.getJSONArray("hits").getJSONObject(0);
	    JSONObject source = document.getJSONObject("_source");
	    
	    System.out.println(json.toString() + "\n");
	    SearchVO searchResult = new SearchVO();
	    //Search result
	    searchResult.setTotal(hits.getInt("total"));
	    searchResult.setMaxScore(hits.getDouble("max_score"));
	    
	    //Document Contents
	    searchResult.setTitle(source.getString("title"));
	    searchResult.setSource(source.getString("author"));
	    searchResult.setContent(source.getString("plot"));
	    
	    List<SearchVO> searchResults = new ArrayList<>();
	    searchResults.add(searchResult);
		
		return searchResults;
	}
}
