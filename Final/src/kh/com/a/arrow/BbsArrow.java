package kh.com.a.arrow;

import java.io.Serializable;

public class BbsArrow implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7404925203212853111L;
	private int dept;	
	
	public int getDept() {
		return dept;
	}

	public void setDept(int dept) {
		this.dept = dept;
	}

	public String getArrow(){
		String rs = "<img src='image/arrow.png' width='20px' height='20px' />";
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		String ts="";
		for(int i=0; i<dept; i++){
			ts += nbsp;
		}
		return dept == 0 ? "" : ts+rs;
	}
}
