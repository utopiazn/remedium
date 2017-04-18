package admin.room;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;

public class RoomAction extends ActionSupport{
	
	private RoomBean paramClass;
	private RoomBean resultClass; 
	
	private int no; // 객실 번호
	private String	name; // 객실 이름
	private int room_size; // 객실 크기
	private int room_capacity; // 객실정원
	private String construction; // 객실 구성
	private String room_comment; // 객실 소개
	private String orgImage; // 객실 사진 원본
	private String savImage; // 객실 사진 저장본
	private int price; // 객실 요금
	private String room_class; // 객실 종류
	
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public RoomAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//객실정보 추가 폼
		public String insForm() throws Exception {
			return SUCCESS;
		}
	
	@Override
	//객실정보 추가
	public String execute() throws Exception {
		
		paramClass = new RoomBean();
		resultClass = new RoomBean();
		
		paramClass.setNo(getNo());
		paramClass.setName(getName());
		paramClass.setRoom_size(getRoom_size());
		paramClass.setRoom_capacity(getRoom_capacity());
		paramClass.setConstruction(getConstruction());
		paramClass.setRoom_comment(getRoom_comment());
		paramClass.setOrgImage("미구현");
		paramClass.setSavImage("미구현");
		paramClass.setPrice(getPrice());
		paramClass.setRoom_class(getRoom_class());
		
		sqlMapper.insert("roomSQL.insertRoom", paramClass);
		
		return SUCCESS;
	}
	
	//객실정보 수정 폼
	public String updForm() throws Exception {
		
		paramClass = new RoomBean();
		resultClass = new RoomBean();
		
		resultClass = (RoomBean)sqlMapper.queryForObject("roomSQL.selectOne", getNo());
		
		return SUCCESS;
	}
	
	//객실정보 수정
		public String update() throws Exception {
			
			paramClass = new RoomBean();
			resultClass = new RoomBean();
			
			paramClass.setNo(getNo());
			paramClass.setName(getName());
			paramClass.setRoom_size(getRoom_size());
			paramClass.setRoom_capacity(getRoom_capacity());
			paramClass.setConstruction(getConstruction());
			paramClass.setRoom_comment(getRoom_comment());
			paramClass.setOrgImage("미구현");
			paramClass.setSavImage("미구현");
			paramClass.setPrice(getPrice());
			paramClass.setRoom_class(getRoom_class());
			
			sqlMapper.update("roomSQL.updateRoom",paramClass);
			
			return SUCCESS;
	}
	
	//객실정보 삭제
	public String delete() throws Exception {
		
		paramClass = new RoomBean();
		resultClass = new RoomBean();
		
		resultClass = (RoomBean) sqlMapper.queryForObject("roomSQL.selectOne", getNo());
		
		paramClass.setNo(getNo());
		
		sqlMapper.update("roomSQL.deleteRoom",paramClass);
		
		return SUCCESS;
	}

	public RoomBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomBean paramClass) {
		this.paramClass = paramClass;
	}

	public RoomBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RoomBean resultClass) {
		this.resultClass = resultClass;
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

	public int getRoom_size() {
		return room_size;
	}

	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}

	public int getRoom_capacity() {
		return room_capacity;
	}

	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}

	public String getConstruction() {
		return construction;
	}

	public void setConstruction(String construction) {
		this.construction = construction;
	}

	public String getRoom_comment() {
		return room_comment;
	}

	public void setRoom_comment(String room_comment) {
		this.room_comment = room_comment;
	}

	public String getOrgImage() {
		return orgImage;
	}

	public void setOrgImage(String orgImage) {
		this.orgImage = orgImage;
	}

	public String getSavImage() {
		return savImage;
	}

	public void setSavImage(String savImage) {
		this.savImage = savImage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRoom_class() {
		return room_class;
	}

	public void setRoom_class(String room_class) {
		this.room_class = room_class;
	}
	
	
}
