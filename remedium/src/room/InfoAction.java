package room;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomclassBean;
import paging.PagingAction;
import util.ProjectUtil;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.interceptor.SessionAware;



public class InfoAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	Log log = LogFactory.getLog(InfoAction.class);

	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	
	
	
	private int roomClass = -1;  // 서브 메뉴 값.
	private int roomClassNum=0;  
		
	private List<RoomclassBean> list;  //객실 종류 리스트
	
	private RoomclassBean paramClass;  //객체 받기
	private RoomclassBean resultClass; //객체 반환;
	
	private String room_class; 	//객실종류
	private String name;
	//private String image; 		//사진경로(메인)
	private String content; 	//내용
	//private String image2; 		//시설정보
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시글 수
	private int blockCount = 10; // 한 페이지 게시글 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private PagingAction page; // 페이징 클래스
	private String pagingHtml; // 페이징을 구현한 HTML
	private int num = 0;
	
	
	private String room_class_Old;  //수정폼에서 기존 room_class id 임시 저장. 
	
	
	private String imageMain="";
	private int imageNum =1;
	
	

	//이미지 메인
	private String image_01 ="";
	private String image_02 ="";
	private String image_03 ="";
	private String image_04 ="";
	private String image_05 ="";	
	
	//시설정보
	private String image_06 ="";		
		
	//사진경로(메인)
	private List<File> uploads = new ArrayList<File>();	
	private List<String> uploadsFileName = new ArrayList<String>();
	
	//시설정보				 
	private File image2;
	private String image2FileName;	

	//파일 업로드 관련 변수
	private String fileUploadPath=(new ProjectUtil().getPath())+"remedium/WebContent/image/roomClassImage/";
	
	
	public InfoAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	/*단일 업로드*/
	public String singleUpload() throws Exception{	
		
		String resultImage2 ="";
			
		System.out.println(uploads.size() +"   " +fileUploadPath +"      "+ image2FileName  +" image2:"+ image2);			
			
		//이미지가 잇을 경우
		if(!image2FileName.equals("")){
		
			resultImage2  = image2FileName;
			
			File fileName = image2;
			String strDestFile = fileUploadPath	+ image2FileName;  
			
			//파일 업로드
			uploadAdd(fileName,strDestFile);																																																																																						
		}else{
			
			if(!image_06.equals("")){
				resultImage2  = image_06;
			}
			
		}

		return resultImage2;
		
	}
	
	/*다중 없로드*/ 
	public String multiUpload() throws Exception{
		
		//메인이미지 경로
		String resultImage ="";		
		int icount =1;
	
		for (int i = 0; i < uploads.size(); i++) {			 

			System.out.println(uploads.size() +"   " +fileUploadPath +"      " +getUploadsFileName().get(i));			
						
			//파일이 선택 되었을 겨우만 업로드 함.
			
			if(!getUploadsFileName().get(i).equals("")){			
				
				// 메인 이미지 경로 리스트 작성  ex) aa.jpg/b.jpg/b.jpg/b.jpg/ddfd.jpg
				if(icount == 1){
					resultImage= getUploadsFileName().get(i);
				}else{
					
					resultImage += "/"+ getUploadsFileName().get(i);	
				}				
				icount++;
							
				File fileName = getUploads().get(i);  //임시 파일 저장 위치 
				String strDestFile = fileUploadPath	+ getUploadsFileName().get(i);  //이미지 자장 경로 위치 ex)C:/Java/github/remedium/WebContent/image/roomClassImage/Penguins.jpg 
				
				//파일 업로드
				uploadAdd(fileName,strDestFile);				
			}else{
				
				if(icount == 1 && !image_01.equals("")){
					
					resultImage=  image_01;
					
				}else if(icount == 2 && !image_02.equals("")){
				
					resultImage += "/"+image_02;
				
				}else if(icount == 3 && !image_03.equals("")){
				
					resultImage += "/"+image_03;
				
				}else if(icount == 4 && !image_04.equals("")){
				
					resultImage += "/"+image_04;
				
				}else if(icount == 5 && !image_05.equals("")){
				
					resultImage += "/"+image_05;
				}
				
				icount++;
				
				
			}
		}
		
		return resultImage;	
	}
	
	//파일 업로드 
	public String uploadAdd(File fileName  ,String strDestFile) throws Exception{
		
		
		//임시 저장 파일 생성 
		File destFile = new File(strDestFile);
		
		//임시 저장된 파일을 지정한 저장위치에  카피
		FileUtils.copyFile(fileName, destFile);

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
	
	//객실 클래스 리스트
	@Override	
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
			
		}		
		
		return SUCCESS;
	}
		
	
	//객실 클래스 개별 뷰
	public String view() throws Exception {		

		
		//객실 클래스 개별 뷰호출 함수
		roomInfo(roomClass);	
			
		return SUCCESS;
	}
	
	
	//객실 클래스 개별 뷰 호출 함수
	public void roomInfo(int roomClass) throws Exception {
	
		if( roomClass > 0 ){			
			
			paramClass = new RoomclassBean();
			resultClass = new RoomclassBean();		
			
			paramClass.setRoom_class(String.valueOf(roomClass));		
	
			resultClass = (RoomclassBean)sqlMapper.queryForObject("roomclassSQL.selectRoomClass", paramClass);
			
			
			System.out.println("--------------객실 클래스 개별 뷰---------------------");
			System.out.println("객실 종류" +resultClass.getRoom_class());
			System.out.println("객실 종류 이름" +resultClass.getName());
			System.out.println("사진경로(메인)" +resultClass.getImage());
			System.out.println("내용" +resultClass.getContent());
			System.out.println("시설정보" +resultClass.getImage2());
			System.out.println("------------------------------------------------");
			
			//메인 이미지를 나누기 위해 사용
			imageSplit(resultClass.getImage());
			
		
			switch (imageNum) {
			case 1:	imageMain = this.image_01;	break;
			case 2:	imageMain = this.image_02;	break;
			case 3:	imageMain = this.image_03;	break;
			case 4:	imageMain = this.image_04;	break;
			case 5:	imageMain = this.image_05;	break;

			default: imageMain = ""; break;
			}
			
		
			
			
			
			System.out.println("--------------사진 이미지 메인---------------------");
			System.out.println("사진1" +getImage_01());
			System.out.println("사진2" +getImage_02());
			System.out.println("사진3" +getImage_03());
			System.out.println("사진4" +getImage_04());
			System.out.println("사진5" +getImage_05());
			System.out.println("------------------------------------------------");
			
		}
		
	}
	
	//메인 이미지를 나누기 위해 사용
	public void imageSplit(String strImage) throws Exception {
		
		if(strImage == null || strImage.equals("")){
			
			System.out.println("이미지 자체가 없음"+strImage);
			
			return ;
		}
		
		StringTokenizer values = new StringTokenizer(strImage+"/","/");
		
		int i =1;
		
		while(values.hasMoreElements()){
			
		
			
			String image =values.nextToken();
		
			
			System.out.println( i+ ":"+ image);
			
			switch (i) {
			case 1:	this.image_01 =image; break;
			case 2:	this.image_02 =image; break;
			case 3:	this.image_03 =image; break;
			case 4:	this.image_04 =image; break;
			case 5:	this.image_05 =image; break;
			default:
				break;
			}			
			i++;
		}
		
	}
	
	
	//객실 클래스를 추가 폼
	public String insForm() throws Exception {
		
		//객실 클래스 리스트/////////////////////////////
		
		roomInfo(roomClass);	
		execute();		
		
		
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가처리
	public String insert() throws Exception {
		
		//메인이미지 처리
		String image=multiUpload();		
		
		//imageSplit(image);
		
		//시설정보
		String image2=singleUpload();
		
		
		System.out.println("결과:  메인이미지 경로:"+image  +"    "+"시설정보 경로"+image2);	
		
		System.out.println("getRoom_class():"+getRoom_class());	
		System.out.println("getName(): "+getName());	
		System.out.println("getContent()"+getContent());	
		System.out.println("image:"+image);	
		System.out.println("image2"+image2);	
			
		
		paramClass = new RoomclassBean();		
		
		paramClass.setRoom_class(getRoom_class());
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setImage(image);
		paramClass.setImage2(image2);
		
		//객실소개 추가
		sqlMapper.insert("roomclassSQL.insertRoomClass", paramClass);

		//기본 객실 클래스와 객실 뷰 값 설정
		roomClassCtrl();					
		
		ProjectUtil rcs = new ProjectUtil(session);		
		rcs.roomClassSession();
		
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정 폼
	public String updForm() throws Exception {
					

		System.out.println("객실 클래스를 수정 폼:"+roomClassNum);
	
		
		//객실 클래스 리스트
		execute();		
		
		//객실 클래스 개별 뷰호출 함수
		roomInfo(roomClassNum);
		
		
		
		
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정
	public String update() throws Exception {
		
		
		/*다중 없로드*/ 
		//메인이미지 처리
		String image=multiUpload();	
		//imageSplit(image);		
		//시설정보
		String image2=singleUpload();
		
		
		System.out.println("Room_class_Old"+getRoom_class_Old());
		System.out.println("Room_class"+getRoom_class());
		System.out.println("Name"+getName());
		System.out.println("Content"+getContent());
		System.out.println("image"+image);
		System.out.println("image2"+image2);
		
		
		paramClass = new RoomclassBean();		
		
		
		paramClass.setRoom_class(getRoom_class());
		paramClass.setName(getName());
		paramClass.setContent(getContent());
		paramClass.setImage(image);
		paramClass.setImage2(image2);
		
		
		sqlMapper.update("roomclassSQL.updateRoomClass",paramClass);
		
		
		//classID 가 변경되었을 경우
		if(!getRoom_class_Old().equals(getRoomClass())){
			
			paramClass.setRoom_class(getRoom_class());
			sqlMapper.update("roomclassSQL.updateRoomClass2",paramClass);
		}
		
		ProjectUtil rcs = new ProjectUtil(session);		
		rcs.roomClassSession();
		
		
		return SUCCESS;
	}
	
	//객실 클래스를 삭제
	public String delete() throws Exception {		
		
		paramClass = new RoomclassBean();				
		
		paramClass.setRoom_class(String.valueOf(getRoomClassNum()));
		
		//객실소개 삭제
		sqlMapper.delete("roomclassSQL.deleteRoomClass",paramClass);

		ProjectUtil rcs = new ProjectUtil(session);		
		rcs.roomClassSession();
		
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRoom_class_Old() {
		return room_class_Old;
	}

	public void setRoom_class_Old(String room_class_Old) {
		this.room_class_Old = room_class_Old;
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

	public String getFileUploadPath() {
		return fileUploadPath;
	}
	
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public File getImage2() {
		return image2;
	}

	public void setImage2(File image2) {
		this.image2 = image2;
	}

	public String getImage2FileName() {
		return image2FileName;
	}

	public void setImage2FileName(String image2FileName) {
		this.image2FileName = image2FileName;
	}

	public String getImage_01() {
		return image_01;
	}

	public void setImage_01(String image_01) {
		this.image_01 = image_01;
	}

	public String getImage_02() {
		return image_02;
	}

	public void setImage_02(String image_02) {
		this.image_02 = image_02;
	}

	public String getImage_03() {
		return image_03;
	}

	public void setImage_03(String image_03) {
		this.image_03 = image_03;
	}

	public String getImage_04() {
		return image_04;
	}

	public void setImage_04(String image_04) {
		this.image_04 = image_04;
	}

	public String getImage_05() {
		return image_05;
	}

	public void setImage_05(String image_05) {
		this.image_05 = image_05;
	}

	public String getImage_06() {
		return image_06;
	}

	public void setImage_06(String image_06) {
		this.image_06 = image_06;
	}	

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public String getImageMain() {
		return imageMain;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}
}
