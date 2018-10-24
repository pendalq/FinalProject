package kh.com.a.model;

public class GoodsParam {

	private int seq; // seq 
	private String id; // id
	private String imageloc; // imageloc path
	private String title; // goods name
	private String category; // category
	private String brand; // brand name
	private int price; // goods price
	private String options; // goods option
	private String content; // goods content
	private int rentalCount; // goods rentalCount
	private String wdate ; // wdate 
	
	// --------------- search
	private String keyword;
	
	// --------------- paging
	
	private int recordCountPerPage = 15;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 15;
	
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
	public String getimageloc() {
		return imageloc;
	}
	public void setimageloc(String imageloc) {
		this.imageloc = imageloc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	@Override
	public String toString() {
		return "GoodsParam [seq=" + seq + ", id=" + id + ", imageloc=" + imageloc + ", title=" + title + ", category="
				+ category + ", brand=" + brand + ", price=" + price + ", options=" + options + ", content=" + content
				+ ", rentalCount=" + rentalCount + ", wdate=" + wdate + ", keyword=" + keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
}
