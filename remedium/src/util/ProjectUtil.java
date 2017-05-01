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

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import bean.ImageBean;
import bean.RoomBean;
import bean.RoomclassBean;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectUtil extends ActionSupport{
	
	
	//sql문 연동을 위한 구문
	private static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	private static ProjectUtil projectUtil = new ProjectUtil("sql"); 
	
	public static ProjectUtil InterfaceAction(){
		return projectUtil;
	}
	private ProjectUtil(String a){
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
