package admin.room;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;

public class AdminReservationAction extends ActionSupport{
	
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
	
}
