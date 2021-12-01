<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int cos_num=Integer.parseInt(request.getParameter("num"));
	String id = (String)session.getAttribute("id");
	String order_num = request.getParameter("order_num");
	String order_msg = request.getParameter("order_msg");
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
   
   int ordernum = 0;
   int check=0;
   int res = 0;
   
   Random random = new Random(); 
   random.setSeed(System.currentTimeMillis());
   
   ordernum = random.nextInt();
   String sql = "SELECT Ordernumber FROM ORDERING";
   while (true) {
	  pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
          if (rs.getInt(1) == ordernum) {
             check=1;
          }
       }
      if(check==0)
    	  break;
      ordernum = random.nextInt(100000);
   }
   
   sql = "INSERT INTO ORDERING VALUES ("+ordernum+ ", '"+order_msg+"', "+order_num+", "+id+", "+cos_num+")";
   res = pstmt.executeUpdate(sql);
   
   if(res==1){
	   out.println("<script>alert('备概窍看嚼聪促.'); history.back(); </script>");
   }
   else{
	   out.println("<script>alert('备概甫 角菩窍看嚼聪促.'); history.back(); </script>");
   }
%>
</body>
</html>