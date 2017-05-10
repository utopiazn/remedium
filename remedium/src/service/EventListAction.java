package service;



import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.EventBean;
import paging.PagingAction;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class EventListAction extends ActionSupport implements SessionAware {

	private Map session;
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	//리스트 선언 list

	private List<EventBean> list = new ArrayList<EventBean>();
	private int no;
	private String name;
	private Date firstdate;
	private Date lastdate;
	
	private int currentPage=1;
	private int totalCount;
	private int blockCount =10;
	private int blockPage = 5;
	private String pagingHtml;
	private PagingAction page;
	private int num;

	
	//생성자
	public EventListAction() throws IOException{
		
	
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//이벤트들의 목록
	@Override
	public String execute() throws Exception {
		
		totalCount = list.size();
		
		list = sqlMapper.queryForList("event.selectAll");
				
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString();
		

		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
	
		//list = list.subList(page.getStartCount(), lastCount);
		
		int count = list.size();
		
		for(EventBean num : list){
			num.setListNo(count--);
		}
		
		return SUCCESS;
	}

	public List<EventBean> getList() {
		return list;
	}

	public void setList(List<EventBean> list) {
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

	public Date getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}

	public Date getLastdate() {
		return lastdate;
	}

	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
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
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
	
	

	
}
