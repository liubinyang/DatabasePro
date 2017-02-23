<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%request.setCharacterEncoding("utf-8");
	 String msg ="";
	 String bno = request.getParameter("bno");
     String bname =request.getParameter("bname");
    String bdate ="";
    String bplace ="";
    String bpublish ="";
    String bnum ="";
	
    String connectString = "jdbc:mysql://172.18.58.162:3306/library"	// 连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 
       try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097");
        Statement stmt=con.createStatement();

        if(bno!=null){
          ResultSet rs=stmt.executeQuery("select * from book WHERE bno = '"+bno+"';");	// 查询特定输入的内容
          if(rs.next()){
            bname=rs.getString("bname");
            bdate=rs.getString("bdate");
            bplace=rs.getString("bplace");
            bpublish=rs.getString("bpublish");
            bnum=rs.getString("bnum");
          }
        }

        if(bname!=null){
          ResultSet rs=stmt.executeQuery("select * from book WHERE bname = '"+bname+"';");   // 查询特定输入的内容
          if(rs.next()){
            bno=rs.getString("bno");
            bdate=rs.getString("bdate");
            bplace=rs.getString("bplace");
            bpublish=rs.getString("bpublish");
            bnum=rs.getString("bnum");
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
<html lang="zh-cn">		<% // 网页布局  %>
	<head><title>图书信息</title></head>
	<body>
		  
		 No.: <%=bno %><br/>
	          图书名称: <%=bname %><br/>
                  出版日期: <%=bdate %><br/>
		  出版社: <%=bpublish %><br/>
                  位置: <%=bplace %><br/> 
                  
		  是否在架上: <%=bnum %><br/>
		  <a href = "updateBook.jsp?bno=<%=bno%>">修改</a>
          <a href = "deleteBook.jsp?bno=<%=bno%>">删除</a>
          <a href = "check.jsp">返回</a>
          
	</body>
</html>