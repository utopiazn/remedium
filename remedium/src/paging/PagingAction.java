package paging;

public class PagingAction {
	
	private int currentPage; // 현재 페이지
	private int totalCount; // 전체 수
	private int totalPage; // 전체 페이지 수
	private int blockCount; // 한 페이지의 수
	private int blockPage; // 한 화면에 보여줄 페이지 수
	private int startCount; // 게시글의 시작 번호
	private int endCount; // 게시글 끝 번호
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	
	private StringBuffer pagingHtml;
	
	// 현재 페이지, 전체 수, 한 페이지 수, 한 화면에 보여줄 페이지 수 를 받음
	public PagingAction(int currentPage, int totalCount, int blockCount, int blockPage) {
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		
		// 전체 페이지 수 = 전체 수 / 한 페이지 수
		totalPage = (int)Math.ceil((double) totalCount / blockCount);
		
		// 전체 페이지가 0일 경우 1로 변경
		if(totalPage == 0){
			totalPage = 1;
		}
		
		// 현재 페이지가 전체 페이지보다 클경우 전체 페이지 수 로 변경
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
	
	
}
