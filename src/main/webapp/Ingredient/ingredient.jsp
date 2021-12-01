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
                        <li class="nav-item"><a class="nav-link" href="../recommend/recommend.jsp">Recommend Product</a></li>
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
	
	
   ArrayList<Integer> Inumber = new ArrayList<>();
   ArrayList<String> Iname = new ArrayList<>();
   ArrayList<String> grade_num = new ArrayList<>();
   ArrayList<String> grade_name = new ArrayList<>();
 
  
%>        
        
       
        <!-- Page Content-->
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
        <br>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center  my-5"style=" margin-top: 45px;">
				<div class="col-lg-6"><img class="img-fluid rounded mb-4 mb-lg-0" src="./ingredient.jpg" style=" width:100%; height:40%;" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">WE PROVIDES INFORMATION ON INGREDIENTS</h1><br>
                    <p style="font-family: 'InfinitySans-RegularA1'; margin-bottom: 20px;" >당신이 원하는 성분 위험도 및 성분 등급에 따른 성분 정보를 제공해드립니다. 📚💡
            <form action = "ingredient.jsp" method = "POST">
			  <div class="form-row align-items-center" style="flex-wrap: nowrap; align-content: center; justify-content: center">
			    <div class="col-auto my-1">
			      <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
			      <select name = "grade" class="custom-select mr-sm-2" id="inlineFormCustomSelect" style="font-family: 'InfinitySans-RegularA1';">
			        <option selected >성분 위험도 선택</option>
			        <option value="1">낮은 위험도</option>
			        <option value="2">중간 위험도</option>
			        <option value="3">높은 위험도</option>
			      </select>
			    </div>
			    
			    <div class="col-auto my-1">
			      <div class="custom-control custom-checkbox mr-sm-2">
			        <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
			        <label class="custom-control-label" for="customControlAutosizing">Remember my preference</label>
			      </div>
			    </div>
			    <div class="col-auto my-1">
			      <button type="submit" class="btn btn-primary" style="font-family: 'InfinitySans-RegularA1';">확인하기</button>
			    </div>
			  </div>
			  
			</form>                	
     		
            	
                </div>
                
            </div>
			
			<% 
				String grade= request.getParameter("grade"); 
				String gradename = "";
				if(grade.equals("1")) gradename = "낮은 위험도";
				else if(grade.equals("2"))gradename = "중간 위험도";
				else gradename = "높은 위험도";
				
			  String query =  "SELECT Inumber, Iname, grade_num, grade_name "
			  		+ "FROM INGREDIENT "
			  		+ "WHERE Grade_name IN(SELECT Grade_name FROM INGREDIENT WHERE Grade_name='"+ gradename +"')";
			   pstmt = conn.prepareStatement(query);
			   rs = pstmt.executeQuery();
		       while(rs.next()){
		    	   Inumber.add(rs.getInt(1));
		    	   Iname.add(rs.getString(2));
		    	   grade_num.add(rs.getString(3));
		    	   grade_name.add(rs.getString(4));
		       }
			%>
			
			<table class="table">
			  <thead class="thead-dark" style = "font-family: 'InfinitySans-RegularA1';" >
			    <tr >
			      <th scope="col" >성분번호</th>
			      <th scope="col">성분이름</th>
			      <th scope="col">성분등급</th>
			      <th scope="col">성분위험도</th>
			    </tr>
			  </thead>
			  <tbody style="font-family: 'InfinitySans-RegularA1';">
			  
			  	<%
                for(int i=0; i<Inumber.size(); i++){
				%>
			    <tr>
			      <th scope="row"><%out.print(Inumber.get(i));%></th>
			      <td><%out.print(Iname.get(i));%></td>
			      <td><%out.print(grade_num.get(i));%></td>
			      <td><%out.print(grade_name.get(i));%></td>
			    </tr>
			    
			   	<%
			   	}
			   	%> 
			  </tbody>
			</table>
<%-- 
       <div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<%
                for(int i=0; i<cos_num.size(); i++){
			%>
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
        </div> --%>
        
        
        <!-- Footer-->
        <br></br>
        </div>
       <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
</head>
<body>

</body>
</html>