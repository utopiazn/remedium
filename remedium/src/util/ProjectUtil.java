package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProjectUtil {
	
	// 현재 날짜 : jsp에서는 이 변수를 가져다 쓰면 된다.
	public String currentDate = null;

	public ProjectUtil(){
		currentDate = getDate();
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
	
	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
}
