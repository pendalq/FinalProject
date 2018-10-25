package kh.com.a.model;

 

/*DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
ID VARCHAR2(50),
PW VARCHAR2(50) NOT NULL,
ADDRESS VARCHAR2(50)NOT NULL,
PHONE VARCHAR2(50)NOT NULL,
NAME VARCHAR2(50)NOT NULL,
AUTH NUMBER(8)NOT NULL,

CONSTRAINT PK_ID PRIMARY KEY(ID)
);
*/


public class MemberDto {

	private String id;
	private String pw;
	private String address;
	private String phone;
	private String name;
	private int auth;
	
	public MemberDto() {}
	
	public MemberDto(String id, String pw, String address, String phone, String name, int auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.address = address;
		this.phone = phone;
		this.name = name;
		this.auth = auth;
	}

	public MemberDto(String id, String pw, String address, String phone, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.address = address;
		this.phone = phone;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pw=" + pw + ", address=" + address + ", phone=" + phone + ", name=" + name
				+ ", auth=" + auth + "]";
	}
		
}
