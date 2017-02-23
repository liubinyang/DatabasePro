<%@ page language="java" import="java.util.*,java.sql.*"
		 contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg = "";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"		// 连接数据库
							+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="root"; 
	String pwd="741097";


	String name = request.getParameter("name");
	String dep = request.getParameter("dep");
	String course = request.getParameter("course");
	String limit = request.getParameter("limit");


	if(request.getMethod().equalsIgnoreCase("post")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(connectString,user, pwd);
			Statement stmt = con.createStatement();
			String fmt="insert into student(sname,sdepartment,sspecial,sup) values('%s','%s','%s','%s')"; // 执行插入操作
			String sql = String.format(fmt,name,dep,course,limit);
			int cnt = stmt.executeUpdate(sql);
			if(cnt>0) msg = "保存成功!";
			
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
	<head>
		<title>Library</title> 		<% // 网页样式  %>
		<style>
			.container{
				margin:0 auto;
				width:500px;
				text-align:center;
			}
			form { line-height:60px; }
			a{
				margin-top : 300px;
			}
		</style>
	</head>
	<body>
		<div class="container">		<% //  页面布局 %>
			<h1>新增学生借阅信息</h1>
			<form action="addStu.jsp" method="post" name="f">
				学生姓名：	<input id="name" type="text" name="name" ><br>		<% // 输入信息  %>
				学生院系：	<input id="dep" type="text" name="dep" ><br>
				学生专业：	<input id="course" type="text" name="course" ><br>
				借书上限：	<input id="limit" type="text" name="limit" ><br>
				<input type="submit" name="sub" value="保存">
			</form>
			<%=msg%><br>
			<a href='browseStu.jsp'>返回</a>
		</div>
	</body>
</html>