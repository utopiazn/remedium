package room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomclassBean;
import paging.PagingAction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import paging.PagingAction;

public class InfoAction extends ActionSupport {
	
	Log log = LogFactory.getLog(InfoAction.class);

	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public InfoAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	private int roomClass = -1;  // 서브 메뉴 값.
	private int roomClassNum=0;
		
	private List<RoomclassBean> list;  //객실 종류 리스트
	
	private RoomclassBean paramClass;  //객체 받기
	private RoomclassBean resultClass; //객체 반환;
	
	private String room_class; 	//객실종류
	private String image; 		//사진경로(메인)
	private String content; 	//내용
	private String image2; 		//시설정보
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private PagingAction page; // 페이징 클래스
	private String pagingHtml; // 페이징을 구현한 HTML
	private int num = 0;
	
	
	public String roomClassCtrl() throws Exception {
		
		
		//System.out.println(roomClass);
		
		//객실 클래스 리스트/////////////////////////////
		execute();		
		
		//객실 클래스 개별 뷰///////////////////////////		
		view();
			
		return SUCCESS;
	}
	
	
	
	
	@Override
	//객실 클래스 리스트
	public String execute() throws Exception {
		
		list = new ArrayList<RoomclassBean>();
		
		if( roomClass >= 0 ){
			
			list = sqlMapper.queryForList("roomclassSQL.selectAll");
			
			totalCount = list.size(); // 회원 수 만큼 토탈 카운트에 넣음
			page = new PagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
			pagingHtml = page.getPagingHtml().toString(); 	//페이지 HTML 생성
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount) {
				lastCount = page.getEndCount() + 1;
			}
			
			list = list.subList(page.getStartCount(), lastCount);
			
			//System.out.println(list.size());
		}
		
		
		return SUCCESS;
	}
	
	
	
	
	//객실 클래스 개별 뷰
	public String view() throws Exception {
		

		roomInfo(roomClass);
			
		return SUCCESS;
	}
	
	public void roomInfo(int roomClass) throws Exception {
		
		

		if( roomClass > 0 ){			
			
			paramClass = new RoomclassBean();
			resultClass = new RoomclassBean();		
			
			paramClass.setRoom_class(String.valueOf(roomClass));		
	
			resultClass = (RoomclassBean)sqlMapper.queryForObject("roomclassSQL.selectRoomClass", paramClass);
		}
		
	}
	
	//객실 클래스를 추가 폼
	public String insForm() throws Exception {
		
	
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가
	public String insert() throws Exception {
		
		
	
		
		
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정 폼
	public String updForm() throws Exception {
		
		execute();
		
		System.out.println(roomClassNum);
		
		roomInfo(roomClassNum);
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정
	public String update() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 삭제
	public String delete() throws Exception {
		
		return SUCCESS;
	}

	public int getRoomClass() {
		return roomClass;
	}

	public void setRoomClass(int roomClass) {
		this.roomClass = roomClass;
	}

	public List<RoomclassBean> getList() {
		return list;
	}

	public void setList(List<RoomclassBean> list) {
		this.list = list;
	}

	public RoomclassBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomclassBean paramClass) {
		this.paramClass = paramClass;
	}

	public String getRoom_class() {
		return room_class;
	}

	public void setRoom_class(String room_class) {
		this.room_class = room_class;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}




	public RoomclassBean getResultClass() {
		return resultClass;
	}




	public void setResultClass(RoomclassBean resultClass) {
		this.resultClass = resultClass;
	}




	public String getPagingHtml() {
		return pagingHtml;
	}




	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}




	public int getRoomClassNum() {
		return roomClassNum;
	}




	public void setRoomClassNum(int roomClassNum) {
		this.roomClassNum = roomClassNum;
	}
	
	
	
	
}
