<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="product.ProductBean" id="product"></jsp:useBean>
<jsp:useBean class="product.ProductBean" id="productImg"></jsp:useBean>
<%
	System.out.println("벌써 delete.jsp옴");
	int product_number=0;
	String product_pwd = "";
	if(request.getParameter("product_number")==null){
		response.sendRedirect("adminIndex.jsp?pages=productList");
	} else{
		product_number = Integer.parseInt(request.getParameter("product_number"));
		ProductDBBean db = ProductDBBean.getInstance();
	} 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	삭제된듯? 제품 번호 : <%= product_number %>
</body>
</html>