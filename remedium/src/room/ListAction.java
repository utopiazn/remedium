package room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;
import bean.RoomReservationBean;
import paging.PagingAction;

public class ListAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<RoomBean> list;
	private RoomReservationBean paramClass;
	
	//날짜검색 변수선언
	private String firstDate;
	private String lastDate;
	private int people;
	
	//페이징처리 변수선언
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 5; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction page; // 페이징 클래스
	private int num = 0;
	private String url;
	
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	//검색된 객실 리스트
	public String execute() throws Exception {
		
		list = new ArrayList<RoomBean>();
		paramClass = new RoomReservationBean();
		paramClass.setFirstDate(java.sql.Date.valueOf(firstDate));
		paramClass.setLastDate(java.sql.Date.valueOf(lastDate));
		paramClass.setPeople(people);
		
		if(people==0){
			list = sqlMapper.queryForList("roomSQL.selectSerchGroup", paramClass);
		}else{
			list = sqlMapper.queryForList("roomSQL.selectSerch", paramClass);
		}
		
		
		//페이징처리
		url = "roomList.action?";
		
		totalCount = list.size(); // 회원 수 만큼 토탈 카운트에 넣음
		
		System.out.println("url : " + url);
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", url);
		pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
		
		System.out.println("paging : " + pagingHtml);
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	//모든 객실 리스트(관리자)
	public String all() throws Exception {
		
		list = new ArrayList<RoomBean>();
		
		list = sqlMapper.queryForList("roomSQL.selectAll");
		
		
		//페이징처리
		url = "roomAllList.action?";
		
		totalCount = list.size(); // 회원 수 만큼 토탈 카운트에 넣음
		
		System.out.println("url : " + url);
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", url);
		pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
		
		System.out.println("paging : " + pagingHtml);
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public List<RoomBean> getList() {
		return list;
	}

	public void setList(List<RoomBean> list) {
		this.list = list;
	}

	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public RoomReservationBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomReservationBean paramClass) {
		this.paramClass = paramClass;
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


