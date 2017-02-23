<%@ page language="java" import="java.util.*,java.sql.*"
		 contentType="text/html; charset=utf-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String msg = "";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"		// 连接数据库
							+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="root"; 
	String pwd="741097";

	String updateButton = request.getParameter("update"); 
	String clearButton = request.getParameter("clear"); 

	String param = request.getParameter("pid");
	String pid = "";
	if(param != null && !param.isEmpty()){
		pid += param;
	}

	String name = request.getParameter("name");
	if(name==null) name="";
	String dep = request.getParameter("dep");
	if(dep==null) dep="";
	String course = request.getParameter("course");
	if(course==null) course="";
	String limit = request.getParameter("limit");
	if(limit==null) limit="";

	String sql = "";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString,user, pwd);
		Statement stmt = con.createStatement();

		if(updateButton != null){
			
			String fmt="update student set sname='%s',sdepartment='%s',sspecial='%s',sup='%s' where sno=%d";// 执行更新操作
			
	 		sql = String.format(fmt,name,dep,course,limit,Integer.parseInt(pid));
	 		int cnt = stmt.executeUpdate(sql);
	 		if(cnt>0) msg = "修改成功!";
		}
		
		else{
	 		String fmt="select * from student where sno=%d";// 执行select操作
	 		sql = String.format(fmt,Integer.parseInt(pid));
	 		ResultSet rs = stmt.executeQuery(sql);
	 		if(rs.next()){
	 	        name = rs.getString("sname");
	 	        dep = rs.getString("sdepartment");
	 	        course = rs.getString("sspecial");
	 	        limit = rs.getString("sup");
	 	    }
		}

		stmt.close();
		con.close();
	}
	catch (Exception e){
		msg = e.getMessage();
	}
%>

<!DOCTYPE HTML>
<html>
<style>			<% // 网页样式设计  %>
	.container{margin:0 auto;width:500px;text-align:center;}
	form { line-height:50px; }
	a {margin-top : 300px;}
</style>
	<head>
		<title>Library</title>
	</head>
	<body>			<% // 网页布局  %>
		<div class="container">
			<h1>修改学生记录</h1>		<% // 输入信息  %>
			<form action="updateStu.jsp?pid=<%=pid%>" method="post">
				学生姓名:	<input id="name" type="text" name="name" value=<%=name %>><br>
				学生院系：	<input id="dep" type="text" name="dep" value=<%=dep %>><br>
				学生专业：	<input id="course" type="text" name="course" value=<%=course %>><br>
				借书上限：	<input id="limit" type="text" name="limit" value=<%=limit %>><br>
				<input type="submit" name="update" value="修改">
				<input type="submit" name="clear" value="清空">
			</form>
			<%=msg%><br>
			<a href='browseStu.jsp'>返回</a>
		</div>
	</body>
</html>