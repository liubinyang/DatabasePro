<%@ page language="java" import="java.util.*,java.sql.*"
		 contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg = "";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"			// 连接数据库
							+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="root"; 		// 数据库账号 密码
	String pwd="741097";

	String bdate = request.getParameter("bdate");
	if(bdate==null) bdate="";
	String rdate = request.getParameter("rdate");
	if(rdate==null) rdate="";
	String bno = request.getParameter("bno");
	if(bno==null) bno="";
	String sno = request.getParameter("sno");
	if(sno==null) sno="";


	if(request.getMethod().equalsIgnoreCase("post")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(connectString,user, pwd);
			Statement stmt = con.createStatement();
			String fmt="insert into borrow(bdate,rdate,bno,sno) values('%s','%s','%s','%s')";// 执行插入操作
			String sql = String.format(fmt,bdate,rdate,bno,sno);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0) msg = "借阅成功!";
			
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
	<body>
		<div class="container">		<% // 页面布局  %>
			<h1>填写借阅信息</h1>
			<form action="borrowBook.jsp" method="post">
				借书时间:	<input id="bdate" type="text" name="bdate"><br>			<% // 信息输入  %>
				归还时间：	<input id="rdate" type="text" name="rdate"><br>
				图书编号：	<input id="bno" type="text" name="bno" value=<%=bno %>><br>
				借书证号：	<input id="sno" type="text" name="sno"><br>
				<input type="submit" name="borrow" value="借阅">
				<input type="submit" name="clear" value="清空">
			</form>
			<%=msg%><br>
			<a href='browseBook.jsp'>返回</a>
		</div>
	</body>
</html>