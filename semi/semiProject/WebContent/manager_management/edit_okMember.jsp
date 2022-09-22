<%@page import="login.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="login.MemberBean" id="member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	request.setCharacterEncoding("utf-8");
	response.encodeRedirectURL("utf-8");

	if(request.getParameter("user_id")!=null){
		member.setUser_regdate(new Timestamp(System.currentTimeMillis()));
		
		MemberDBBean db = MemberDBBean.getInstance();
		db.editMember(member);
		
		response.sendRedirect("listMember.jsp");
	} else{
		response.sendRedirect("listMember.jsp");
	}
%>