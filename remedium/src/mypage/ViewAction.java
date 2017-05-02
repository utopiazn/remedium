package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class ViewAction extends ActionSupport implements SessionAware {
	
	private Map session;

	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	

	
	//생성자
	public ViewAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//예약 상세 내용
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		return SUCCESS;
	}


	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
	
	
}
