package mypage;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;


public class CashAction extends ActionSupport{
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	
	private MemberBean paramClass;
	
	private int cash;
	
	private String memberId;

	//생성자
	public CashAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//캐쉬 원하는 만큼 충전
	@Override
	public String execute() throws Exception {
			
		paramClass = new MemberBean();
		
		paramClass.setCash(getCash());
		
		paramClass.setMemberID(getMemberId());
		
		System.out.println(cash);
		
		sqlMapper.update("member.updateCash", paramClass);
		
		return SUCCESS;
	}
	
	//캐쉬 충전 폼
	public String form() throws Exception{
		
		return SUCCESS;
		
		
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CashAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CashAction.sqlMapper = sqlMapper;
	}

	public MemberBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
	
	

}
