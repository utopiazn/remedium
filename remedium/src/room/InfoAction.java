package room;

import java.io.File;
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

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



public class InfoAction extends ActionSupport {
	
	Log log = LogFactory.getLog(InfoAction.class);

	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	
	
	
	private int roomClass = -1;  // 서브 메뉴 값.
	private int roomClassNum=0;
		
	private List<RoomclassBean> list;  //객실 종류 리스트
	
	private RoomclassBean paramClass;  //객체 받기
	private RoomclassBean resultClass; //객체 반환;
	
	private String room_class; 	//객실종류
	//private String image; 		//사진경로(메인)
	private String content; 	//내용
	private String image2; 		//시설정보
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private PagingAction page; // 페이징 클래스
	private String pagingHtml; // 페이징을 구현한 HTML
	private int num = 0;
	
	
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();


	private String fileUploadPath="c:/java/upload/";
	
	
	public InfoAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	


	public File getUpload1() {
		
		File a = getUploads().get(0);
		
		return a;
	}

	
	public String upload() throws Exception{
		
	
		for (int i = 0; i < uploads.size(); i++) {
			
																			 
			

			System.out.println(uploads.size() +"   " +fileUploadPath +"      " +getUploadsFileName().get(i));

			
			
			String uploadFileName1 = fileUploadPath	+ getUploadsFileName().get(i);
			
			
			
			if(!getUploadsFileName().get(i).equals("")){
				
				File destFile = new File(fileUploadPath	+ getUploadsFileName().get(i));
				FileUtils.copyFile(getUploads().get(i), destFile);
			}
			
			
			
			
			
		      
		    
		      
		      
		    /*File destFile = new File(fileUploadPath
						+ getUploadsFileName().get(i));
						
			System.out.println(destFile.getPath());
		    System.out.println("getUpload:"+getUploads().get(i));
				
			FileUtils.copyFile(getUploads().get(i), destFile);*/
		
			
		}

		return SUCCESS;
		
		
	}
	
	
	
	//기본 객실 클래스와 객실 뷰 값 설정
	public String roomClassCtrl() throws Exception {
		
		
		
		
		//객실 클래스 리스트 /////////////////////////////
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
	
	
	//객실 클래스 개별 뷰호출 함수
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
		
		//객실 클래스 리스트/////////////////////////////
		execute();		
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가
	public String insert() throws Exception {
		
		System.out.println("ddddddddddddddddddd");
		upload();
		System.out.println("sdfdsfsdfdsfdsfdsf");
		
		/*
	    resultClass = (RoomBean)sqlMapper.queryForObject("roomSQL.selectOne", getNo());
	     
	    File destFile = new File(fileUploadPath + getUploadFileName()); //경로 + 파일이름
	 
	    FileUtils.copyFile(getUpload(), destFile);  // 업로드 파일 , 빈파일
	  
	    paramClass.setNo(resultClass.getNo());
	  
	    paramClass.setOrgImage(getUploadFileName());    //원래 이미지 이름
	
	    sqlMapper.update("roomSQL.updateImage", paramClass);
		*/
		
		
		
		
		//기본 객실 클래스와 객실 뷰 값 설정
		roomClassCtrl();				
	
		
		
		
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

/*	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}*/

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

	
	
	
	public List<File> getUploads() {
		return uploads;
	}




	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}




	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}




	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}






	
	
}
