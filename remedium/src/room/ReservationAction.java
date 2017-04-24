package room;

import java.sql.Date;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;

public class ReservationAction extends ActionSupport{
	
	private RoomReservationBean paramClass;
	
	private int num;
	private int no;
	private String firstDate;
	private String lastDate;
	private int room_capacity;
	private int price;
	private int money;
	private String memberID;
	private int people;
	
	@Override
	//객실 예약 처리
	public String execute() throws Exception {
		
		
		Date firstDateD = Date.valueOf(getFirstDate());
		Date lastDateD = Date.valueOf(getLastDate());
		
		paramClass = new RoomReservationBean();
		paramClass.setNo(no);
		paramClass.setFirstDate(firstDateD);
		paramClass.setLastDate(lastDateD);
		paramClass.setMoney(money);
		paramClass.setMemberID(memberID);
		
		
		System.out.println("---------------------------");
		System.out.println("no : "+getNo()+" / paramClass.no : "+paramClass.getNo());
		System.out.println("firstDate : "+getFirstDate()+" / paramClass.firstDate : "+paramClass.getFirstDate());
		System.out.println("lastDate : "+getLastDate()+" / paramClass.lastDate : "+paramClass.getLastDate());
		System.out.println("money : "+getMoney()+" / paramClass.money : "+paramClass.getMoney());
		System.out.println("memberID : "+getMemberID()+" / paramClass.memberID : "+paramClass.getMemberID());
		System.out.println("---------------------------");
		
		util.ProjectUtil.sqlMapper.update("roomReservationSQL.insertRes", paramClass);
		
		/*util.ProjectUtil.sqlMapper.update("member.", paramClassM);*/
		
		return SUCCESS;
	}

	//객실 예약 폼
	public String roomRes() throws Exception {
		
		return SUCCESS;
	}
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRoom_capacity() {
		return room_capacity;
	}

	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public RoomReservationBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomReservationBean paramClass) {
		this.paramClass = paramClass;
	}

	public String getFirstDate() {
		return firstDate;
	}

	public void setFirstDate(String firstDate) {
		this.firstDate = firstDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}
	
	
}
