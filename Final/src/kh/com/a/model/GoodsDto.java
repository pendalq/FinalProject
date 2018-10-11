package kh.com.a.model;

/*
CREATE TABLE GOODS(
SEQ NUMBER(8) NOT NULL,
ID VARCHAR2(50) NOT NULL,
IMAGE VARCHAR2(450) NOT NULL,
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

	private int seq;
	private String id;
	private String image;
	private String name;
	private String category;
	private String brand;
	private int price;
	private String options;
	private String content;
	private int rentalcount;
	private String wdate;
	
	public GoodsDto() {}

	public GoodsDto(int seq, String id, String image, String name, String category, String brand, int price,
			String options, String content, int rentalcount, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.image = image;
		this.name = name;
		this.category = category;
		this.brand = brand;
		this.price = price;
		this.options = options;
		this.content = content;
		this.rentalcount = rentalcount;
		this.wdate = wdate;
	}

	public GoodsDto(String id, String image, String name, String category, String brand, int price, String options,
			String content) {
		super();
		this.id = id;
		this.image = image;
		this.name = name;
		this.category = category;
		this.brand = brand;
		this.price = price;
		this.options = options;
		this.content = content;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getRentalcount() {
		return rentalcount;
	}

	public void setRentalcount(int rentalcount) {
		this.rentalcount = rentalcount;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "GoodsDto [seq=" + seq + ", id=" + id + ", image=" + image + ", name=" + name + ", category=" + category
				+ ", brand=" + brand + ", price=" + price + ", options=" + options + ", content=" + content
				+ ", rentalcount=" + rentalcount + ", wdate=" + wdate + "]";
	}


	
	
}
