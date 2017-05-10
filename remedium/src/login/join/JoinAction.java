package login.join;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.MemberBean;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
public class JoinAction extends ActionSupport  implements SessionAware {

	private Map session;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String memberID; // 회원 아이디
	private String memberPassword; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String gender; // 회원 성별
	private String birthday; // 회원 생년월일
	private String phone; // 회원 핸드폰번호
	private String email; // 회원 이메일
	
	private String zipcode; // 회원 우편번호
	private String addr1; // 회원 주소
	private String addr2; // 회원 상세주소
	
	private MemberBean paramClass;

	public JoinAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);	
		reader.close();
	}


	//회원 가입 정보 입력 폼
	public String joinForm() throws Exception {
		
		
	
		return SUCCESS;
	}
	
	//회원 가입 정보 입력 처리
	public String execute() throws Exception{
		
		paramClass = new MemberBean();
		
		paramClass.setMemberID(getMemberID());
		paramClass.setMemberPassword(getMemberPassword());
		paramClass.setMemberName(getMemberName());
		paramClass.setGender(getGender());
		paramClass.setBirthday(getBirthday());
		paramClass.setPhone(getPhone());
		paramClass.setEmail(getEmail());
		
		paramClass.setZipcode(getZipcode()); //회원 우편번호
		paramClass.setAddr1(getAddr1()); 	 // 회원 주소
		paramClass.setAddr2(getAddr2());
		
		paramClass.setCash(0); 		  // 회원 캐쉬 
		paramClass.setUserAdmin("0"); // 사용:1 미사용:0
		
		if(paramClass !=null){
			
			sqlMapper.insert("member.insertMember", paramClass);
		}
		
		return SUCCESS;
	}


	public String getMemberID() {
		return memberID;
	}


	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}


	public String getMemberPassword() {
		return memberPassword;
	}


	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddr1() {
		return addr1;
	}


	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}


	public String getAddr2() {
		return addr2;
	}


	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public MemberBean getParamClass() {
		return paramClass;
	}


	public void setParamClass(MemberBean paramClass) {
		this.paramClass = paramClass;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

}
