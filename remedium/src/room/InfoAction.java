package room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;
import bean.RoomclassBean;

public class InfoAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public InfoAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	private int roomClass = -1;
		
	private List<RoomclassBean> list;  //객실 종류 리스트
	
	private RoomclassBean paramClass;
	private RoomclassBean resultClass;
	
	private String room_class; 	//객실종류
	private String image; 		//사진경로(메인)
	private String content; 	//내용
	private String image2; 		//시설정보
	
	
	public String roomClassCtrl() throws Exception {
		
		
		System.out.println(roomClass);
		
		//객실 클래스 리스트/////////////////////////////
		list = new ArrayList<RoomclassBean>();
		
		if( roomClass >= 0 ){
			
			list = sqlMapper.queryForList("roomclassSQL.selectAll");
			
			System.out.println(list.size());
		}
		
		
		//객실 클래스 개별 뷰///////////////////////////		
		if( roomClass > 0 ){			
		
			paramClass = new RoomclassBean();
			resultClass = new RoomclassBean();		
			
			paramClass.setRoom_class(String.valueOf(roomClass));		
	
			resultClass = (RoomclassBean)sqlMapper.queryForObject("roomclassSQL.selectRoomClass", paramClass);
		}
			
		return SUCCESS;
	}
	
	
	
	
	@Override
	//객실 클래스 리스트
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스 개별 뷰
	public String view() throws Exception {
		
		return SUCCESS;
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
	
	
	
	
}
