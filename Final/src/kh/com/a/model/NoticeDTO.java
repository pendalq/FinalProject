package kh.com.a.model;

/*DROP TABLE NOTICE
CASCADE CONSTRAINTS;

CREATE TABLE NOTICE(
	    SEQ NUMBER(8),
	    TITLE VARCHAR2(100) NOT NULL,
	    CONTENT VARCHAR2(4000) NOT NULL,
	    wdate DATE DEFAULT SYSDATE,
        READCOUNT NUMBER(8) NOT NULL,
        DEL NUMBER(1) NOT NULL,
	    
	    
	    CONSTRAINT PK_SEQ_NOTICE PRIMARY KEY (SEQ)

	);
	
CREATE SEQUENCE NOTICE_SEQ
START WITH 1 INCREMENT BY 1;
*/

public class NoticeDTO {

	private int seq;
	private String title;
	private String content;
	private String wdate;
	private int readCount;
	private int del;

	public NoticeDTO() {

	}

	public NoticeDTO(int seq, String title, String content, String wdate, int readCount, int del) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readCount = readCount;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "NoticeDTO [seq=" + seq + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", readCount=" + readCount + ", del=" + del + "]";
	}

	

	
}
