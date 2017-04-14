package admin;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class EventAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public EventAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
		//관리자 이벤트 글 쓰기 폼
		public String insForm() throws Exception{
			
			return SUCCESS;
		}
		
		//관리자 이벤트 글 쓰기 
		public String execute() throws Exception{
			
			return SUCCESS;
		}
			
		//관리자 이벤트 글 수정 폼
		public String updForm() throws Exception{
			
			return SUCCESS;
		}	
		
		//관리자 이벤트 글 수정 처리
		public String update() throws Exception{
			
			return SUCCESS;
		}
		
		//관리자 이벤트 글 삭제
		public String delete() throws Exception{
			
			return SUCCESS;
		}
	

}
