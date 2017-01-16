package io.planb.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;

public class JsonReader {

  private static String readAll(Reader rd) throws IOException {
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

  public JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
    InputStream is = new URL(url).openStream();
    try {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    } finally {
      is.close();
    }
  }
/*
  public static void main(String[] args) throws IOException, JSONException {
    JSONObject json = readJsonFromUrl("http://192.168.1.4:9200/_all/_search?q=Juliet&pretty=true");
    JSONObject hits = json.getJSONObject("hits");
    JSONObject document = hits.getJSONArray("hits").getJSONObject(0);
    JSONObject source = document.getJSONObject("_source");
    
    System.out.println(json.toString() + "\n");
    
    //Search result
    System.out.println("total: " + hits.getInt("total"));
    System.out.println("max_score: " + hits.getDouble("max_score"));
    
    //Document Meta
    System.out.println("_index: " + document.getString("_index"));
    System.out.println("_type: " + document.getString("_type"));
    System.out.println("_id: " + document.getInt("_id"));
    System.out.println("_score: " + document.getDouble("_score"));
    
    //Document Contents
    System.out.println("title: " + source.getString("title"));
    System.out.println("author: " + source.getString("author"));
    System.out.println("category: " + source.getString("category"));
    System.out.println("written: " + source.getString("written"));
    System.out.println("pages: " + source.getInt("pages"));
    System.out.println("sell: " + source.getInt("sell"));
    System.out.println("plot: " + source.getString("plot"));
  }*/
}