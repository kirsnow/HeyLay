package io.planb.memo.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.planb.memo.dao.MemoDAOImp;
import io.planb.memo.vo.MemoVO;

@Service
public class MemoServiceImp {
	
	@Autowired
	private MemoDAOImp dao;
	
	public MemoVO addMemo(MemoVO memo) {
		
		//다음 memoNo 추출
		int nextMemoNo = dao.getNextMemoNo();
		memo.setNo(nextMemoNo);
		
		//DB에 메모 추가
		dao.addMemo(memo);
		
		//추가한 메모 정보
		MemoVO added = getMemo(nextMemoNo);
		return added;
	}
	
	public String addMemoAjax(int memberNo, int contentsNo, String memoMessage) {
		MemoVO memo = new MemoVO();
		memo.setMemberNo(memberNo);
		memo.setContentsNo(contentsNo);
		memo.setMessage(memoMessage);
		
		MemoVO added = this.addMemo(memo);
		String memoTag = this.setMemoVOtoHTML(added);
		
		return memoTag;
	}
	
	public MemoVO getMemo(int no) {
		MemoVO memo = dao.getMemo(no);
		return memo;
	}
	
	public List<MemoVO> getMemoList(int contentsNo) {
		List<MemoVO> memoList = dao.getMemoList(contentsNo);
		return memoList;
	}
	
	public MemoVO editMemo(MemoVO memo) {
		dao.editMemo(memo);
		MemoVO edited = getMemo(memo.getNo());
		return edited;
	}
	
	public void delMemo(int no) {
		dao.delMemo(no);
	}

	public JSONObject setMemoVOtoJSON(MemoVO memo) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("no", memo.getNo());
		jsonObj.put("contentsNo", memo.getContentsNo());
		jsonObj.put("contentsTitle", memo.getContentsTitle());
		jsonObj.put("memberNo", memo.getMemberNo());
		jsonObj.put("firstName", memo.getFirstName());
		jsonObj.put("lastName", memo.getLastName());
		jsonObj.put("message", memo.getMessage());
		jsonObj.put("regDate", memo.getRegDate());
		jsonObj.put("ban", memo.getBan());
		
		return jsonObj;
	}
	
	public String setMemoVOtoHTML(MemoVO memo) {
		String memoHtmlTag = null;
		
		if(memo.getBan().equals("N")) {
			memoHtmlTag =  "<!-- memo -->";
			memoHtmlTag += "<div id=\"" + memo.getNo() + "\" class=\"mdl-card mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-shadow--3dp\">";
			memoHtmlTag += "	<div class=\"mdl-card__title mdl-color-text--grey-500\">";
			memoHtmlTag += "		<h5 class=\"author mdl-card__title-text\">";
			memoHtmlTag += 				memo.getLastName() + " " + memo.getFirstName();
			memoHtmlTag += "		</h5>";
			memoHtmlTag += "	</div>";
			memoHtmlTag += "	<div class=\"content mdl-card__supporting-text mdl-color-text--grey-800\">";
			memoHtmlTag += "		<p id=\"" + memo.getNo() + "\" class=\"message text-justify\">";
			memoHtmlTag += 				memo.getMessage();
			memoHtmlTag += "		</p>";
			memoHtmlTag += "	</div>";
			memoHtmlTag += "	<div class=\"mdl-card__menu\">";
			memoHtmlTag += "		<div id=\"report\" class=\"btn-group dropdown pull-right\" title=\"신고\">";
			memoHtmlTag += "			<a href=\"#\" role=\"button\" class=\"dropdown-toggle mdl-color-text--grey-500\" data-toggle=\"dropdown\" aria-expanded=\"false\" title=\"메모 관리\">";
			memoHtmlTag += "				<i class=\"fa fa-bars fa-lg\" aria-hidden=\"true\"></i>";
			memoHtmlTag += "			</a>";
			memoHtmlTag += "			<ul class=\"dropdown-menu\" role=\"menu\">";
			memoHtmlTag += "				<li>";
			memoHtmlTag += "					<a href=\"#\" id=\"" + memo.getNo() + "\" class=\"editMemo\" role=\"button\" title=\"메모 수정\">";
			memoHtmlTag += "						<i class=\"fa fa-pencil fa-fw\" aria-hidden=\"true\"></i> 수정";
			memoHtmlTag += "					</a>";
			memoHtmlTag += "				</li>";
			memoHtmlTag += "				<li>";
			memoHtmlTag += "					<a href=\"#\" id=\"" + memo.getNo() + "\" class=\"delMemo\" role=\"button\" title=\"메모 삭제\">";
			memoHtmlTag += "						<i class=\"fa fa-trash fa-fw\" aria-hidden=\"true\"></i> 삭제";
			memoHtmlTag += "					</a>";
			memoHtmlTag += "				</li>";
			memoHtmlTag += "				<li role=\"presentation\" class=\"divider\"></li>";
			memoHtmlTag += "				<li>";
			memoHtmlTag += "					<a href=\"${ pageContext.request.contextPath }/contact/bug.do?no=" + memo.getNo() + "&type=memo\" title=\"오류 신고\">";
			memoHtmlTag += "						<i class=\"fa fa-bug fa-fw\" aria-hidden=\"true\"></i> 오류 신고";
			memoHtmlTag += "					</a>";
			memoHtmlTag += "				</li>";
			memoHtmlTag += "			</ul>";
			memoHtmlTag += "		</div>";
			memoHtmlTag += "	</div>";
			memoHtmlTag += "</div>";
			memoHtmlTag += "<!-- /memo -->";
		}
		
		return memoHtmlTag;
	}

}
