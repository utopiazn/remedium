package admin.room;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class RoomAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public RoomAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	//객실정보 추가 폼
		public String insForm() throws Exception {
			return SUCCESS;
		}
	
	@Override
	//객실정보 추가
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	//객실정보 수정 폼
	public String updForm() throws Exception {
		return SUCCESS;
	}
	
	//객실정보 수정
		public String update() throws Exception {
			return SUCCESS;
	}
	
	//객실정보 삭제
	public String delete() throws Exception {
		return SUCCESS;
	}

}
