package login.join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class MemberIdCheckAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	public MemberIdCheckAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	// 회원 가입 아이디 중복 체크
	public String execute() throws Exception {
		return SUCCESS;
	}
	
}
