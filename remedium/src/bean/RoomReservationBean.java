package bean;

import java.util.Date;

public class RoomReservationBean {

	int reservationNo;	// 예약번호
	int no;				// 객실번호
	Date firstdate;		// 입실날짜
	Date lastdate;		// 퇴실날짜
	int money;			// 예약금
	String memberID;	// 회원ID
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getFirstdate() {
		return firstdate;
	}
	public void setFirstdate(Date firstdate) {
		this.firstdate = firstdate;
	}
	public Date getLastdate() {
		return lastdate;
	}
	public void setLastdate(Date lastdate) {
		this.lastdate = lastdate;
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
