package login.join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ZipCheckAction extends ActionSupport{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	public ZipCheckAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 회원가입 우편번호 가져오기
	public String execute() throws Exception {
		return SUCCESS;
	}
		
}
