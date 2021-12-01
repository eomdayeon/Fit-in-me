<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Recommend cosmetic</title>
        <!-- 폰트적용 -->
      <style>
      @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Serif+KR&display=swap');
      @font-face {
    font-family: 'InfinitySans-RegularA1';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

      </style>
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="recommend.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
                        <li class="nav-item"><a class="nav-link" href="recommend.jsp">Recommend Product</a></li>
                        <li class="nav-item"><a class="nav-link" href="../keyword/keyword.html">Keyword Search</a></li>
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
   
   HttpSession sess = request.getSession();    
   String id = (String)session.getAttribute("id");
   
   String skin=" ";
   String sql = "SELECT skin_type FROM CUSTOMER WHERE customer_id = "+id;
   pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
     while(rs.next()) {
       skin =  rs.getString(1);
     }
   
   ArrayList<Integer> cos_num = new ArrayList<>();
   ArrayList<String> cos_name = new ArrayList<>();
   ArrayList<Integer> price = new ArrayList<>();
   ArrayList<Integer> cate = new ArrayList<>();
   int cat1=1, cat2=1, cat3=1,cat4=1,cat5=1,cat6=1,cat7=1,cat8=1,cat9=1;
   int check= 1;

  
   int order_no[] = new int[100];
   int count=0;
   sql = "SELECT Ordernumber FROM ORDERING,CUSTOMER WHERE Cus_id=Customer_id AND Cus_id IN "
           + "(SELECT Customer_id FROM CUSTOMER WHERE Skin_type= '"+ skin +"')";
  
   pstmt = conn.prepareStatement(sql);
   rs = pstmt.executeQuery();
  while(rs.next()) {
     order_no[count++]=rs.getInt(1);
  }
  for(int i=0; i<count; i++) {
     sql="SELECT Cosmetic_id, Cos_name, Price, Catenum FROM COSMETICS, ORDERING WHERE Ordernumber="+order_no[i]+" AND Cos_id=Cosmetic_id";
     pstmt = conn.prepareStatement(sql);
     ResultSet rs2  = pstmt.executeQuery();
     while(rs2.next()){
        cos_num.add(rs2.getInt(1));
        cos_name.add(rs2.getString(2));
        price.add(rs2.getInt(3));
        cate.add(rs2.getInt(4));
     }
  }
   
%>        
        
        
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="./recommend.jpg" style=" width:100%; height:40%;" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">WE RECOMMEND COSMETICS THAT YOU MIGHT LIKE!</h1><br>
                    <p style="margin-bottom: 20px;">당신의 피부타입 및 퍼스널 컬러를 기반으로 하여 같은 피부타입 또는 퍼스널컬러를 지닌 다른 고객들의 구매를 분석하여 화장품을 추천해드립니다.⭐🌟⭐</p>
                    <a class="btn btn-primary" href="recommend.jsp" style="font-family: 'InfinitySans-RegularA1';">피부타입 별 추천 화장품!</a>
                    <a class="btn btn-primary" href="recommend2.jsp" style="font-family: 'InfinitySans-RegularA1';">퍼스널컬러 별 추천 화장품!</a>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0" style = "font-family: 'InfinitySans-RegularA1',  font-weight: normal, font-style: normal;" font-size:26px">당신과 동일한 '<%out.print(skin); %>' 스킨타입을 지닌 사용자들이 많이 구매한 상품입니다.</p></div>
            </div>
            

 <%--            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">   <%   out.print(cos_name.get(0)); %></h2>
                            <p class="card-text"></p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">Card Two</h2>
                            <p class="card-text"></p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 class="card-title">Card Three</h2>
                            <p class="card-text"> quam molestias corporis quod, ea minima accusamus.</p>
                        </div>
                        <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>
                    </div>
                </div>
            </div>
        </div> --%>
        
       <div class="container px-4 px-lg-5 mt-5">
      <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         <%
                for(int i=0; i<cos_num.size(); i++){
         %>
            <div class="col mb-5">
               <div class="card h-100">
                  <!-- Product image-->
                  <%
                     switch(cate.get(i)){
                     case 1:

                        out.println("<img class='card-img-top' src='../photo/1/"+cat1+".jpg' alt='...' />");
                        check=cat1++;
                        break;
                     case 2:
                        out.println("<img class='card-img-top' src='../photo/2/"+cat2+".jpg' alt='...' />");
                        check=cat2++;
                        break;   
                     case 3:
                        out.println("<img class='card-img-top' src='../photo/3/"+cat3+".jpg' alt='...' />");
                        check=cat3++;
                        break;
                     case 4:
                        out.println("<img class='card-img-top' src='../photo/4/"+cat4+".jpg' alt='...' />");
                        check=cat4++;
                        break;
                     case 5:
                        out.println("<img class='card-img-top' src='../photo/5/"+cat5+".jpg' alt='...'/>");
                        cat5++;
                        break;
                     case 6:
                        out.println("<img class='card-img-top' src='../photo/6/"+cat6+".jpg' alt='...'/>");
                        check=cat6++;
                        break;
                     case 7:
                        out.println("<img class='card-img-top' src='../photo/7/"+cat7+".jpg' alt='...' />");
                        check=cat7++;
                        break;
                     case 8:
                        out.println("<img class='card-img-top' src='../photo/8/"+cat8+".jpg' alt='...' />");
                        check=cat8++;
                        break;
                     case 9:
                        out.println("<img class='card-img-top' src='../photo/9/"+cat9+".jpg' alt='...' />");
                        check=cat9++;
                        break;
                     }
                  %>
                  <!-- Product details-->
                  <div class="card-body p-4">
                     <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder">
                        <%
                           out.print(cos_name.get(i));
                        %>
                        </h5>
                        <!-- Product price-->
                        <%
                           out.print(price.get(i));
                        %>
                        $
                     </div>
                  </div>
                  <!-- Product actions-->
                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                  </div>
               </div>
            </div>
         <%
                }
         %>
         </div>
         </div>
        </div>
        
        
        <!-- Footer-->
        
       <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>