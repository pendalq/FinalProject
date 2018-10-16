package kh.com.a.model;

/*
CREATE TABLE MESSAGE(
SEQ NUMBER(8),
RECEIVEID VARCHAR2(50),
SENDID VARCHAR2(50), 
TITLE VARCHAR2(100) NOT NULL,
CONTENT VARCHAR2(4000) NOT NULL,
WDATE DATE NOT NULL,
DEL NUMBER(2) NOT NULL,

CONSTRAINT PK_SEQ_MESSAGE PRIMARY KEY(SEQ),
CONSTRAINT FK_RECEIVEID_MESSAGE FOREIGN KEY(RECEIVEID) REFERENCES MEMBER(ID),
CONSTRAINT FK_SENDID_MESSAGE FOREIGN KEY(SENDID) REFERENCES MEMBER(ID)
);
*/

public class MessageDto {

	private int seq;
	private String receiveid;
	private String sendid;
	private String title;
	private String content;
	private String wdate;
	private int del;
	
	public MessageDto() {}
	
	

	public MessageDto(int seq, String receiveid, String sendid, String title, String content, String wdate, int del) {
		super();
		this.seq = seq;
		this.receiveid = receiveid;
		this.sendid = sendid;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
	}



	public MessageDto(String receiveid, String sendid, String title, String content) {
		super();
		this.receiveid = receiveid;
		this.sendid = sendid;
		this.title = title;
		this.content = content;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}



	public String getReceiveid() {
		return receiveid;
	}



	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}



	public String getSendid() {
		return sendid;
	}



	public void setSendid(String sendid) {
		this.sendid = sendid;
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



	public int getDel() {
		return del;
	}



	public void setDel(int del) {
		this.del = del;
	}



	@Override
	public String toString() {
		return "MessageDto [seq=" + seq + ", receiveid=" + receiveid + ", sendid=" + sendid + ", title=" + title
				+ ", content=" + content + ", wdate=" + wdate + ", del=" + del + "]";
	}
	
	
	
}
