package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;


public class CashAction extends ActionSupport implements SessionAware{
	
	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	
	private MemberBean paramClass;
	
	private int cash;
	
	private String memberId;
	
	private Map session;

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
		
		int orgCash = (int)session.get("cash");
		
		sqlMapper.update("member.updateCash", paramClass);
		
		session.put("cash", paramClass.getCash()+orgCash);
		
		return SUCCESS;
	}
	
	//캐쉬 충전 폼
	public String form() throws Exception{
		
		return SUCCESS;
		
		
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

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
	
	
	

}
