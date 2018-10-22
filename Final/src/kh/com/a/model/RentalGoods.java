package kh.com.a.model;

public class RentalGoods {

	private String title;
	private String image;
	private int seq;
	
	private String brand;
	private String options;
	
	private String sdate;
	private String re_turn;
	private String term;
	private int returndday;
	

	public RentalGoods() {
		
	}

	public RentalGoods(int seq, String title, String image) {
		super();
		this.seq = seq;
		this.title = title;
		this.image = image;
	}

	
	public RentalGoods(String title, String image, int seq, String brand, String options, String sdate, String re_turn,
			String term, int returndday) {
		super();
		this.title = title;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	@Override
	public String toString() {
		return "RentalGoods [title=" + title + ", image=" + image + ", seq=" + seq + ", brand=" + brand + ", options="
				+ options + ", sdate=" + sdate + ", re_turn=" + re_turn + ", term=" + term + ", returndday="
				+ returndday + "]";
	}

	
	
	
	
	 
	 
	
	
	
	
	
	 
	
}
