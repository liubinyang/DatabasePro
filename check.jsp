<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>    

<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<style type="text/css">
div{text-align:center ;  margin:0 auto ;}
</style>
</head>

<body>
<div>

<form action="textBook.jsp" method="post" >				<% // 页面布局 %>
<h1>查询图书</h1>
 <p><label for="title">书名：</label>											
   <input name="bname" type="text" maxlength=60 placeholder="输入图书名字"></p>		<% // 具体图书查询 %>
 <p><label for="title">编号：</label>
   <input name="bno" type="text" maxlength=60 placeholder="输入图书编号"></p>
<input name="submit1" type="submit" value="确认"/>
</form><br>
<a href="browseBook.jsp" >查看全部图书</a>			<% // 查看所有图书信息 %>


<form action="textStu.jsp" method="post" >
<h1>查询学生</h1>
 <p><label for="title">学生姓名：</label>
   <input name="sname" type="text" maxlength=60 placeholder="输入学生名字"></p>		<% // 具体借阅者查询  %>
 <p><label for="title">借阅证号：</label>
   <input name="sno" type="text" maxlength=60 placeholder="输入学生证号"></p>
<input name="submit3" type="submit" value="确认"/>
</form><br>
<a href="browseStu.jsp" >查看全部学生</a> <br>		<% // 查看所有学生信息  %>
<a href="browseBorr.jsp" >查看全部借阅信息</a> 		<% // 查看所有借阅图书信息  %>
</div>

</body>
</html>
