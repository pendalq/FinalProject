package kh.com.a.model;

import java.io.Serializable;

/*CREATE TABLE QNA(
SEQ NUMBER(8) , 
CATEGORY VARCHAR2(50) NOT NULL,
ID VARCHAR2(50), 
TITLE VARCHAR2(100) NOT NULL, 
CONTENT VARCHAR2(4000) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPT NUMBER(8) NOT NULL,
WDATE DATE NOT NULL,
DEL NUMBER(2) NOT NULL,

CONSTRAINT PK_SEQ_QNA PRIMARY KEY(SEQ),
CONSTRAINT FK_ID_QNA FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);*/

public class QnADto{

	private int seq;
	private String category;
	private String id;
	private String title;
	private String content;
	private int ref;
	private int step;
	private int dept;
	private String wdate;
	private int parent;
	private int del;
	private int readcount;
	
	public QnADto() {
		
	}

	public QnADto(int seq, String category, String id, String title, String content, int ref, int step, int dept,
			String wdate, int parent, int del, int readcount) {
		super();
		this.seq = seq;
		this.category = category;
		this.id = id;
		this.title = title;
		this.content = content;
		this.ref = ref;
		this.step = step;
		this.dept = dept;
		this.wdate = wdate;
		this.parent = parent;
		this.del = del;
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDept() {
		return dept;
	}

	public void setDept(int dept) {
		this.dept = dept;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "QnADto [seq=" + seq + ", category=" + category + ", id=" + id + ", title=" + title + ", content="
				+ content + ", ref=" + ref + ", step=" + step + ", dept=" + dept + ", wdate=" + wdate + ", parent="
				+ parent + ", del=" + del + ", readcount=" + readcount + "]";
	}

}