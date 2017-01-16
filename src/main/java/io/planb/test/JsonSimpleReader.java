package io.planb.test;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
/*
 * Sample from
 * (ENG) https://code.google.com/archive/p/json-simple/
 * (KOR) http://jeonguk.tistory.com/entry/java에서-손쉽게-JSON을-사용한다-JSONsimple-example-–-Read-and-write-JSON
 * (GitHub) 
 */
public class JsonSimpleReader {
	public static void main(String[] args) {
		 
		JSONParser parser = new JSONParser();
	 
		try {
	 
			Object obj = parser.parse(new FileReader("C:\\Users\\Junn\\Documents\\test.json"));
	 
			JSONObject jsonObject = (JSONObject) obj;
	 
			String name = (String) jsonObject.get("name");
			System.out.println("name: " + name);
	 
			long age = (Long) jsonObject.get("age");
			System.out.println("age: " + age);
	 
			// loop array
			JSONArray msg = (JSONArray) jsonObject.get("messages");
			System.out.println("messages");
			Iterator<String> iterator = msg.iterator();
			while (iterator.hasNext()) {
				System.out.println(": " + iterator.next());
			}
	 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	 
	     }
}
