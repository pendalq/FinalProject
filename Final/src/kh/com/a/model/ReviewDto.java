package kh.com.a.model;

import java.io.Serializable;

public class ReviewDto implements Serializable{
	private int seq;
	private String id;
	private int gseq;
	private String title;
	private String content;
	private String wdate;
	private int readcount;
	private int liked;
	
	public ReviewDto() {}

	public ReviewDto(int seq, String id, int gseq, String title, String content, String wdate, int readcount, int liked
			 ) {
		super();
		this.seq = seq;
		this.id = id;
		this.gseq = gseq;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.liked = liked; 
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

	public int getGseq() {
		return gseq;
	}

	public void setGseq(int gseq) {
		this.gseq = gseq;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

 

	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", gseq=" + gseq + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", readcount=" + readcount + ", liked=" + liked + "]";
	}

	
}
