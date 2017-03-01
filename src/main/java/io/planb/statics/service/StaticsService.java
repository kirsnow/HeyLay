package io.planb.statics.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.contents.dao.ContentDAO;
import io.planb.contents.vo.ContentsVO;
import io.planb.drawer.service.DrawerService;
import io.planb.drawer.vo.DrawerVO;
import io.planb.keywords.vo.KeywordsVO;
import io.planb.statics.dao.StaticsDAO;
import io.planb.statics.vo.StaticsVO;

@Service
public class StaticsService {
	
	@Autowired
	private StaticsDAO dao;

	@Autowired
	private ContentDAO contentDAO;
	
	@Autowired
	private DrawerService drawerService;

	public List<StaticsVO> selectwordCloudList(int memberNo) {
		List<StaticsVO> wordCloudList = dao.selectWordCloudList(memberNo);
		
		return wordCloudList;
	}

	public List<StaticsVO> selectAllUserWordCloudList(StaticsVO columnName) {
		List<StaticsVO> AllWordCloudList = dao.selectAllUserWordCloudList(columnName);
		
		return AllWordCloudList;
	}
	
	public List<StaticsVO> selectAllSavedSource() {
		List<StaticsVO> staticsList = dao.selectAllSavedSource();
		
		return staticsList;
	}

	public List<StaticsVO> selectAllSourceType() {
		List<StaticsVO> staticsList = dao.selectAllSourceType();
		
		return staticsList;
	}

	public List<StaticsVO> selectAllCntContents() {
		List<StaticsVO> contentStaticsList = dao.selectAllCntContents();
		
		
		return contentStaticsList;
	}
	
	public List<StaticsVO> selectCiteContents() {
		List<StaticsVO> citeStaticsList = dao.selectCiteContents();
		
		return citeStaticsList;
	}

	public List<KeywordsVO> selectAllKeywordList() {
		List<KeywordsVO> allKeywordList = dao.selectAllKeywordList();
		return allKeywordList;
	}

	public List<StaticsVO> selectLikeSource(int no) {
		List<StaticsVO> staticsList = dao.selectLikeSource(no);
		
		return staticsList;
	}
	
	public List<ContentsVO> userStats(int memberNo) {
		List<ContentsVO> savedList = drawerService.getSavedCardsForMember(memberNo);
		List<DrawerVO> drawerList = drawerService.getDrawerList(memberNo, "days");
		
		Map<String, Object> stats = new HashMap<String, Object>();
		stats.put("cards", savedList);
		stats.put("drawerList", drawerList);
		
		return savedList;
	}
	
	public int countTotalSaved(int no) {
		int countTotalSaved = dao.countTotalSaved(no);	
		
		return countTotalSaved;
	}

	public int countTodaySaved(int no) {
		int countTodaySaved = dao.countTodaySaved(no);
		
		return countTodaySaved;
	}

	public int countYesSaved(int no) {
		int countYesSaved = dao.countYesSaved(no);
		
		return countYesSaved;
	}

	public int countBeforeYesSaved(int no) {
		int countBeforeYesSaved = dao.countBeforeYesSaved(no);
		
		return countBeforeYesSaved;
	}
	
	public int sumSavedMonth(int no) {
		int sumSavedMonth = dao.sumSavedMonth(no);
		
		DecimalFormat df = new DecimalFormat("00");
        Calendar currentCalendar = Calendar.getInstance();
        
        String month  = df.format(currentCalendar.get(Calendar.MONTH) + 1);
        
        int averageSavedMonth = sumSavedMonth / Integer.parseInt(month);
        
		return averageSavedMonth;
	}

	public List<ContentsVO> selectSavedMoreSaved(int memberNo) {
		List<StaticsVO> savedMoreSavedNoList = dao.selectSavedMoreSaved(memberNo);
		
		List<ContentsVO> savedMoreSavedList = new ArrayList<>();
		for(StaticsVO staticsvo : savedMoreSavedNoList) {
			ContentsVO vo = new ContentsVO();
			vo.setContentsNo(staticsvo.getNo());
			
			ContentsVO contents = contentDAO.getContents(vo);
			savedMoreSavedList.add(contents);
		}
		
		return savedMoreSavedList;
	}

	public List<ContentsVO> selectSavedLessSaved(int memberNo) {
		List<StaticsVO> savedLessSavedNoList = dao.selectSavedLessSaved(memberNo);
		
		List<ContentsVO> savedLessSavedList = new ArrayList<>();
		for(StaticsVO staticsvo : savedLessSavedNoList) {
			ContentsVO vo = new ContentsVO();
			vo.setContentsNo(staticsvo.getNo());
			
			ContentsVO contents = contentDAO.getContents(vo);
			savedLessSavedList.add(contents);
		}
		
		return savedLessSavedList;
	}

	public List<ContentsVO> selectSavedLike(int memberNo) {
		List<StaticsVO> savedLikeNoList = dao.selectSavedLike(memberNo);
		
		List<ContentsVO> savedLikeList = new ArrayList<>();
		for(StaticsVO staticsvo : savedLikeNoList) {
			ContentsVO vo = new ContentsVO();
			vo.setContentsNo(staticsvo.getNo());
			
			ContentsVO contents = contentDAO.getContents(vo);
			savedLikeList.add(contents);
		}
		
		return savedLikeList;
	}

	public List<StaticsVO> selectSavedMonth(int no) {
		List<StaticsVO> staticsList2 = dao.selectSavedMonth(no);
		
		List<StaticsVO> staticsList = new ArrayList<>();
		for(int i = 1; i <= 12; i++) {
			String label = Integer.toString(i);
			int value = 0;
			for(StaticsVO statics2 : staticsList2) {
				if(i == Integer.parseInt(statics2.getColumnName())) {
					value = statics2.getCnt();
				}
			}
			StaticsVO statics = new StaticsVO(0, label, value, null);
			staticsList.add(statics);
		}
		
		return staticsList;
	}
	
	public int selectNewUserCnt() {
		int newUserCnt = dao.selectNewUserCnt();
		
		return newUserCnt;
	}
	
	public int selectSerachToday() {
		int serachToday = dao.selectSerachToday();
		
		return serachToday;
	}
	
	/*오늘의 인기 키워드 */
	public String selectPopularKeyword() {
		String popularKeyword = dao.selectPopularKeyword();
		
		return popularKeyword;
	}

	public int selectSavedContent() {
		int savedContent = dao.selectSavedContent();
		
		return savedContent;
	}
}
