package bean;

public class RoomBean {
	private int no; // 객실 번호
	private String	name; // 객실 이름
	private int room_size; // 객실 크기
	private int room_capacity; // 객실정원
	private String construction; // 객실 구성
	private String room_comment; // 객실 소개
	private String orgImage; // 객실 사진 원본
	private String savImage; // 객실 사진 저장본
	private int price; // 객실 요금
	private String room_class; // 객실 종류
	
	public int getNo() {
		return no;
	} 
	public String getName() {
		return name;
	}
	public int getRoom_size() {
		return room_size;
	}
	public int getRoom_capacity() {
		return room_capacity;
	}
	public String getConstruction() {
		return construction;
	}
	public String getRoom_comment() {
		return room_comment;
	}
	public String getOrgImage() {
		return orgImage;
	}
	public String getSavImage() {
		return savImage;
	}
	public int getPrice() {
		return price;
	}
	public String getRoom_class() {
		return room_class;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}
	public void setRoom_capacity(int room_capacity) {
		this.room_capacity = room_capacity;
	}
	public void setConstruction(String construction) {
		this.construction = construction;
	}
	public void setRoom_comment(String room_comment) {
		this.room_comment = room_comment;
	}
	public void setOrgImage(String orgImage) {
		this.orgImage = orgImage;
	}
	public void setSavImage(String savImage) {
		this.savImage = savImage;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setRoom_class(String room_class) {
		this.room_class = room_class;
	}
	
	
}
