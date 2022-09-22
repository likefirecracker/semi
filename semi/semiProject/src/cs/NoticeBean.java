package cs;

import java.sql.Timestamp;

public class NoticeBean {
	private int n_num;
	private String n_title;
	private String n_content;
	private Timestamp n_date;
	private int n_hit;
	private String n_pwd;
	private String n_ip;
	private String user_id;
	private int before;
	private int after;

	public static int pageSize=10;
	public static int pageCount=1;
	public static int pageNum=1;
	

	
	/*
	 * 작 업 자 : 이민하
	 * 작업일자 : 2022.09.22
	 * 작업 내용 : 메소드 추가 => 페이징 처리를 위한 메소드
	 *          수정 => a태그를 위해 class추가
	 * */
	public static String pageNumber(int limit) {
		String str="";
		int temp = (pageNum-1)%limit;
		int startPage = pageNum - temp;
		
		if(startPage - limit>0) {
			str="<a class=\"page-link\" href = 'adminIndex.jsp?pageNum="+(startPage-limit)+"&pages=listNotice'>[이전]</a>&nbsp;&nbsp";
		}
		for(int i=startPage;i<(startPage+limit);i++) {
			if(i==pageNum) {
				str +="["+i+"]&nbsp&nbsp";
			} else {
				str+="<a class=\"page-link\" href='adminIndex.jsp?pageNum="+i+"&pages=listNotice'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if(i>=pageCount)break;
		}
		
		if(startPage + limit<=pageCount) {
			str+="<a class=\"page-link\" href = 'adminIndex.jsp?pageNum="+(startPage+limit)+"&pages=listNotice'>[다음]</a>&nbsp;&nbsp";
		}
		
		return str;
	}
	
	/*
	 * 작 업 자 : 이민하
	 * 작업일자 : 2022.09.22
	 * 작업내용 : 메소드 추가 => url 변경이 필요할 경우 이 메소드를 사용. => 오버로딩
	 * */
	public static String pageNumber(int limit, String url) {
		String str="";
		int temp = (pageNum-1)%limit;
		int startPage = pageNum - temp;
		
		if(startPage - limit>0) {
			str="<a class=\"page-link\" href = '"+url+".jsp?pageNum="+(startPage-limit)+"&pages=listNotice'>[이전]</a>&nbsp;&nbsp";
		}
		for(int i=startPage;i<(startPage+limit);i++) {
			if(i==pageNum) {
				str +="["+i+"]&nbsp&nbsp";
			} else {
				str+="<a class=\"page-link\" href='"+url+".jsp?pageNum="+i+"&pages=listNotice'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if(i>=pageCount)break;
		}
		
		if(startPage + limit<=pageCount) {
			str+="<a class=\"page-link\" href = '"+url+".jsp?pageNum="+(startPage+limit)+"&pages=listNotice'>[다음]</a>&nbsp;&nbsp";
		}
		
		return str;
	}
	
	public int getBefore() {
		return before;
	}


	public void setBefore(int before) {
		this.before = before;
	}


	public int getAfter() {
		return after;
	}


	public void setAfter(int after) {
		this.after = after;
	}


	public int getN_num() {
		return n_num;
	}


	public void setN_num(int n_num) {
		this.n_num= n_num;
	}


	public String getN_title() {
		return n_title;
	}


	public void setN_title(String n_title) {
		this.n_title = n_title;
	}


	public String getN_content() {
		return n_content;
	}


	public void setN_content(String n_content) {
		this.n_content = n_content;
	}


	public Timestamp getN_date() {
		return n_date;
	}


	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}


	public int getN_hit() {
		return n_hit;
	}


	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}


	public String getN_pwd() {
		return n_pwd;
	}


	public void setN_pwd(String n_pwd) {
		this.n_pwd = n_pwd;
	}


	public String getN_ip() {
		return n_ip;
	}


	public void setN_ip(String n_ip) {
		this.n_ip = n_ip;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
