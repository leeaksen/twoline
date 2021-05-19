<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="twoline.OnelineDAO" %>
<%@ page import="twoline.OnelineDTO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">  
<title>웹 서비스 개발 실습</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
	* {
			font-family: 'Poor Story', cursive;
		}
#home {
        margin-top : 20px;
}

#ti {
color : #660058;
font-size : 30px;
height: 40px;
text-align : center;
margin-bottom : 15px;
background-color : #FAF4C0;
width : 800px;
}

#button {
	box-sizing : border-box;
	height : 35px;
	width : 40px;
	margin : 10px;
	border : solid 1px;
	border-radius : 7px;
	background-color : #B7F0B1;
	font-weight: bold;
	font-size : 15px;
}

#box {
color : #4374D9;
font-size : 25px;
text-align : center;
padding : 0 0 8px;
background-color : #6E2FC7;
margin-bottom : 15px;
width : 800px;
}

p {
	 font-size: 20px;
	 margin: 40px auto;
	 text-align : center;
	 font-weight: bold;
	 
	}
	
	p input {
		box-sizing: border-box;
		height: 25px;
		width: 25px;
		border: solid 1px;
		border-radius: 5px;
		background-color: #FFE08C;
		font-size: 20px;
		text-align : center;
	}
</style>
</head>
<%
   OnelineDAO dao = new OnelineDAO();
   ArrayList<OnelineDTO> dtos = dao.getList();
%>

<body style="background-color: #E8D9FF;">
<div id = "ti">
<h3><b><i>메 모 장</i></b></h3>
</div>
<form method="post" action="memo_write.jsp">
<div id = "box">
<input type="text" name = "memo"></input>
<input id = "button" type = "submit" value ="등록"></input>
</div>
</form>
<div>
<%
   for(int i = 0; i < dtos.size() ; i++) {
      OnelineDTO dto = dtos.get(i);
      out.println("<p>(" + dto.getWdate() + ") " + dto.getMemo() + 
            "<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "'\"><br>");
      out.println("</input></p>");
   }
%>   
</div>
</body>
</html>