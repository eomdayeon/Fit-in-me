<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Cosmetic</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
   <!--      <link href="styles.css" rel="stylesheet" /> -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="defalt.jsp">Fit In Me</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="    margin-left: 100px;margin-right: 120px;">
 
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="defalt.jsp">Cosmetic Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../recommend/recommend.jsp">Recommend Product</a></li>
                        <li class="nav-item"><a class="nav-link" href="../keyword/keyword.html">Keyword Search</a></li>
                        <li class="nav-item"><a class="nav-link" href="../ingredient/ingredient.html">Ingredient dictionary</a></li>
<!--                         <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li> -->
                    </ul>
                    <form class="d-flex" action="../mypage/mypage.jsp">
                        <button class="btn btn-outline-dark" type="submit" on click="window.location='mypage.jsp'">
                            <!-- <i class="bi-cart-fill me-1"></i> -->
                            MyPage
<!--                             <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">cosmetic fit in you</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Customized for each skin type COSMETICS SITE</p>
                </div>
            </div>
        </header>

        <!-- Section-->
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
   
   String query = "SELECT Cosmetic_id, Cos_name, Price, Catenum FROM COSMETICS ";
  
   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();
   
   ArrayList<Integer> cos_num = new ArrayList<>();
   ArrayList<String> cos_name = new ArrayList<>();
   ArrayList<Integer> price = new ArrayList<>();
   ArrayList<Integer> cate = new ArrayList<>();
   ArrayList<String> brand = new ArrayList<>();
   int cat1=1, cat2=1, cat3=1,cat4=1,cat5=1,cat6=1,cat7=1,cat8=1,cat9=1;
   int check= 1;
   
   while(rs.next()){
      cos_num.add(rs.getInt(1));
      cos_name.add(rs.getString(2));
      price.add(rs.getInt(3));
      cate.add(rs.getInt(4));
   }
   
   String querycate = "SELECT Catenumber,catename FROM COSCATEGORY ORDER BY catenumber ASC ";
   
   pstmt = conn.prepareStatement(querycate);
   rs = pstmt.executeQuery();
   
   ArrayList<Integer> catenumber = new ArrayList<>();
   ArrayList<String> catename = new ArrayList<>();
   
   while(rs.next()){
      catenumber.add(rs.getInt(1));
      catename.add(rs.getString(2));
   }
   
%>
<section class="py-5">

           <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 " style=" margin-left: 79px;">
                       <% for (int i=0; i<catenumber.size(); i++){ %>
                        <li class="nav-item"><a class="nav-link" href="category.jsp?catenumber=<%=catenumber.get(i)%>"  style="color: black; margin-right: 10px;margin-left: 10px;" > <% out.print(catename.get(i)); %> </a></li>
                      <% }%>
                    </ul>
                </div>
            </div>
        </nav>
        
                        <!--Search-->
        <form class="search" style="   margin-top: 40px;">
            <div class="text-center">
                <select class='SelecSearch' name='WhichSearch'>
                    <option id='Brand' value='Brand'>Brand</option>
                    <option id='Keyword' value='Keyword'>Keyword</option>
                </select>
                <input class='keyword type='text' name='search' maxlength=255 value=""autocomplete="off">
                <button class=img-button" type="submit" name="click" value="">
                    <i class="fass fa-search"> </i>
                </button>

            </div>
            
        </form>
        
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
                     <div class="text-center">
                     <a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/cos_detail/detail.jsp?num=<%out.print(cos_num.get(i));%>&cat=<%out.print(check);%>">View options</a></div>
                  </div>
               </div>
            </div>
         <%
                }
         %>
        </section>
<!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        
    </body>
</html>