package kh.com.a.model;

/*
CREATE TABLE GOODS(
SEQ NUMBER(8) NOT NULL,
ID VARCHAR2(50) NOT NULL,
imageloc VARCHAR2(450) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
CATEGORY VARCHAR2(50) NOT NULL,
BRAND VARCHAR2(50) NOT NULL,
PRICE NUMBER(8) NOT NULL,
OPTIONS VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
RENTALCOUNT NUMBER(8) NOT NULL,
WDATE DATE NOT NULL,

CONSTRAINT PK_SEQ PRIMARY KEY(SEQ)
);
*/

public class GoodsDto {
	
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
	
	public GoodsDto() {};
	
	public GoodsDto(int seq, String id, String imageloc, String title, String category, String brand, int price,
			String option, String content, int rentalCount, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.imageloc = imageloc;
		this.title = title;
		this.category = category;
		this.brand = brand;
		this.price = price;
		this.options = option;
		this.content = content;
		this.rentalCount = rentalCount;
		this.wdate = wdate;
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

	public String getOption() {
		return options;
	}

	public void setOption(String option) {
		this.options = option;
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

	@Override
	public String toString() {
		return "GoodsDto [seq=" + seq + ", id=" + id + ", imageloc=" + imageloc + ", title=" + title + ", category=" + category
				+ ", brand=" + brand + ", price=" + price + ", option=" + options + ", content=" + content
				+ ", rentalCount=" + rentalCount + ", wdate=" + wdate + "]";
	}
	

}
