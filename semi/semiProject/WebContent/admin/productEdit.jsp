<%@page import="java.text.SimpleDateFormat"%>
<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="product.ProductBean" id="product"></jsp:useBean>
<jsp:useBean class="product.ProductBean" id="productImg"></jsp:useBean>
<%
	int product_number=0;
	String date="";

	if(request.getParameter("product_number")==null){
		response.sendRedirect("adminIndex.jsp?pages=productList");
	} else{
		product_number = Integer.parseInt(request.getParameter("product_number"));
		ProductDBBean db = ProductDBBean.getInstance();
		product = db.getproduct(product_number, false);
		productImg = db.getImg(product_number);
	}
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd hh-mm");
	
	if(product.getProduct_date()!=null){
		 date = sdf.format(product.getProduct_date());		
	}
	
	String imgs = "test";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
    	<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<!-- <th>사진</th> -->
				<th>제품 명/사진</th>
				<th>가격</th>
				<th>재고량</th>
				<th>제품 등록 일자</th>
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<td><%= product_number %></td>
				<td><%= product.getCategory_code() %></td>
				<td>
					<%
						if(product.getStored_file_name()!=null){ //임시로 != 를 사용/ 실제로는 == null을 사용해야함
					%>
							<div style="background-color: #777">이미지 없음</div>
					<%
						} else{
					%>
							<div>
								<img src="http://localhost:8181/semiProject/upload/test.jpg" width="100px">
							</div>
					<%
						}
					%>
					<%= product.getProduct_name() %>
				</td>
				<%-- <td><%= product_name %></td> --%>
				<td><%= product.getProduct_price() %></td>
				<td><%= product.getProduct_stock() %></td>
				<td><%= date %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>