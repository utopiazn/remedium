package info;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class InfoView extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public InfoView() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 문의사항 게시판 삭제 처리 
	public String execute() throws Exception {
		return SUCCESS;
	}
}
