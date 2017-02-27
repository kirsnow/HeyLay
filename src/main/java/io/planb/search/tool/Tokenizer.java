package io.planb.search.tool;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import io.planb.search.vo.QueryVO;
import io.planb.tools.JsonReader;

public class Tokenizer {

	private final String ipAmazon = "52.34.4.162";
	private final String ipBit = "192.168.1.21";
	private String searchIP = ipBit;
	
	public List<QueryVO> analyzeQuery(String q) {
		List<QueryVO> queryList = null;
		
		try {
			q = URLDecoder.decode(q, "UTF-8");
			q = URLEncoder.encode(q, "UTF-8");
			String restAPI = "http://" + searchIP + ":9200/contents/_analyze?analyzer=korean&pretty=pretty&text=" + q;
			
			JsonReader jsonReader = new JsonReader();
			JSONObject json = jsonReader.readJsonFromUrl(restAPI);
			
			if(json != null) {
				queryList = new ArrayList<QueryVO>();
				
				JSONArray tokens = json.getJSONArray("tokens");
				
				for(int i=0; i<tokens.length(); i++) {
					QueryVO query = new QueryVO();
					JSONObject tokenObj = tokens.getJSONObject(i);
					String token = tokenObj.has("token") ? tokenObj.getString("token") : null;
					token = token.substring(0, token.indexOf('/'));
					String type = tokenObj.has("type") ? tokenObj.getString("type") : null;
					int start = tokenObj.has("start_offset") ? tokenObj.getInt("start_offset") : 0;
					int end = tokenObj.has("end_offset") ? tokenObj.getInt("end_offset") : 0;
					int position = tokenObj.has("position") ? tokenObj.getInt("position") : 0;
					
					query.setToken(token);
					query.setType(type);
					query.setStart(start);
					query.setEnd(end);
					query.setPosition(position);
					
					query = this.setTypeStyle(query);
					
					queryList.add(query);
				}
			}
			
		} catch (JSONException | IOException e) {
			e.printStackTrace();
			return null;
		}
		return queryList;
	}

	public QueryVO setTypeStyle(QueryVO queryVO) {
		switch(queryVO.getType()) {
		
		case "N":
			queryVO.setStyle("text-noun");
			queryVO.setType("명사");
			break;
			
		case "V":
			queryVO.setStyle("text-verb");
			queryVO.setType("동사/형용사");
			break;
		case "VCP":
			queryVO.setStyle("text-verb");
			queryVO.setType("긍정지정사");
			break;
		case "VCN":
			queryVO.setStyle("text-verb");
			queryVO.setType("부정지정사");
			break;
			
		case "I":
			queryVO.setStyle("text-adverb");
			queryVO.setType("감탄사");
			break;
		case "J":
			queryVO.setStyle("text-adverb");
			queryVO.setType("조사");
			break;
		case "M":
			queryVO.setStyle("text-adverb");
			queryVO.setType("부사");
			break;
		case "XR":
			queryVO.setStyle("text-adverb");
			queryVO.setType("어근");
			break;

		case "EP":
			queryVO.setStyle("text-eoj");
			queryVO.setType("선어말어미");
			break;
		case "E":
			queryVO.setStyle("text-eoj");
			queryVO.setType("어미");
			break;
		case "EOJ":
			queryVO.setStyle("text-eoj");
			queryVO.setType("어절");
			break;
			
		case "XP":
			queryVO.setStyle("text-anyfix");
			queryVO.setType("접두사");
		case "XS":
			queryVO.setStyle("text-anyfix");
			queryVO.setType("접미사");
			break;
			
		case "S":
			queryVO.setStyle("text-muted");
			queryVO.setType("부호");
			break;
		case "SL":
			queryVO.setStyle("text-muted");
			queryVO.setType("외국어");
			break;
		case "SH":
			queryVO.setStyle("text-muted");
			queryVO.setType("한자");
			break;
		case "SN":
			queryVO.setStyle("text-muted");
			queryVO.setType("숫자");
			break;
		case "UNK":
			queryVO.setStyle("text-muted");
			queryVO.setType("미지어");
			break;
		default: 
			queryVO.setStyle("text-muted");
			break;
		}
		return queryVO;
	}
}
