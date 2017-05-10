package board;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.BoardBean;
import bean.MemberBean;
import paging.PagingAction;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class ListAction extends ActionSupport  implements SessionAware {
	
	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<BoardBean> list = new ArrayList<BoardBean>();
	private String searchKey;
	private int searchNum;
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction page; // 페이징 클래스
	private int num = 0;
	private String url ="boardList.action?"; // 기본적으로 실행되는 URL 입력
	
	
	public ListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의 사항 게시판 리스트 처리
	public String execute() throws Exception {
		
		if(getSearchKey() != null){
			return search();
		}
		
		list = sqlMapper.queryForList("board.selectAll"); // 멤버 회원 전부를 가져옴
		
		// 페이징 처리 할때 필요한 부분
		totalCount = list.size(); // 회원 수 만큼 토탈 카운트에 넣음
		
		System.out.println("url : " + url);
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "", url);
		pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
		
		System.out.println("시작:"+page.getEndCount());
		
		System.out.println("paging : " + pagingHtml.substring(getTotalCount()));
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}	
		
		list = list.subList(page.getStartCount(), lastCount);
		
		int count = list.size();
		
		for(BoardBean no : list){
			
			no.setListNo(count--);
		}
		// 페이징 처리 할때 필요한 부분 
	
		return SUCCESS;
	}
	
	
	//게시판 검색 기능
	public String search() throws Exception {
		
		if(searchNum == 1){
			list = sqlMapper.queryForList("board.selectName", "%"+getSearchKey()+"%");
		}
		if(searchNum == 0){
			list = sqlMapper.queryForList("board.selectSubject", "%"+getSearchKey()+"%");
		}
		totalCount = list.size();
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKey());
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		int count = list.size();
		
		for(BoardBean no : list){
			
			no.setListNo(count--);
			
		}
		return SUCCESS;
		

	}

	public List<BoardBean> getList() {
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

	public void setList(List<BoardBean> list) {
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
