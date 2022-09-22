<%@page import="java.text.SimpleDateFormat"%>
<%@page import="product.UploadProductDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="product.ProductBean" id="product"></jsp:useBean>
<jsp:useBean class="product.UploadProductBean" id="upload"></jsp:useBean>
<%
	String pageNumber="";

	if(request.getParameter("pageNum")!=null){
		pageNumber=request.getParameter("pageNum");
	}else{
		pageNumber="1";
		response.sendRedirect("adminIndex.jsp?pages=productList&pageNum=1");
	}

	ProductDBBean db = ProductDBBean.getInstance();
	
	ArrayList<ProductBean> list = db.productList(pageNumber);
	
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme">
</head>
<body>
	<div class="col-md-10 my-4" style="text-align: center; align-items: center;">
    	<div class="card shadow">
    		<div class="card-body">
        		<h5 class="card-title">제품 정보 조회</h5>
         		<table class="table table-hover">
           			<thead>
						<tr>
							<th width="100px">번호</th>
							<th width="150px">카테고리</th>
							<!-- <th>사진</th> -->
							<th width="200px">제품 명/사진</th>
							<th width="150px">가격</th>
							<th width="150px">재고량</th>
							<th width="200px">제품 등록 일자</th>
							<th width="100px">수정 / 삭제</th>
						</tr>
					</thead>
	<%
		for(int i=1;i<list.size();i++){
			product = list.get(i);
			
			int product_number = product.getProduct_number();
			String product_name = product.getProduct_name();
			int product_price = product.getProduct_price();
			String category_code = product.getCategory_code();
			int product_stock = product.getProduct_stock();
			Timestamp product_date = product.getProduct_date();
			
			int product_fileNumber;
			String product_fileName;
			String fileName = "";
			
			product = db.getImg(product_number);
			
			if(db.getImg(product_number)!=null){
				product_fileNumber = product.getFile_number();
				product_fileName = product.getOrgin_file_name();
				fileName = product_fileNumber + product_fileName;
			}			
			
	%>
					<tbody>
						<tr>
							<td><%= product_number %></td>
							<td><%= category_code %></td>
							<td>
								<%
									if(!fileName.equals("")){
								%>
										<div style="background-color: #777">이미지 없음</div>
								<%
									} else{
								%>
										<div>
											<img src="http://localhost:8181/semiProject/upload/test.jpg" width="100px">
											<%-- <img src="http://localhost:8181/semiProject/upload/<%= fileName %>" width="100px"> --%>
										</div>
								<%
									}
								%>
								<%= product_name %>
							</td>
							<%-- <td><%= product_name %></td> --%>
							<td><%= product_price %></td>
							<td><%= product_stock %></td>
							<td><%= sdf.format(product_date) %></td>
							<td>
                              <div class="dropdown">
                                <button class="btn btn-sm dropdown-toggle" type="button" id="dr1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  <span class="text-muted sr-only">Action</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dr1">
                                  <a class="dropdown-item" href="adminIndex.jsp?pages=productEdit&product_number=<%= product_number %>">Edit</a>
                                  <a class="dropdown-item" href="adminIndex.jsp?pages=productDelete&product_number=<%= product_number %>">Remove</a>
                                </div>
                              </div>
                            </td>
						</tr>
	<%	
		}
	%>
					</tbody>
	 			</table>
        	</div>
      	</div>
    </div>
	<%= ProductBean.pageNumber(5, "adminIndex") %>
</body>
</html>