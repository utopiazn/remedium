package admin.room;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


public class AdminReservationAction extends ActionSupport implements SessionAware {
	
	private Map session;
	
	private RoomReservationBean paramClass;
	
	private int reservationNo;
	private int money;
	private String memberID;

	
	@Override
	//객실 예약 승인
	public String execute() throws Exception {
		
		paramClass = new RoomReservationBean();
		paramClass.setReservationNo(getReservationNo());
		paramClass.setReservationCheck("y");
		
		util.ProjectUtil.sqlMapper.update("roomReservationSQL.adminReservation", paramClass);
		
		
		return SUCCESS;
	}
	
	//객실 예약 취소
	public String cancel() throws Exception {
		
		paramClass = new RoomReservationBean();
		paramClass.setReservationNo(getReservationNo());
		paramClass.setMoney(getMoney());
		paramClass.setMemberID(getMemberID());
		
		util.ProjectUtil.sqlMapper.update("roomReservationSQL.ResCancel1", paramClass);
		util.ProjectUtil.sqlMapper.delete("roomReservationSQL.ResCancel2", paramClass);
		
			return SUCCESS;
		}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	
	public void setSession(Map session) {
		this.session = session;
	}

	public Map getSession() {
		return session;
	}

	
}
