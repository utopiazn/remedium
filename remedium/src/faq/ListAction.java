package faq;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;
import bean.FAQBean;
import paging.PagingAction;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class ListAction extends ActionSupport implements SessionAware {

	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<FAQBean> list = new ArrayList<FAQBean>();
	private String searchKey;
	private int searchNum;
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction page; // 페이징 클래스
	private int num = 0;
	private String url ="faqList.action?";
	
	public ListAction() throws IOException {
			
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
			reader.close();
		}
	
	//자주묻는 질문 리스트

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("11111111111111");
		
		list = sqlMapper.queryForList("faq.selectAll");
		 
		System.out.println("size"+list.size());
		
		totalCount = list.size();
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public List<FAQBean> getList() {
		return list;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public PagingAction getPage() {
		return page;
	}

	public int getNum() {
		return num;
	}

	public String getUrl() {
		return url;
	}

	public void setList(List<FAQBean> list) {
		this.list = list;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public void setPage(PagingAction page) {
		this.page = page;
	}

	public void setNum(int num) {
		this.num = num;
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
