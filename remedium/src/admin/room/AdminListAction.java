package admin.room;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;
import paging.PagingAction;

public class AdminListAction extends ActionSupport{
		
	private List<RoomReservationBean> reslist;
	
	//페이징처리 변수선언
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 5; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction page; // 페이징 클래스
	private int num = 0;
	private String url;
	
	
	@Override
	//고객이 요청한 예약객실 리스트
	public String execute() throws Exception {

		reslist = new ArrayList<RoomReservationBean>();
		
		reslist = util.ProjectUtil.sqlMapper.queryForList("roomReservationSQL.adminlist");
		
		//페이징처리
		url = "roomAllList.action?";
		
		totalCount = reslist.size(); // 회원 수 만큼 토탈 카운트에 넣음
		
		System.out.println("url : " + url);
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", url);
		pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
		
		System.out.println("paging : " + pagingHtml);
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		reslist = reslist.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public List<RoomReservationBean> getReslist() {
		return reslist;
	}

	public void setReslist(List<RoomReservationBean> reslist) {
		this.reslist = reslist;
	}
	
	//페이징
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
