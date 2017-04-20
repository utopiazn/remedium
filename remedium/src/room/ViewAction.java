package room;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import bean.RoomBean;

public class ViewAction extends ActionSupport{
	
	private RoomBean paramClass = new RoomBean();
	private RoomBean resultClass = new RoomBean();
	
	private int num;
	private String firstDate;
	private String lastDate;
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	public ViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	@Override
	//객실 개별 뷰
	public String execute() throws Exception {
		
		resultClass = (RoomBean)sqlMapper.queryForObject("roomSQL.selectOne", getNum());
		
		return SUCCESS;
	}

	public RoomBean getParamClass() {
		return paramClass;
	}

	public void setParamClass(RoomBean paramClass) {
		this.paramClass = paramClass;
	}

	public RoomBean getResultClass() {
		return resultClass;
	}

	public void setResultClass(RoomBean resultClass) {
		this.resultClass = resultClass;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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
	
	
	
	
}
