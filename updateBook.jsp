<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>    

<%
request.setCharacterEncoding("utf-8");
    String msg ="";
    String bpublish ="";
    String bname ="";
    String bno = "";    
    String bdate ="";
    String bplace ="";
    String bnum ="";
    String connectString = "jdbc:mysql://172.18.58.162:3306/library"	// 连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";         
    bno = request.getParameter("bno");
    try{        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097");
        Statement stmt=con.createStatement();

        ResultSet rs= stmt.executeQuery("select * from book where bno = "+ bno);		// 执行选择操作
        if(rs.next()){
        bno=rs.getString("bno");
        bname = rs.getString("bname");
        bdate=rs.getString("bdate");
        bpublish = rs.getString("bpublish");
        bplace=rs.getString("bplace");
        bnum = rs.getString("bnum");
        }
        else{msg = "The user does not exist!";}
        stmt.close();
        con.close();
    }        
    catch (Exception e){
      msg = e.getMessage();
    }
    if(request.getMethod().equalsIgnoreCase("post")){   
     bno = request.getParameter("bno");
     bname =request.getParameter("bname");
     bdate = request.getParameter("bdate");
     bpublish =request.getParameter("bpublish");
     bplace = request.getParameter("bplace");
     bnum =request.getParameter("bnum");
        try{        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "user", "123");
        Statement stmt=con.createStatement(); // 执行更新操作
        String fmt ="update book set bno = '%s',bname = '%s',bdate = '%s',bpublish = '%s',bplace = '%s',bnum = '%s' where bno='%s'";
        String sql = String.format(fmt,bno,bname,bdate,bpublish,bplace,bnum,bno);
        int cnt=stmt.executeUpdate(sql);
        if(cnt>0)msg="Update Success!";
           
        stmt.close();
        con.close();
    }
    catch (Exception e){
      msg = e.getMessage();
    }
}
%>

<!DOCTYPE HTML>
<style type="text/css">

h1,.main
{
     text-align:center;
}
.num,.name,.submit{
     margin-bottom:20px;
}
.update,.clear{
     font-size:15px;
     padding-top:3px;
}
</style>

<html>		<% // 网页布局  %>
<head>
<title>修改图书记录</title>
<script type="text/javascript">
function cl()
{
    document.getElementById('bno').value="";
    document.getElementById('bname').value="";
    document.getElementById('bdate').value="";
    document.getElementById('bpublish').value="";
    document.getElementById('bplace').value="";
    document.getElementById('bnum').value="";
    msg="";
}
</script>
</head>
<body>
    <h1>修改图书记录</h1>		<% // 输入更新信息  %>
    <div class="main">
        <form action="updateBook.jsp?bno=<%=bno%>" 
        method="post" name="update">
            <div class="bno">
                编号：<input class="bno_edit" name="bno" type="text" value="<%=bno%>"/> 
            </div><br>
            <div class="bname">
                书名：<input class="bname_edit" name="bname" type="text" value="<%=bname%>"/> 
            </div><br>
            <div class="bdate">
                出版日期：<input class="bdate_edit" name="bdate" type="text" value="<%=bdate%>"/> 
            </div><br>
            <div class="bpublish">
                出版社：<input class="bpublish_edit" name="bpublish" type="text" value="<%=bpublish%>"/> 
            </div><br>
            <div class="bplace">
                位置：<input class="bplace_edit" name="bplace" type="text" value="<%=bplace%>"/> 
            </div><br>
            <div class="bnum">
                数量：<input class="bnum_edit" name="bnum" type="text" value="<%=bnum%>"/> 
            </div><br>
            <div class="button">
                <input class="update" type="submit" value="修改"/>
                <input class="clear" type="button" value="清空" onclick="cl()">
            </div>
        </form>
        <p><%=msg%></p>
        <a href="browseBook.jsp" class="back">返回</a>
    </div>

</body>
</html>