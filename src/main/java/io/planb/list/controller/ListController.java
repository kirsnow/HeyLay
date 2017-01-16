package io.planb.list.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.planb.list.service.ListServiceImp;
import io.planb.list.vo.ListVO;

@RequestMapping("/list")
@Controller
public class ListController {

   @Autowired
   private ListServiceImp service;
   
   @RequestMapping(value="/sitemap.do")
   public String goToSitemap() {
      return "list/sitemap";
   }
   
   @RequestMapping(value="/category.do")
   public ModelAndView goToCategoryList() {
      List<ListVO> lists = service.getCategoryList();
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("list/list_category");
      mav.addObject("lists", lists);
      return mav;
   }
   
   @RequestMapping(value="/source.do")
   public ModelAndView goToSourceList() {
      List<ListVO> lists = service.getSourceList();
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("list/list_source");
      mav.addObject("lists", lists);
      return mav;
   }
}