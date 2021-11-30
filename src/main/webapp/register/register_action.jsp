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
   
   String name = request.getParameter("name");
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   String address = request.getParameter("address");
   String phone = request.getParameter("phone");
   String birth = request.getParameter("birth");
   String personal_color = request.getParameter("personal_color");
   String skin_type = request.getParameter("skin_type");
   String sex = request.getParameter("sex");
   
   String sql = "SELECT * FROM CUSTOMER WHERE Customer_id = "+id;
   boolean check=false;
   
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();
   
   if(rs.next()!=false){
	   check=true;
   }
   
   if(check==true){
	   out.println("<script>alert('중복된 아이디입니다.'); history.back();</script>");
   }
   else{
	   sql = "INSERT INTO CUSTOMER VALUES (" + "'" + address + "'" + ", '" + personal_color+ "', " + "'" + skin_type
               + "'" + "," + "'" + password + "'" + "," + id + "," + "'" + name + "'" + ", '"
               + phone + "', " + 0 + ", '" + birth + "'" + ", '" + sex + "'," + 0 +")";
	   System.out.println(sql);
	   pstmt.executeUpdate(sql);
	   out.println("<script>alert('회원가입이 성공하였습니다.');  history.back()</script>");
   }
   
   %>
</body>
</html>