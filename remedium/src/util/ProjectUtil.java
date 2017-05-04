package util;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import bean.ImageBean;
import bean.RoomBean;
import bean.RoomclassBean;


import com.opensymphony.xwork2.ActionSupport;

public class ProjectUtil extends ActionSupport implements SessionAware{
	
	
	//sql문 연동을 위한 구문
	private static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	//static영역 sqlMapper 생성
	private static ProjectUtil projectUtil = new ProjectUtil("sql"); 
	
	public static ProjectUtil InterfaceAction(){
		return projectUtil;
	}
	private ProjectUtil(String a){
		createXML();
	}
	
	private void createXML(){
		try{	
			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
			reader.close();
		}catch(IOException e){}
	}
	
	
	
	
	
	
	
	
	// 현재 날짜 : jsp에서 쓰기워한 로직 클래스 객체 생성후 currentDate변수를 그냥 가져다 쓰자.
	public String currentDate = null; 
	public ProjectUtil(){
		currentDate = getDate();
	}
	public String getCurrentDate() { return currentDate;	}
	public void setCurrentDate(String currentDate){ this.currentDate = currentDate; }
	
	
	
	
	//session 설정
	/*private Map session;
	
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}*/
	
	
	/*private List<RoomclassBean> list;
	
	public void  putRC() throws Exception{
		
	 list = new ArrayList<RoomclassBean>();
		
		list = sqlMapper.queryForList("roomclassSQL.selectAll");
		
		
		
		this.session.put("RClist", list);
		
		
	}*/
	
	
	
	
	
	
	//객실 소개 이름 리스트 session 저장로직///////////////////////////
	
	private Map session;
	private List<RoomclassBean> list2;
	
	
	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session =session;
	} 
	
	public ProjectUtil(Map session) throws IOException {		
		
		createXML();
		/*reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
		reader.close();*/		
		this.session =session;
	}
	
	
	public void roomClassSession() throws Exception{
		
		list2 = new ArrayList<RoomclassBean>();
		
		list2 = sqlMapper.queryForList("roomclassSQL.selectAll");
			
		
		System.out.println(list2.size());
		this.session.put("RClist", list2);	
		
		
	}
	/////////////////////////////////////////////////////////////
	
	//클래스에 저장된 시설정보이미지 가져오기
	public static String getRoomClassInfo(String room_class) throws Exception{
		
		RoomclassBean paramClass = new RoomclassBean();
		RoomclassBean resultClass = new RoomclassBean();	
		
		paramClass.setRoom_class(room_class);
		 

		resultClass = (RoomclassBean)sqlMapper.queryForObject("roomclassSQL.selectRoomClass", paramClass);
		
		return resultClass.getImage2();
	}
	
	
	
	
	
	//클래스에 저장된 이미지 첫번째거 가져오기
	
	public static String getRoomClassImage(String room_class) throws Exception{
		
		String result="";
		
		RoomclassBean paramClass = new RoomclassBean();
		RoomclassBean resultClass = new RoomclassBean();	
		
		paramClass.setRoom_class(room_class);
		 

		resultClass = (RoomclassBean)sqlMapper.queryForObject("roomclassSQL.selectRoomClass", paramClass);
		
		/*System.out.println("이미지"+resultClass.getImage());
		System.out.println("값"+imageSplit(resultClass.getImage(),1));*/
		
		return imageSplit(resultClass.getImage(),1);
	}
	
	
	public static String imageSplit(String strImage,int idx) throws Exception {
		
		if(strImage == null || strImage.equals("")){
			
			//System.out.println("이미지 자체가 없음"+strImage);
			
			return "";
		}
		
		StringTokenizer values = new StringTokenizer(strImage+"/","/");
		
		int i =1;
		
		while(values.hasMoreElements()){
						
			String image =values.nextToken();
					
			//System.out.println( i+ ":"+ image);
			
			if(i== idx){
				return image;
			}
			
			/*switch (i) {
			case 1:	this.image_01 =image; break;
			case 2:	this.image_02 =image; break;
			case 3:	this.image_03 =image; break;
			case 4:	this.image_04 =image; break;
			case 5:	this.image_05 =image; break;
			default:
				break;
			}*/			
			i++;
		}
		
		return "";
		
	}
	
	
	
	////////////////////////////////////////////////////////////
	
	
	//이미지업로드 설정
	public static void imageUplode(ImageBean paramClass, int no, String uploadFileName, String fileUploadPath, File upload, String sql) throws IOException, SQLException{
		
		try{	
			//파일을 서버에 저장
			File destFile = new File(fileUploadPath + uploadFileName);
		    System.out.println(destFile.getPath());
		    FileUtils.copyFile(upload, destFile);
		    System.out.println("서버에 이미지 저장.");
		    
		    //파일 정보 설정.
		    paramClass.setNo(no);  //번호
		    paramClass.setImage(uploadFileName);    //이미지 이름
		    System.out.println("이미지 정보 파라미터 설정.");
		    
		    //파일 정보 업데이트.
		    sqlMapper.update(sql, paramClass);
		    System.out.println("이미지 정보 업데이트.");
		}catch(Exception e){}
	}
	
	
	
	
	
	// 현재 날짜 : java에서는 이 함수 호출
	public String getDate(){
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd" );
		String cDate = dateFormat.format(currentDate);
		//System.out.println("현재날짜 : "+cDate);
		
		return cDate;
	}
	
	
	
	// 프로젝트 위치 경로
	public String getPath(){
		String s = this.getClass().getResource("/").getPath();
		String sc = s.substring(0, s.indexOf(".metadata"));
		
		//System.out.println("프로젝트 전까지의 경로: "+sc);
		
		return sc;
	}
	
	
	
	
}
