package admin.member;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;
import paging.PagingAction;

public class AdminListAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<MemberBean> list = new ArrayList<MemberBean>();
	private String searchKey;
	private int searchNum;
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private PagingAction page; // 페이징 클래스
	private int num = 0;
	
	public AdminListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	@Override
	//가입된 고객들의 리스트
	public String execute() throws Exception {
		
		if(getSearchKey() != null){
			return search();
		}
		
		list = sqlMapper.queryForList("member.selectAll"); // 멤버 회원 전부를 가져옴
		
		totalCount = list.size(); // 회원 수 만큼 토탈 카운트에 넣음
		
		page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
		pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public String search() throws Exception {
		return SUCCESS;
	}

	//관리자 메인페이지
	public String main() throws Exception {
		return SUCCESS;
	}

	public List<MemberBean> getList() {
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

	public void setList(List<MemberBean> list) {
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
	
	
	
	
}
