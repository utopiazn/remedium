package service;


import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import bean.FacilitiesBean;
import paging.PagingAction;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class FacilitiesListAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	private List<FacilitiesBean> list;
	private int no;
	private String name;
	private String time;
	
	private int currentPage=1;
	private int totalCount;
	private int blockCount =10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private int num;
	private String url;
	

	
	//편의시설 리스트
	@Override
	public String execute() throws Exception {

		list = new ArrayList<FacilitiesBean>();
		
		list = util.ProjectUtil.sqlMapper.queryForList("facilitiesSQL.selectAll");
		
	
		//페이징
		
		url = "facilitiesList.action?";
		
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



	public List<FacilitiesBean> getList() {
		return list;
	}



	public void setList(List<FacilitiesBean> list) {
		this.list = list;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}



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
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
	

}
