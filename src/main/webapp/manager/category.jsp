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
        <title>Cosmetic Category</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        
        <!-- Core theme CSS (includes Bootstrap)-->
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
                        <li class="nav-item"><a class="nav-link" href="#!">Keyword Search</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Ingredient dictionary</a></li>

                    </ul>
                    <form class="d-flex">
                        <input class="btn btn-outline-dark" type="button" onclick="location.href='product_register.html'" value="상품등록"/>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">cosmetic</h1>
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
   
   Integer para = Integer.parseInt(request.getParameter("catenumber"));
   String query = "SELECT Cosmetic_id, Cos_name, Price FROM COSMETICS C, COSCATEGORY CO WHERE C.catenum = CO.catenumber AND CO.catenumber = "+ para;
  
   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();
   
   ArrayList<Integer> cos_num = new ArrayList<>();
   ArrayList<String> cos_name = new ArrayList<>();
   ArrayList<Integer> price = new ArrayList<>();
   
   while(rs.next()){
	   cos_num.add(rs.getInt(1));
	   cos_name.add(rs.getString(2));
	   price.add(rs.getInt(3));
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
   int cat=1;
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
                <button class=img-button" type="submit" name="click" value="">
                    <i class="fass fa-search"> </i>
                </button>
                <input class='keyword type='text' name='search' maxlength=255 value=""autocomplete="off">
                <select class='SelecSearch' name='WhichSearch'>
                    <option id='Brand' value='Brand'>Brand</option>
                    <option id='Keyword' value='Keyword'>Keyword</option>
                </select>

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
		                  out.println("<img class='card-img-top' src='../photo/"+para+"/"+cat+".jpg' alt='...' />");
		                  cat++;
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
        </section>
<!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        
    </body>
</html>