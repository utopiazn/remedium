package admin.room;

import java.io.File;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;
import util.ProjectUtil;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class RoomAction extends ActionSupport  implements SessionAware {
	
	private Map session;
	
	private RoomBean paramClass;
	private RoomBean resultClass; 
	
	private int no; // 객실 번호
	private String	name; // 객실 이름
	private int room_size; // 객실 크기
	private int room_capacity; // 객실정원
	private String construction; // 객실 구성
	private String room_comment; // 객실 소개
	private String savImage; // 객실 사진 저장본
	private int price; // 객실 요금
	private String room_class; // 객실 종류
	
	//업로드 관련
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	private String fileUploadPath=(new ProjectUtil().getPath())+"remedium/WebContent/image/roomImage/";
	
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
		paramClass.setPrice(getPrice());
		paramClass.setRoom_class(getRoom_class());
		
		util.ProjectUtil.sqlMapper.insert("roomSQL.insertRoom", paramClass);
		
		paramClass.setSavImage(util.ProjectUtil.getRoomClassImage(getRoom_class()));
		util.ProjectUtil.sqlMapper.update("roomSQL.updateImage", paramClass);
		return SUCCESS;
	}
	
	//객실정보 수정 폼
	public String updForm() throws Exception {
		
		paramClass = new RoomBean();
		resultClass = new RoomBean();
		
		resultClass = (RoomBean)util.ProjectUtil.sqlMapper.queryForObject("roomSQL.selectOne", getNo());
		
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
			paramClass.setPrice(getPrice());
			paramClass.setRoom_class(getRoom_class());
			
			util.ProjectUtil.sqlMapper.update("roomSQL.updateRoom",paramClass);

			paramClass.setSavImage(util.ProjectUtil.getRoomClassImage(getRoom_class()));
			util.ProjectUtil.sqlMapper.update("roomSQL.updateImage", paramClass);
			return SUCCESS;
	}
	
	//객실정보 삭제
	public String delete() throws Exception {
		
		paramClass = new RoomBean();
		resultClass = new RoomBean();
		
		resultClass = (RoomBean) util.ProjectUtil.sqlMapper.queryForObject("roomSQL.selectOne", getNo());
		
		paramClass.setNo(getNo());
		
		util.ProjectUtil.sqlMapper.update("roomSQL.deleteRoom",paramClass);
		
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

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
