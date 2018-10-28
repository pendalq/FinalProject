package kh.com.a.model;

public class adminDto {


	private String id;
	private String address;
	private int auth;
	
	public adminDto() {
		
	}

	public adminDto( String id,String address, int auth) {
		super();
		this.id = id;
		this.address= address;
		this.auth = auth;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "adminDto [id=" + id + ", address=" + address + ", auth=" + auth + "]";
	}
	


	
	
	
}
