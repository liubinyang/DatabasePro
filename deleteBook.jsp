<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
request.setCharacterEncoding("utf-8");
    String msg ="";
	String bno = request.getParameter("bno");
    String connectString = "jdbc:mysql://172.18.58.162:3306/library" // 连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 
       try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097");
        Statement stmt=con.createStatement();
		String sql ="delete from book where bno=" + bno; // 删除book表中指定内容
        int cnt=stmt.executeUpdate(sql);
        if(cnt>0)msg="Delete Success!";   
		else msg = "Delete Failed!";
        stmt.close();
        con.close();
    }
    catch (Exception e){
      msg = e.getMessage();
    }
%>
<!DOCTYPE HTML>
<style type="text/css">		<% // 网页样式设计  %>

h1,.main
{
     text-align:center;
}
.text{
     margin-bottom:20px;
}
</style>

<html>
<head>	<% // 网页布局  %>
<title>删除图书记录</title>
</head>
<body>
	<h1>删除图书记录</h1>
	<div class="main">
    <p><%=msg%><p>
       <a href="browseBook.jsp" class="back">返回</a>
    </div>

</body>