<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String pages = request.getParameter("page");
	if(pages == null){pages="head1";}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	table {
		width: 500px;
		height: 500px;
	}
	.right {
		width: 85%
	}
</style>
</head>
<body>
	<table border="1">
		<tr class="top">
			<td colspan="3">
				<jsp:include page="top.jsp"/>
			</td>
		<tr>
			<td class="left" colspan="1">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
			<td class="right" colspan="2">
				<jsp:include page='<%= pages+".jsp"%>'></jsp:include>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				since2011
			</td>
		</tr>
	</table>
</body>
</html>