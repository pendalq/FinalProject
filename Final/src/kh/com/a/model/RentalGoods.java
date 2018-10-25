package kh.com.a.model;

public class RentalGoods {

	private String title;
	private String imagename;
	private int seq;  //
	 
	
	private String sdate;
	private String re_turn;
	private String term;
	private int returndday;
	
	
	private int gseq; //
	private String id; //판매자아이디
	private String brand;
	private int price;
	private String options;
	private String wdate;	
	
	public RentalGoods() {
		
	}

	public RentalGoods(int seq, String title, String imagename) {
		super();
		this.seq = seq;
		this.title = title;
		this.imagename = imagename;
	}

	
	public RentalGoods(String title, String imagename, int seq, String brand, String options, String sdate, String re_turn,
			String term, int returndday) {
		super();
		this.title = title;
		this.imagename = imagename;
		this.seq = seq;
		this.brand = brand;
		this.options = options;
		this.sdate = sdate;
		this.re_turn = re_turn;
		this.term = term;
		this.returndday = returndday;
	}
	
	

	 

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getimagename() {
		return imagename;
	}

	public void setimagename(String imagename) {
		this.imagename = imagename;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getRe_turn() {
		return re_turn;
	}

	public void setRe_turn(String re_turn) {
		this.re_turn = re_turn;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}
	
	public int getReturndday() {
		return returndday;
	}

	public void setReturndday(int returndday) {
		this.returndday = returndday;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

 
}
	
	
	
	
	
	 
	 
	
	
	
	
	
	 
	
 
