<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>

<div class="container">
  
  <div class="row" id="pwd-container">
    <div class="col-md-4"></div>
    
    <div class="col-md-4">
      <section class="login-form">
        <form method="post" action="/EMarket3/UserConnectServ" role="login">
         <!--   <img src="http://i.imgur.com/RcmcLv4.png" class="img-responsive" alt="" />-->
         <h1> E MARCKET</h1>
          <input type="login" name="login" placeholder="login" required class="form-control input-lg" value="Emarcket" />
          
          <input type="password" name="password" class="form-control input-lg" id="password" placeholder="Password" required="" />
          
          
          <div class="pwstrength_viewport_progress"></div>

          
          <button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Sign in</button>
          <!--<div>
            <a href="#">Create account</a> or <a href="#">reset password</a>
          </div>
          -->
          <div  id="errorLogin" style="display: none;">
          		<div class="alert alert-danger" role="alert"> echecs de la connection </div>
          </div>
        </form>
        <div class="form-links">
          <a href="#">www.EMarkect.com</a>
        </div>
      </section>  
      </div>
      
      <div class="col-md-4"></div>
      
  </div>
  <%@ include file="/WEB-INF/view/Footer.jsp"%>
  <script>
  	showErrorLogin("${errorLogin}");
   </script> 
</div>
</html>