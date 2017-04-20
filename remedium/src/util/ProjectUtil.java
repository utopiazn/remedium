package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProjectUtil {
	
	public String currentDate(){
		Date currentDate = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd" );
		String cDate = dateFormat.format(currentDate);
		System.out.println(cDate);
		
		return cDate;
	}
	
	public String getPath(){
		String s = this.getClass().getResource("/").getPath();
		String sc = s.substring(0, s.indexOf(".metadata"));
		
		return sc;
	} 
}
