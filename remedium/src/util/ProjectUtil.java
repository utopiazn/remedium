package util;

import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class ProjectUtil{
	
	
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
