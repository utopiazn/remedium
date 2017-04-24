package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;


public class ListAction  extends ActionSupport{

	public static Reader reader; //파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체	
	
	private String memberID;
	
	private RoomReservationBean paramClass;
	
	private List<RoomReservationBean> reslist;
	
	
	
	//생성자
	public ListAction() throws IOException{
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml 파일의 설정 내용을 가져온다
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);  //sqlMapConfig.xml 내용을 적용한 sqlMapper 객체 생성
		
		reader.close();
	}

	//예약 리스트
	@Override
	public String execute() throws Exception {
		
		reslist = new ArrayList<RoomReservationBean>();
		
		paramClass = new RoomReservationBean();
		paramClass.setMemberID(getMemberID());
		
		reslist = sqlMapper.queryForList("roomReservationSQL.reslist",paramClass);
		
		return SUCCESS;
	}	
	
	//마이페이지 메인	
	public String main() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public List<RoomReservationBean> getReslist() {
		return reslist;
	}

	public void setReslist(List<RoomReservationBean> reslist) {
		this.reslist = reslist;
	}

	public RoomReservationBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomReservationBean paramClass) {
		this.paramClass = paramClass;
	}
	
	
	
}
