package kh.com.a.model;

import java.io.Serializable;

public class InterDto implements Serializable{
	private int seq;
	private String id;
	private int gseq;
	
	public InterDto() {}

	public InterDto(int seq, String id, int gseq) {
		super();
		this.seq = seq;
		this.id = id;
		this.gseq = gseq;
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

	@Override
	public String toString() {
		return "InterDto [seq=" + seq + ", id=" + id + ", gseq=" + gseq + "]";
	}
	
	
}
