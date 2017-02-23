<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"	//	连接数据库
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    StringBuilder table=new StringBuilder("");
    table.append("<table>");// 网页布局
    table.append("<tr> <th>借书证号</th><th>学生姓名</th><th>学生系别</th><th>学生专业</th><th>借书上限数</th><th>操作</th> </tr>");
        
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "root", "741097");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from student");// 选择student表中的所有内容
	  while(rs.next()) {
			 table.append("<tr>");	// 输出student表中的所有内容
			 table.append("<td>"+rs.getString("sno")+"</td>");
			 table.append("<td>"+rs.getString("sname")+"</td>");
             table.append("<td>"+rs.getString("sdepartment")+"</td>");
             table.append("<td>"+rs.getString("sspecial")+"</td>");
             table.append("<td>"+rs.getString("sup")+"</td>");
             table.append("<td>"+
	            		 "<a href='updateStu.jsp?pid="+rs.getString("sno")+"'>修改</a>"+"		"+
	            		 "<a href='deleteStu.jsp?pid="+rs.getString("sno")+"'>删除</a>"+
	             		 "</td>");
             table.append("</tr>");
	  }
	  table.append("</table>");
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
%>
<!DOCTYPE HTML>
<html>
<style> 		<% // 网页样式设计  %>
	.container{
		margin:0 auto;
		width:600px;
		text-align:center;
	}
	td,th{
			width : 14rem;
			height : 2rem;
			border:solid 1px black
		}
    table{border-collapse:collapse ; text-align:center ;  margin:0 auto ; }
		
</style>
<head>
<title>Library</title>
</head>
<body>	<% // 网页布局  %>
  	<div class="container">
		<h1>浏览借阅者信息</h1>  
	  	<%=table%><br>
	  	<a href="addStu.jsp">新增</a>
	  	<a href="check.jsp">返回</a>
 	</div>
</body>
</html>
