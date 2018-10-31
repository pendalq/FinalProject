package kh.com.a.model;

public class GoodsParam {

	// --------------- search
	private String keyword;
	private String category; // category
	private String options; // goods option
	private int searchNum;
	private String option1;
	private String option2;
	private String option3;
	
	
	//----- 게시물 정보 
	
	private int seq; // seq
	private String id; // id
	private String imageloc; // imageloc path
	private String title; // goods name
	private String brand; // brand name
	private int price; // goods price
	private String content; // goods content
	private int rentalCount; // goods rentalCount
	private String wdate; // wdate

	// --------------- paging

	private int recordCountPerPage = 15;
	private int pageNumber = 0;

	private int start = 1;
	private int end = 15;
	
	// ----- getter setter
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImageloc() {
		return imageloc;
	}
	public void setImageloc(String imageloc) {
		this.imageloc = imageloc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRentalCount() {
		return rentalCount;
	}
	public void setRentalCount(int rentalCount) {
		this.rentalCount = rentalCount;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}

	@Override
	public String toString() {
		return "GoodsParam [keyword=" + keyword + ", category=" + category + ", options=" + options + ", searchNum="
				+ searchNum + ", seq=" + seq + ", id=" + id + ", imageloc=" + imageloc + ", title=" + title + ", brand="
				+ brand + ", price=" + price + ", content=" + content + ", rentalCount=" + rentalCount + ", wdate="
				+ wdate + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start="
				+ start + ", end=" + end + "]";
	}

}
