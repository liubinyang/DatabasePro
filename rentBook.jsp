<%@ page language="java" import="java.util.*,java.sql.*"
		 contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg = "";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"	// 连接数据库
							+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="root"; 
	String pwd="741097";


	String bno = request.getParameter("bno");
	if(bno==null) bno="";
	String sno = request.getParameter("sno");
	if(sno==null) sno="";


	if(request.getMethod().equalsIgnoreCase("post")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(connectString,user, pwd);
			Statement stmt = con.createStatement();
			String fmt="delete from borrow where sno=%s and bno=%s"; //删除borrow表中的借阅信息
			String sql = String.format(fmt,sno,bno);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0) msg = "归还成功!";
			
			stmt.close();
			con.close();
		}
		catch (Exception e){
			msg = e.getMessage();
		}
	}
%>

<!DOCTYPE HTML>
<html>
<style>		<% // 网页样式设计  %>
	.container{margin:0 auto;width:500px;text-align:center;}
	form { line-height:50px; }
	a {margin-top : 300px;}
</style>
	<head>
		<title>Library</title>
	</head>
	<body>	<% // 网页布局  %>
		<div class="container">
			<h1>填写借阅信息</h1>
			<form action="rentBook.jsp" method="post">		<% // 填写信息  %>
				图书编号：	<input id="bno" type="text" name="bno" value=<%=bno %>><br>
				借书证号：	<input id="sno" type="text" name="sno"><br>
				<input type="submit" name="rent" value="归还">
				<input type="submit" name="clear" value="清空">
			</form>
			<%=msg%><br>
			<a href='browseBook.jsp'>返回</a>
		</div>
	</body>
</html>