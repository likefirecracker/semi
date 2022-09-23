<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//이미지 삭제/ DB삭제 => product 테이블과 product_imagefile 테이블에서 해당하는 데이터 삭제
	String fileName = request.getParameter("file");
    
    String directory = this.getServletContext().getRealPath("/data/pds/");
    
    File file = new File(directory+fileName);
    
    if(file.exists()) {    //삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
        file.delete();
        request.setAttribute("msg", "fileDeleteOk");
    } else {
        request.setAttribute("msg", "fileDeleteNo");
    }
    request.setAttribute("url", request.getContextPath()+"/ptDownLoad1.pt");
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/msg/message.jsp");
    dispatcher.forward(request, response);
	%>
</body>
</html>