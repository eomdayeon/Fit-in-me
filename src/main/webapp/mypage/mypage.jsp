<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import ="java.text.*, java.sql.*, java.util.ArrayList"%>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>My Page</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    
  </head>
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
               
               String Name;
               
               ArrayList<String> cos_name = new ArrayList<>();
               String sql="SELECT co.Cos_name FROM COSMETICS co,CUSTOMER cu,ORDERING o WHERE cu.Customer_id = "+id+"AND cu.Customer_id=o.Cus_id AND o.Cos_id=co.Cosmetic_id";
               pstmt = conn.prepareStatement(sql);
                      
               rs = pstmt.executeQuery();
               while(rs.next())
               {
                  cos_name.add(rs.getString(1));
               }
      
      %>
<form action="update.jsp" method="get">
  <body class="bg-light">
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
                            Logout
<!--                             <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
                        </button>
                    </form>
                </div>
            </div>
        </nav>

    <div class="container">
      <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="./user.png" alt="" width="72" height="72">
        <h2>You can modify your information!</h2>
      </div>

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Order List</span>
            <span class="badge badge-secondary badge-pill"><%out.print(cos_name.size());%></span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">
            <%
			  for(int i=0; i<cos_name.size(); i++){
				  out.println(cos_name.get(i));
			  }
			%>

                </h6>
                
              </div>
              <span class="text-muted">
              <%
               sql="SELECT co.Price FROM COSMETICS co,CUSTOMER cu,ORDERING o WHERE cu.Customer_id = "+id+"AND cu.Customer_id=o.Cus_id AND o.Cos_id=co.Cosmetic_id";
               pstmt = conn.prepareStatement(sql);
               ResultSet rs2 = pstmt.executeQuery();
     
               while(rs2.next())
               {
                  out.println("$"+rs2.getString(1));
               }
            %></span>
            </li>
          </ul>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">User information</h4>
          <form class="needs-validation" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">User Name</label>
                <%
               String name;
               
               sql="SELECT Cusname FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  name=rs.getString(1);
                  out.println("<input type='text' class='form-control' id='name' value='"+name+"' placeholder='User name' required name='name'>");
             
               }
            %>
                
                <div class="invalid-feedback">
                  Valid user name is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="username">User ID</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <%
            
               
               String userid;
               
               sql="SELECT Customer_id FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  userid=rs.getString(1);
                  out.println("<input type='text' class='form-control' id='useid' value='"+userid+"' placeholder='User ID' required name='id'>");
             
               }
            %>
                
               
                <div class="invalid-feedback" style="width: 100%;">
                  Your user ID is required.
                </div>
              </div>
            </div>


            <div class="mb-3">
              <label for="username">User Password</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <%
               String pwd;
               
               sql="SELECT Customer_pwd FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  pwd=rs.getString(1);
                  out.println("<input type='text' class='form-control' id='password' value='"+pwd+"' placeholder='User Password' required name='pwd'>");
             
               }
            %>
               
                <div class="invalid-feedback" style="width: 100%;">
                  Your user password is required.
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <%
               String ads;
               
               sql="SELECT Address FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  ads=rs.getString(1);
                  out.println("<input type='text' class='form-control' id='address' value='"+ads+"' placeholder='Address' required name=address>");
             
               }
            %>
             
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">Phone Number <span class="text-muted">(Optional)</span></label>
              <%
               String phone;
               
               sql="SELECT Phone FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  phone=rs.getString(1);
                  out.println("<input type='text' class='form-control' id='phone' value='"+phone+"' placeholder='010-****-****' required name=phone>");
             
               }
            %>
             
            </div>

            <div class="row">
              <div class="col-md-4 mb-3">
                <label for="country">Personal Color</label>
                <select class="custom-select d-block w-100" name='color' id="country" required>
                <%
               sql="SELECT Personal_color FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  
                  out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
             
               }
            %>

                  <option>봄웜</option>
                  <option>겨울쿨</option>
                  <option>여름쿨</option>
                  <option>가을웜</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid personal color.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Sex</label>
                <select class="custom-select d-block w-100" name= 'sex' id="state" required>
                <%
               String sex;
               
               sql="SELECT Sex FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
               }
            %>
                  
                  <option>Male</option>
                  <option>Female</option>
                </select>
                <div class="invalid-feedback">
                  Please provide a valid sex.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">Skin Type</label>
                <select class="custom-select d-block w-100"  name = 'skin' id="state" required>
                <%
               String skin;
               
               sql="SELECT Skin_Type FROM CUSTOMER WHERE Customer_id = "+id;
               pstmt = conn.prepareStatement(sql);
               rs = pstmt.executeQuery();
     
               while(rs.next())
               {
                  out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
             
               }
            %>
                  
                  <option>중성</option>
                  <option>복합성</option>
                  <option>건성</option>
                  <option>지성</option>
                </select>
                <div class="invalid-feedback">
                  Please provide a valid skin type.
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="save-info">
              <label class="custom-control-label" for="save-info">Save this information for next time</label>
            </div>
            <hr class="mb-4">
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
          </form>
        </div>
      </div>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2018 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../../../assets/js/vendor/popper.min.js"></script>
    <script src="../../../../dist/js/bootstrap.min.js"></script>
    <script src="../../../../assets/js/vendor/holder.min.js"></script>
    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
  </body>
 </form>
</html>