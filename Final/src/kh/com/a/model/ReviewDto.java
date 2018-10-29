package kh.com.a.model;

public class ReviewDto {

	private int seq;
	private int gseq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private String readCount;
	private int liked;
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
	public String getReadCount() {
		return readCount;
	}
	public void setReadCount(String readCount) {
		this.readCount = readCount;
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
				+ ", wdate=" + wdate + ", readCount=" + readCount + ", liked=" + liked + "]";
	}
	
}