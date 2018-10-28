package kh.com.a.insertPatemeter;

public class getUrentalList {

	String id;
	int seq;
	
	//구매자가 렌탈한 제품 중 1에 대한 dto를 뽑기위해 필요한 dto
	public getUrentalList() {
		
	}
	
	public getUrentalList(String id, int seq) {
		super();
		this.id = id;
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "aaaaaaa [id=" + id + ", seq=" + seq + "]";
	}
	
	
}
