package kh.com.a.model;

import java.io.Serializable;

public class InterDto implements Serializable{
	private int seq;
	private String id;
	private int gseq;
	private String imageName;
	
	public InterDto() {}
	

	public InterDto(int seq, String id, int gseq, String imageName) {
		super();
		this.seq = seq;
		this.id = id;
		this.gseq = gseq;
		this.imageName = imageName;
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

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "InterDto [seq=" + seq + ", id=" + id + ", gseq=" + gseq + ", imageName=" + imageName + "]";
	}

	
	
}
