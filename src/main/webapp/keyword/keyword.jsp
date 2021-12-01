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
        <title>Keyword Search Review</title>
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
   ResultSet rs2;
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection(url,user,pass);
   
	HttpSession sess = request.getSession();	 
	String id = (String)session.getAttribute("id");
	
   ArrayList<Integer> cos_num = new ArrayList<>();
   ArrayList<String> cos_name = new ArrayList<>();
   ArrayList<String> price = new ArrayList<>();
   ArrayList<Integer> rate = new ArrayList<>();
   
 
  
%>        
        
        <!-- Page Content-->
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
        <br>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center  my-5"style=" margin-top: 45px;">
				<div class="col-lg-6"><img class="img-fluid rounded mb-4 mb-lg-0" src="./keyword.png" style=" width:100%; height:40%;" alt="..." /></div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">PROVIDE INFORMATION BASED ON KEYWORD REVIEWS.</h1><br>
                    <p style="font-family: 'InfinitySans-RegularA1'; margin-bottom: 20px;" >원하는 키워드 선택 시 관련 리뷰를 받은 화장품 정보를 출력해주어 리뷰를 기반으로 한 화장품 선택에 도움을 줍니다. 📍😊   
            <form action = "keyword.jsp" method = "POST">
			  <div class="form-row align-items-center" style="flex-wrap: nowrap; align-content: center; justify-content: center">
			    <div class="col-auto my-1">
			      <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
			      <select name = "key" class="custom-select mr-sm-2" id="inlineFormCustomSelect" style="font-family: 'InfinitySans-RegularA1';">
			        <option selected >키워드 선택</option>
			        <option value="1">각질</option>
			        <option value="2">건조한</option>
			        <option value="3">기름진</option>
			        <option value="4">다크닝</option>
			        <option value="5">다크서클</option>
			        <option value="6">모공커버</option>
			        <option value="7">민감/예민</option>
			        <option value="8">밀착력</option>
			        <option value="9">발림성좋은</option>
			        <option value="10">보습력</option>
			        <option value="11">뾰루지</option>
			        <option value="12">속건조</option>
			        <option value="13">요철</option>
			        <option value="14">유분</option>
			        <option value="15">자연스러움</option>
			        <option value="16">잡티커버</option>
			        <option value="17">좁쌀</option>
			        <option value="18">주름케어</option>
			        <option value="19">지속력</option>
			        <option value="20">촉촉/수분</option>
			        <option value="21">커버력</option>
			        <option value="22">쿨링/시원한</option>
			        <option value="23">트러블</option>
			        <option value="24">향이_좋은</option>
			        <option value="25">홍조</option>
			        <option value="26">화농성</option>
			        <option value="27">화사</option>
			        <option value="28">화이트닝</option>
			        <option value="29">흉터</option>
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
			
			String temp= request.getParameter("key"); 
			String input = "";
			if(temp.equals("1")) input = "각질";
			else if(temp.equals("2"))input = "건조한";
			else if(temp.equals("3"))input = "기름진";
			else if(temp.equals("4"))input = "다크닝";
			else if(temp.equals("5"))input = "다크서클";
			else if(temp.equals("6"))input = "모공커버";
			else if(temp.equals("7"))input = "민감/예민";
			else if(temp.equals("8"))input = "밀착력";
			else if(temp.equals("9"))input = "발림성좋은";
			else if(temp.equals("10"))input = "보습력";
			else if(temp.equals("11"))input = "뾰루지";
			else if(temp.equals("12"))input = "속건조";
			else if(temp.equals("13"))input = "요철";
			else if(temp.equals("14"))input = "유분";
			else if(temp.equals("15"))input = "자연스러움";
			else if(temp.equals("16"))input = "잡티커버";
			else if(temp.equals("17"))input = "좁쌀";
			else if(temp.equals("18"))input = "주름케어";
			else if(temp.equals("19"))input = "지속력";
			else if(temp.equals("20"))input = "촉촉/수분";
			else if(temp.equals("21"))input = "커버력";
			else if(temp.equals("22"))input = "쿨링/시원한";
			else if(temp.equals("23"))input = "트러블";
			else if(temp.equals("24"))input = "향이_좋은";
			else if(temp.equals("25"))input = "홍조";
			else if(temp.equals("26"))input = "화농성";
			else if(temp.equals("27"))input = "화사";
			else if(temp.equals("28"))input = "화이트닝";
			else input="흉터";	
			  String query ="SELECT Cosmetic_id, Cos_name, price,ratings FROM RATING_KEYWORD K, RATING R, COSMETICS C WHERE K.Rid = R.Rating_id AND K.Cuid = R.Cus_id AND K.Coid = R.Cos_id  AND R.Cos_id = C.Cosmetic_id AND K.Keyword= '"+input+"'";
			   pstmt = conn.prepareStatement(query);
			   rs2 = pstmt.executeQuery();
		       while(rs2.next()){
		    	   cos_num.add(rs2.getInt(1));
		    	   cos_name.add(rs2.getString(2));
		    	   price.add(rs2.getString(3));
		    	   rate.add(rs2.getInt(4));
		       }
			%>
			
<%-- 	<div class="container px-4 px-lg-5 mt-5">
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
								<%
									out.print(rate.get(i));
								%>
								점
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
        </div> --%>
        
			<table class="table">
			  <thead class="thead-dark" style = "font-family: 'InfinitySans-RegularA1';" >
			    <tr >
			      <th scope="col" >제품번호</th>
			      <th scope="col">제품이름</th>
			      <th scope="col">제품가격</th>
			      <th scope="col">제품점수</th>
			    </tr>
			  </thead>
			  <tbody style="font-family: 'InfinitySans-RegularA1';">
			  
			  	<%
                for(int i=0; i<cos_num.size(); i++){
				%>
			    <tr>
			      <th scope="row"><%out.print(cos_num.get(i));%></th>
			      <td><%out.print(cos_name.get(i));%></td>
			      <td><%out.print(price.get(i));%>$</td>
			      <td><%out.print(rate.get(i));%>점</td>
			    </tr>
			    
			   	<%
			   	}
			   	%> 
			  </tbody>
			</table>        
        
        
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
