<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
request.setCharacterEncoding("utf-8");
    String msg ="";
    String connectString = "jdbc:mysql://172.18.58.162:3306/library" 	//连接数据库
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 
       ArrayList <String> bno = new ArrayList<String>();
       ArrayList <String> bname = new ArrayList<String>();
	   ArrayList <String> bdate = new ArrayList<String>();
       ArrayList <String> bpublish = new ArrayList<String>();
       ArrayList <String> bplace = new ArrayList<String>();
       ArrayList <String> bnum = new ArrayList<String>();
       try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection(connectString, 
                     "root", "741097"); 	// 数据库账户密码
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery("select * from book");	// 查看book表中的所有内容
        while(rs.next()) {
                
                bno.add(rs.getString("bno"));
                bname.add(rs.getString("bname"));
                bdate.add(rs.getString("bdate"));
                bpublish.add(rs.getString("bpublish"));
                bplace.add(rs.getString("bplace"));
                bnum.add(rs.getString("bnum"));
      }
     
      rs.close();
      stmt.close();
      con.close();
    }
    catch (Exception e){
      msg = e.getMessage();
    }
%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<title>浏览书本名单</title>
<style>		<% // 网页样式设计  %>
#add
{
	text-align:center;
    margin:20px;
}
table{text-align:center ;  margin:0 auto ;}
</style>
</head>
<body>		<% // 网页布局  %>
<div>
    <h1 style="text-align:center;">浏览书本名单</h1>  <% // 图书信息  %>
    <div style="text-align:center;">
        <table border="1" cellspacing= "0" cellpadding="10" bordercolor="black" width="600px">
        <tr>
            <td>图书编号</td>
            <td>名字</td>
            <td>出版日期</td>
            <td>出版社</td>
            <td>存放位置</td>
            <td>数量</td>
            <td>操作</td>
        </tr>
		<%for(int i=0;i<bno.size();i++){%>
        <tr>
            <td><%=bno.get(i)%></td>
            <td><%=bname.get(i)%></td>
            <td><%=bdate.get(i)%></td>
            <td><%=bpublish.get(i)%></td>
            <td><%=bplace.get(i)%></td>
            <td><%=bnum.get(i)%></td>
            <td>
                <a href = "updateBook.jsp?bno=<%=bno.get(i)%>">修改</a>		<% // 对图书信息进行管理或进行借阅、归还等操作  %>
                <a href = "deleteBook.jsp?bno=<%=bno.get(i)%>">删除</a>
                <a href = "borrowBook.jsp?bno=<%=bno.get(i)%>">借阅</a>
                <a href = "rentBook.jsp?bno=<%=bno.get(i)%>">归还</a>
            </td>
        </tr>
        <%}%>
    	</table>  
        <div id="add">
            <a href="addBook.jsp" >新增</a>
            <a href='check.jsp'>返回</a>
        </div>
    </div>
</div>
</body>
</html>