package io.planb.test;

import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/*
 * Sample from
 * http://jeonguk.tistory.com/entry/java에서-손쉽게-JSON을-사용한다-JSONsimple-example-–-Read-and-write-JSON
 */
public class JsonSimpleWriter {

	public static void main(String[] args) {
		 
		JSONObject obj = new JSONObject();
		obj.put("name", "JKKIM");
		obj.put("age", new Integer(32));
	 
		JSONArray list = new JSONArray();
		list.add("msg like this");
		list.add("ajax test");
		list.add("okk");
	 
		obj.put("messages", list);
	 
		try {
	 
			FileWriter file = new FileWriter("C:\\Users\\Junn\\Documents\\test.json");
			file.write(obj.toJSONString());
			file.flush();
			file.close();
	 
		} catch (IOException e) {
			e.printStackTrace();
		}
	 
		System.out.print(obj);
	 
	     }
}
