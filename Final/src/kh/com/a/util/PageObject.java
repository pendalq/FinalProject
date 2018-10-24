package kh.com.a.util;

public class PageObject {

	// 현재 페이지를 DB에서 가져 올때 필요한 정보
	private int page; // 현재 페이지
	private int perPageNum; // 페이지당 보여지는 글의 갯수
	private int startRow, endRow; // 현재 페이지의 시작 줄번호, 끝번호

	// JSP 화면에 하단부분 페이지 표시를 할때 필요한 정보.
	private int perGroupPageNum; // 기본값 10을 생성자에서 셋팅
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalRow; // DB에서 구한다.

	// 검색에 필요한 변수 선언
	private String key;
	private String word;

	// 공지 기간에 따른 분류를 위해 변수 선언
	// pre: 현재공지, old: 지난 공지,res: 예약 공지,all: 전체 공지
	private String period;

	
	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public PageObject(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		// 시작 줄번호와 끝 줄번호 계산
		// 현재 페이지의 이전 페이지 까지 데이터를 skip시키고 그 다음 번호 시작 번호로 한다.
		startRow = (page - 1) * perPageNum + 1;
		endRow = startRow + perPageNum - 1;

		// JSP 하단 부분에 몇개의 페이지를 표시할지 정한다.
		perGroupPageNum = 10;
		System.out.println("PageObject(페이지,페이지 당 글수)");
	}

	// Spring에서는 파라메터 값을 전달 받을때 기본 생성자와 setter()를 이용해서 데이터를 전달 받는다.
	public PageObject() {
		// 처음 리스트로 들어올 때는 데이터가 안 넘어 오므로 초기값을 1페이지에
		// 한페이당 10개의 글을 보이도록 셋팅한다.
		this.page = 1;
		this.perPageNum = 10;
		// JSP 하단 부분에 몇개의 페이지를 표시할지 정한다.
		perGroupPageNum = 10;
		
		//기본생성자. 공지 기간 분류- 리스트를 띄웠을때 현재공지가 default값으로 띄우도록 함
		this.period="pre";
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	// setStartRow()와 setEndRow()는 계산에 의해서 결정이 되므로 만들지 않음
	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public int getPerGroupPageNum() {
		return perGroupPageNum;
	}

	public void setPerGroupPageNum(int perGroupPageNum) {
		this.perGroupPageNum = perGroupPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;

		// 시작 줄번호와 끝 줄번호 계산
		// 현재 페이지의 이전 페이지 까지 데이터를 skip시키고 그 다음 번호 시작 번호로 한다.
		startRow = (page - 1) * perPageNum + 1;
		endRow = startRow + perPageNum - 1;

		// 전체 페이지를 계산할 수 있다.
		totalPage = (totalRow - 1) / perPageNum + 1;
		// startPage, endPage
		startPage = (page - 1) / perGroupPageNum * perGroupPageNum + 1;
		endPage = startPage + perGroupPageNum - 1;
		// endPage 가 총 페이지 수를 넘을 수 없다.
		if (endPage > totalPage)
			endPage = totalPage;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	@Override
	public String toString() {
		return "PageObject [page=" + page + ", perPageNum=" + perPageNum + ", startRow=" + startRow + ", endRow="
				+ endRow + ", perGroupPageNum=" + perGroupPageNum + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalPage=" + totalPage + ", totalRow=" + totalRow + ", key=" + key + ", word=" + word
				+ ", period=" + period + "]";
	}

}