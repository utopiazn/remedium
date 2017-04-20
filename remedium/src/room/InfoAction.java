package room;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomclassBean;

public class InfoAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public InfoAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	private int roomClass;
		
	private List<String> list;  //객실 종류 리스트
	
	private RoomclassBean paramClass;
	
	
	private String room_class; 	//객실종류
	private String image; 		//사진경로(메인)
	private String content; 	//내용
	private String image2; 		//시설정보
	
	
	@Override
	//객실 클래스 리스트
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스 개별 뷰
	public String view() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가 폼
	public String insForm() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 추가
	public String insert() throws Exception {
		
		return SUCCESS;
	}
	
	//객실 클래스를 수정 폼
	public String updForm() throws Exception {
		
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
	
	
	
	
}
