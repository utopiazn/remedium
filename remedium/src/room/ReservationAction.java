package room;

import java.sql.Date;
import java.util.Calendar;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;
import bean.MemberBean;

public class ReservationAction extends ActionSupport implements SessionAware {
	
	private RoomReservationBean paramClass;
	private MemberBean paramClassM;
	
	private int num;
	private int no;
	private String firstDate;
	private String lastDate;
	private int room_capacity;
	private int cash;
	private int money;
	private int price;
	private String memberID;
	private int people;
	private Map session;
	
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
		
		
		paramClassM = new MemberBean();
		paramClassM.setCash(getCash() - getMoney());
		paramClassM.setMemberID(memberID);

		System.out.println("---------------------------");
		System.out.println("객실요금: "+getMoney()+", 보유Cash: "+getCash()
							+", \n결제후 Cash: "+paramClassM.getCash());
		System.out.println("---------------------------");

		
		
		util.ProjectUtil.sqlMapper.update("roomReservationSQL.insertRes", paramClass);
		
		util.ProjectUtil.sqlMapper.update("member.pay", paramClassM);
		
		session.put("cash", paramClassM.getCash());
		
		return SUCCESS;
	}

	//객실 예약 폼
	public String roomRes() throws Exception {
		
		
		//일수별로 가격증가
		Date firstDateD = Date.valueOf(getFirstDate());
		Date lastDateD = Date.valueOf(getLastDate());
		
		Calendar calf = Calendar.getInstance ( );
		calf.setTime(firstDateD);// 입실날짜 

		Calendar call = Calendar.getInstance ( );
		call.setTime(lastDateD); // 퇴실날짜

		int count = 0;
		while (!calf.after(call))
		{
		count++;
		calf.add ( Calendar.DATE, 1 ); // 다음날로 바뀜
		}
		count--; //하루 오버되서 날짜 재조정
		System.out.println (count + "박 예정" );
		
		price = price * count;
		
		
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

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
}
