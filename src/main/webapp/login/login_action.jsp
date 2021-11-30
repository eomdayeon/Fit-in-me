<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
   ResultSet rs;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection(url,user,pass);

   
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   
   String query = "SELECT * FROM CUSTOMER WHERE customer_id = "+id+" AND customer_pwd = '"+ password+"'";
  
   out.println(query);
   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();
   
   if(rs.next()==false){
	   out.println("<script>alert('잘못된 아이디와 패스워드 입니다.'); history.back();</script>");
   }
   else{
	   HttpSession hs = request.getSession();
		hs.setAttribute("id", rs.getString(5));
		out.println("<script>window.location.href='../main/defalt.jsp'</script>");
   }
   %>
   
</body>
</html>