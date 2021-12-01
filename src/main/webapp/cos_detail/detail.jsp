<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<%
   int cos_num=Integer.parseInt(request.getParameter("num"));
   int cat=Integer.parseInt(request.getParameter("cat"));
   
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
   
   String query="SELECT * FROM COSMETICS WHERE Cosmetic_id = "+cos_num;
   
   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();
   
   int price=0, cate_num=1;
   String cos_type="", exp_date="", cos_cap="", cos_name="";
   
   while(rs.next()){
      price=rs.getInt(2);
      cos_type=rs.getString(3);
      exp_date=rs.getString(4);
      cos_name=rs.getString(5);
      cos_cap=rs.getString(6);
      cate_num=rs.getInt(7);
   }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>cosmetics detail</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../main/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        
        <link href="detail_styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="../main/defalt.jsp">Fit In Me</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0"  style="    margin-left: 100px;margin-right: 120px;">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="../main/defalt.jsp">Cosmetic Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../recommend/recommend.jsp">Recommend Product</a></li>
                        <li class="nav-item"><a class="nav-link" href="keyword.html">Keyword Search</a></li>
                        <li class="nav-item"><a class="nav-link" href="../ingredient/ingredient.html">Ingredient dictionary</a></li>
                    </ul>
                    <form class="d-flex" action="../mypage/mypage.jsp">
                        <button class="btn btn-outline-light" type="submit" on click="window.location='mypage.jsp'">
                            <!-- <i class="bi-cart-fill me-1"></i> -->
                            MyPage
<!--                             <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-6">
                <%
                  out.println("<img class='img-fluid rounded mb-4 mb-lg-0' src='../photo/"+cate_num+"/"+cat+".jpg' style='float: center;' alt='...' />");
                %>
                </div>
                <div class="col-lg-5">
                   <h4 style="font-family: 'InfinitySans-RegularA1';"><%out.print(cos_type);%></h4>
                    <h2 style="font-family: 'InfinitySans-RegularA1';"><%out.print(cos_name);%></h2>
                    <h3 style="font-family: 'InfinitySans-RegularA1';"><%out.print(price);%>$</h3>
                    <form action="${pageContext.request.contextPath}/cos_detail/order.jsp?num=<%out.print(cos_num);%>" method="POST">
                       <p style="font-family: 'InfinitySans-RegularA1';">     수량: <input type="number" name= "order_num" > </p>
                         <p style="font-family: 'InfinitySans-RegularA1';"> 요청메시지: <input type="text" name= "order_msg"> </p>
                         <input style="font-family: 'InfinitySans-RegularA1';" class="btn btn-primary" type="submit" value="구매">
                    </form>
                </div>
                </form>
            </div>
      
            
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body">
                <p class="text-white m-0" style="font-family: 'InfinitySans-RegularA1';"><%out.print(cos_name);%> 제품 정보</p>
                <p class="text-white m-0" style="font-family: 'InfinitySans-RegularA1';">유통기한: <%out.print(exp_date);%> 용량: <%out.print(cos_cap);%></p></div>
            </div>
            <!-- Content Row-->
             <ul class="list-group">
           <li class="list-group-item" style="font-family: 'InfinitySans-RegularA1';">리뷰
              <table class="table table-tripped" id="reviews">
                 <thead>
                    <tr>
                       <th style="font-family: 'InfinitySans-RegularA1';">Rating</th>
                       <th style="font-family: 'InfinitySans-RegularA1';">Keyword</th>
                    </tr>
                 </thead>
                 <tbody>        
                 <%
                    query = "SELECT Rating_id, Ratings FROM RATING WHERE Cos_id = "+cos_num;
                    pstmt = conn.prepareStatement(query);
                  rs = pstmt.executeQuery();
                  ArrayList<Integer> ratings = new ArrayList<>();
                  ArrayList<Integer> rating_id = new ArrayList<>();
                  ArrayList<String> keyword = new ArrayList<>();
                  while(rs.next()){
                     ratings.add(rs.getInt(2));
                     rating_id.add(rs.getInt(1));
                  }
                  
                  for(int i=0; i<ratings.size(); i++){
                     query = "SELECT Keyword FROM RATING_KEYWORD WHERE Rid = "+rating_id.get(i);
                       pstmt = conn.prepareStatement(query);
                     rs = pstmt.executeQuery();
                     while(rs.next()){
                        keyword.add(rs.getString(1));
                     }
                  }
                  
                  for(int i=0; i<ratings.size(); i++){
                 %>
                    <tr>
                       <td>
                       <%
                          switch(ratings.get(i)){
                          case 1: out.print("⭐");
                             break;
                          case 2: out.print("⭐⭐");
                             break;
                          case 3: out.print("⭐⭐⭐");
                             break;
                          case 4: out.print("⭐⭐⭐⭐");
                             break;
                          case 5: out.print("⭐⭐⭐⭐⭐");
                             break;
                          }
                       %>
                       </td>
                       <td style="font-family: 'InfinitySans-RegularA1';">
                       <%
                       out.print(keyword.get(i));
                       %>
                       </td>
                    </tr>
                 <%
                  }
                 %>
                 </tbody>
              </table>
           </li>
           <li class="list-group-item" style="font-family: 'InfinitySans-RegularA1';">성분
              <table class="table table-tripped" id="ingredient">
                    <thead>
                       <tr>
                          <th style="font-family: 'InfinitySans-RegularA1';">구성성분</th>
                          <th style="font-family: 'InfinitySans-RegularA1';">위험도</th>
                       </tr>
                    </thead>
                    <tbody> 
                       <%
                          query = "SELECT Ino FROM COMPOSE WHERE Cos_id = "+cos_num;
                          pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();
                        ArrayList<Integer> ing = new ArrayList<>();
                        while(rs.next()){
                           ing.add(rs.getInt(1));
                        }
                        
                        ArrayList<String> iname = new ArrayList<>();
                        ArrayList<String> grade = new ArrayList<>();
                        
                        for(int i=0; i<ing.size(); i++){
                           query = "SELECT Iname, grade_name FROM INGREDIENT WHERE Inumber ="+ing.get(i);
                             pstmt = conn.prepareStatement(query);
                           rs = pstmt.executeQuery();
                           while(rs.next()){
                              iname.add(rs.getString(1));
                              grade.add(rs.getString(2));
                           }
                        }
                        
                        for(int i=0; i<ing.size(); i++){
                       %>
                       <tr>
                          <td style="font-family: 'InfinitySans-RegularA1';">
                             <%
                                out.print(iname.get(i));
                             %>
                          </td>
                          <td style="font-family: 'InfinitySans-RegularA1';">
                             <%
                                out.print(grade.get(i));
                             %>
                          </td>
                       </tr>
                       <%
                        }
                       %>
                 </tbody>
              </table>
           </li>
           <li class="list-group-item" style="font-family: 'InfinitySans-RegularA1';">해당 상품을 구매한 고객님 정보
              <table class="table table-tripped" id="order">
                 <thead>
                    <tr>
                       <th style="font-family: 'InfinitySans-RegularA1';">고객님</th>
                       <th style="font-family: 'InfinitySans-RegularA1';">퍼스널 컬러</th>
                       <th style="font-family: 'InfinitySans-RegularA1';">피부 타입</th>
                    </tr>
                 </thead>
                 <tbody>  
                    <%
                       query = "SELECT Cus_id FROM ORDERING WHERE Cos_id = "+cos_num;
                       pstmt = conn.prepareStatement(query);
                     rs = pstmt.executeQuery();
                     ArrayList<Integer> order_cur = new ArrayList<>();
                     ArrayList<String> per = new ArrayList<>();
                     ArrayList<String> skin = new ArrayList<>();
                     
                     while(rs.next()){
                        order_cur.add(rs.getInt(1));
                     }
                     for(int i=0; i<order_cur.size(); i++){
                        query = "SELECT Skin_Type, Personal_color FROM CUSTOMER WHERE Customer_id = "+order_cur.get(i);
                          pstmt = conn.prepareStatement(query);
                        rs = pstmt.executeQuery();
                        while(rs.next()){
                           skin.add(rs.getString(1));
                           per.add(rs.getString(2));
                        }
                     }
                     
                     for(int i=0; i<order_cur.size(); i++){
                    %>
                    <tr>
                       <td>
                          <%
                             out.print(i+1);
                          %>
                       </td>
                       <td style="font-family: 'InfinitySans-RegularA1';">
                          <%
                             out.print(per.get(i));
                          %>
                       </td>
                       <td style="font-family: 'InfinitySans-RegularA1';">
                         <%
                             out.print(skin.get(i));
                          %>
                      </td>
                    </tr>
                    <%
                     }
                    %>
                 </tbody>
              </table>
           </li>
         </ul>
        </div>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>

    </body>
</html>