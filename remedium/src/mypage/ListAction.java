package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;
import paging.PagingAction;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class ListAction  extends ActionSupport implements SessionAware {

	private Map session;
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	private String memberID;
	
	private RoomReservationBean paramClass;
	
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
	
	
	//생성자
	public ListAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//예약 리스트
	@Override
	public String execute() throws Exception {
		
		reslist = new ArrayList<RoomReservationBean>();
		
		paramClass = new RoomReservationBean();
		paramClass.setMemberID(getMemberID());
		
		reslist = sqlMapper.queryForList("roomReservationSQL.reslist",paramClass);
		
		
		//페이징처리
		url = "myPageList.action?";
		
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
	
	//마이페이지 메인	
	public String main() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public List<RoomReservationBean> getReslist() {
		return reslist;
	}

	public void setReslist(List<RoomReservationBean> reslist) {
		this.reslist = reslist;
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
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
