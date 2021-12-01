<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ page language="java" import="java.text.*, java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update</title>
</head>
<body>
<%
String serverIP = "localhost";
String strSID = "orcl";
String portNum = "1521";
String user = "hr";
String pass = "hr";
String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
Connection conn = null;
PreparedStatement pstmt;
Statement stmt=null;
ResultSet rs;
int res;
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url,user,pass);

HttpSession sess = request.getSession();	 
String id = (String)session.getAttribute("id");


 
String sql;
String address=request.getParameter("address");
String color=request.getParameter("color");
String skin=request.getParameter("skin");
String pwd=request.getParameter("pwd");
String ID=request.getParameter("id");
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String birth=request.getParameter("birth");
String sex=request.getParameter("sex");
   			
sql = "UPDATE CUSTOMER SET Address = '" + address + "',Personal_Color='"+color+"',Skin_Type='"+skin+"',Customer_pwd='"+pwd+"',Customer_id='"+id+"',CusName='"+name+"',Phone='"+phone+"',Birth='"+birth+"',Sex='"+sex+"'WHERE Customer_id = '" + ID + "' ";

conn.commit();
stmt = conn.createStatement();
res=stmt.executeUpdate(sql);
conn.commit();

sess.invalidate();


%>


</body>
</html>