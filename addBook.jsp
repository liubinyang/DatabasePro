<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.util.*,java.sql.*" 
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("utf-8");
    String msg ="";
  	String bno = request.getParameter("bno");
    String bname = request.getParameter("bname");
    String bdate = request.getParameter("bdate");
    String bpublish = request.getParameter("bpublish");
    String bplace = request.getParameter("bplace");
    String bnum = request.getParameter("bnum"); 
    String connectString = "jdbc:mysql://172.18.58.162:3306/library"		// 连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 				
    if(request.getMethod().equalsIgnoreCase("post")){
        try{        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097");			// 数据库账号密码
        Statement stmt=con.createStatement();
		String fmt ="insert into book(bno,bname,bdate,bpublish,bplace,bnum) values('%s','%s','%s','%s','%s','%s')"; // 执行插入操作
		String sql =  String.format(fmt,bno,bname,bdate,bpublish,bplace,bnum);
        int cnt=stmt.executeUpdate(sql);
        if(cnt>0)msg="保存成功!";        
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
<title>新增图书记录</title>			<% // 页面布局  %>
<style type="text/css">
div{text-align:center;}
</style>
</head>
<body>
	<div class="main">	
       <h1>新增图书记录</h1>			<% //  输入图书信息 %>
    	<form action="addBook.jsp"  method="post" name="f">
                编号：<input name="bno" id="bno" type="text"/><br> <br>
                书名：<input name="bname" id="bname" type="text"/><br> <br>
                出版日期：<input name="bdate" id="bdate" type="text"/> <br><br>
                出版社：<input name="bpublish" id="bpublish" type="text"/> <br><br>
                位置：<input name="bplace" id="bplace" type="text"/> <br><br>
                数量：<input name="bnum" id="bnum" type="text"/> <br><br>

            <input class="submit" type="submit" value="保存"/>
        </form>
        <p><%=msg%></p>
        <a href="browseBook.jsp" 
        class="back">返回</a>
    </div>

</body>
</html>