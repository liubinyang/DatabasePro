<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql://172.18.58.162:3306/library"		// 连接数据库
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
    StringBuilder table=new StringBuilder("");
    table.append("<table>");
    table.append("<tr> <th>图书编号</th><th>借书证号</th><th>借出时间</th><th>归还时间</th> </tr>"); // 网页样式
        
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "root", "741097");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from borrow");
	  while(rs.next()) {			// 输出borrow表中的所有内容
			 table.append("<tr>");
			 table.append("<td>"+rs.getString("bno")+"</td>");
			 table.append("<td>"+rs.getString("sno")+"</td>");
             table.append("<td>"+rs.getString("bdate")+"</td>");
             table.append("<td>"+rs.getString("rdate")+"</td>");
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
<head>		<% // 网页布局  %>
<title>Library</title>
</head>
<body>
  	<div class="container">
		<h1>浏览借阅信息</h1>  
	  	<%=table%><br>
	  	<a href="check.jsp">返回</a>
 	</div>
</body>
</html>
