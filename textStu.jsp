<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%request.setCharacterEncoding("utf-8");
	 String msg ="";
 //    String bno ="";
 //    String bname ="";
    String sdepartment ="";
    String sspecial ="";
    String sup ="";
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
    String connectString = "jdbc:mysql://172.18.58.162:3306/library"	// 连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 
       try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097");
        Statement stmt=con.createStatement();

        

        if(sno!=null){
          ResultSet rs=stmt.executeQuery("select * from student WHERE sno = '"+sno+"';"); // 根据输入内容查询信息
          if(rs.next()){
            sname=rs.getString("sname");
            sdepartment=rs.getString("sdepartment");
            sspecial=rs.getString("sspecial");
            sup=rs.getString("sup");
          }
        }

        if(sname!=null){
          ResultSet rs=stmt.executeQuery("select * from student WHERE sname = '"+sname+"';");  // 根据输入内容查询信息
          if(rs.next()){
            sno=rs.getString("sno");
            sdepartment=rs.getString("sdepartment");
            sspecial=rs.getString("sspecial");
            sup=rs.getString("sup");
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
	<head><title>学生信息</title></head>
	<body>	 
	        
	    名字: <%=sname %><br/>
                  学号: <%=sno %><br/>
		  所在学院: <%=sdepartment %><br/>
                  专业: <%=sspecial %><br/> 
                  
		  借阅上限: <%= sup %><br/>
		  <a href = "updateBook.jsp?sno=<%=sno%>">修改</a>
          <a href = "deleteBook.jsp?sno=<%=sno%>">删除</a>
          <a href = "check.jsp">返回</a>
	</body>
</html>
