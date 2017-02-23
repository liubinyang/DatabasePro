<%@ page language="java" import="java.util.*,java.sql.*"
		 contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg = "";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"		// 连接数据库
							+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="root"; 
	String pwd="741097";

	String param = request.getParameter("pid");

	String pid = "";
	if(param != null && !param.isEmpty()){
		pid += param;
	}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString,user, pwd);
		Statement stmt = con.createStatement();
		
		String fmt="delete from student where sno=%s"; // 执行删除操作
		String sql = String.format(fmt,pid);
		int cnt = stmt.executeUpdate(sql);
		if(cnt>0) msg = "删除成功!";
		
		stmt.close();
		con.close();
 	    }
	catch (Exception e){
		msg = e.getMessage();
	}
	
%>

<!DOCTYPE HTML>
<html>
<style>		<% // 网页样式设计  %>
	.container{margin:0 auto;width:500px;text-align:center;}
	form { line-height:50px; }
</style>
<head>
	<title>Library</title>
	
</head>
<body>		<% // 页面布局  %>
	<div class="container">
		<h1>删除借阅学生信息</h1>	
		<p><%=msg%></p><br>
		<a href='browseStu.jsp'>返回</a>
	</div>
</body>
</html>