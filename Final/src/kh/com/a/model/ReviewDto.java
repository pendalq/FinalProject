package kh.com.a.model;

public class ReviewDto {

	private int seq;
	private int gseq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int liked;
	
	public ReviewDto() {}

	public ReviewDto(int seq, int gseq, String id, String title, String content, String wdate, int readcount,
			int liked) {
		super();
		this.seq = seq;
		this.gseq = gseq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.liked = liked;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getGseq() {
		return gseq;
	}

	public void setGseq(int gseq) {
		this.gseq = gseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", gseq=" + gseq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + " liked=" + liked + "]";
	}

	
	
	
}
