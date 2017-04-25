package admin.room;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomReservationBean;

public class AdminListAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<RoomReservationBean> reslist;
	
	public AdminListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	@Override
	//고객이 요청한 예약객실 리스트
	public String execute() throws Exception {

		reslist = new ArrayList<RoomReservationBean>();
		
		reslist = sqlMapper.queryForList("roomReservationSQL.adminlist");

		return SUCCESS;
	}

	public List<RoomReservationBean> getReslist() {
		return reslist;
	}

	public void setReslist(List<RoomReservationBean> reslist) {
		this.reslist = reslist;
	}
}
