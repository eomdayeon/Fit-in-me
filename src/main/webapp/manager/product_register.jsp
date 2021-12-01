<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	   String sql;
	   
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	String price = request.getParameter("price");
	String capacity = request.getParameter("capacity");
	String date = request.getParameter("date");
	String catenum = request.getParameter("catenum");
	String Bnum = request.getParameter("Bnum");
	int cosmetic_id = 0;
	int res = 0;
	
	sql="SELECT MAX(Cosmetic_id) FROM COSMETICS";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
    while(rs.next()) {
       cosmetic_id = rs.getInt(1);
       cosmetic_id++;
    }
    sql = "INSERT INTO COSMETICS VALUES ("+cosmetic_id+", "+price+", '"+type+"', '"
            +date+"', '"+name+"', '"+capacity+"', "+catenum
            +", "+Bnum+")";
    res = pstmt.executeUpdate(sql);
    
    if(res==1) {
        sql = "SELECT Cos_name FROM COSMETICS WHERE Cosmetic_id = "+cosmetic_id;
        rs = pstmt.executeQuery(sql); 
        while(rs.next()) {
        	out.println("<script>alert('제품 등록을 성공하였습니다.'); window.location.href='defalt.jsp'</script>");
        }
    }
	%>
</body>
</html>