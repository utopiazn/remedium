package bean;

import java.util.Date;

public class MemberBean {
	
	
	private String memberID; // 회원 아이디
	private String memberPassword; // 회원 비밀번호
	private String memberName; // 회원 이름
	private String gender; // 회원 성별
	private String birthday; // 회원 생년월일
	private String phone; // 회원 핸드폰번호
	private String email; // 회원 이메일
	private Date regdate; // 회원 가입일
	private Date deldate; // 회원 탈퇴일
	private String userAdmin; // 관리자 여부
	private String zipcode; // 회원 우편번호
	private String addr1; // 회원 주소
	private String addr2; // 회원 상세주소
	private int cash; // 회원 캐쉬 
	private int userCheck; // 회원 사용여부
	
	public String getMemberID() {
		return memberID;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public String getGender() {
		return gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public Date getDeldate() {
		return deldate;
	}
	public String getUserAdmin() {
		return userAdmin;
	}
	public String getZipcode() {
		return zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public int getCash() {
		return cash;
	}
	public int getUserCheck() {
		return userCheck;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void setDeldate(Date deldate) {
		this.deldate = deldate;
	}
	public void setUserAdmin(String userAdmin) {
		this.userAdmin = userAdmin;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}
	
	
	
}
