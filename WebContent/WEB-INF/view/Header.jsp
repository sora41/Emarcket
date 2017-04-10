<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/login.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--
<link href="css/fasthover.css" rel="stylesheet" type="text/css"
	media="all" />
	
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />-->
<link href="css/font-awesome.css" rel="stylesheet">



<title>Bienvenu E-market</title>
</head>
<body>


	<!-- header modal -->
	<!-- header -->
	<div class="header" id="home1">
		<div class="container">
			<div class="w3l_login">
				<a href="#" data-toggle="modal" data-target="#myModal88"><span
					class="glyphicon glyphicon-user" aria-hidden="true"> </span></a> <span
					class="w3l_login"> <c:if
						test="${!empty sessionScope.sessionUtilisateur}">
						<%-- Si l'utilisateur existe en session, alors on affiche son adresse email. --%>
						<c:out value="${sessionUtilisateur.login}">
						</c:out>
					</c:if></span>
			</div>
			<div class="w3l_logo">
				<h1>
					<a href="index.jsp">E Market<span>Your Computeur. Your
							Components.</span></a>
				</h1>
			</div>
			<!--<div class="search">
				<input class="search_box" type="checkbox" id="search_box">
				<label class="icon-search" for="search_box"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></label>
				<div class="search_form">
					<form action="#" method="post">
						<input type="text" name="Search" placeholder="Search...">
						<input type="submit" value="Send">
					</form>
				</div>
			</div>-->
			<c:if test="${!empty sessionScope.sessionUtilisateur}">

				<div class="cart cart box_1">
					<form action="Panier" method="post" class="last">
						<input type="hidden" name="cmd" value="_cart" /> <input
							type="hidden" name="display" value="1" />
						<button class="w3view-cart" type="submit" name="submit" value="">
							<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
						</button>
					</form>
				</div>
				<div class="register">
					<ul>
						<li class="resp-tab-item" aria-controls="tab_item-0"><a
							href="<c:url value="/DisconectUserServ"/>">deconnecter</a></li>

					</ul>

				</div>

			</c:if>

		</div>
	</div>

	<!-- navigation -->
	<div class="navigation">
		<div class="container">
			<nav class="navbar navbar-default"> <!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header nav_2">
				<button type="button" class="navbar-toggle collapsed navbar-toggle1"
					data-toggle="collapse" data-target="#bs-megadropdown-tabs">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
				<ul class="nav navbar-nav">
					<!--  <li><a href="index.jsp" class="act">Home</a></li>
					 Mega Menu -->
					<c:if test="${!empty sessionScope.sessionUtilisateur}">
						<li class="dropdown"><a
							href="<c:url value="/CatalogueServ"/>">catalogue</a></li>
						<c:choose>
							<c:when
								test="${sessionScope.sessionUtilisateur.role == 'Internaute'}">
							</c:when>
							<c:otherwise>
								<li class="dropdown"><a
									href="<c:url value="CreateProduct"/>">Ajouter un produit</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					<!--<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Products  -->
					<!--<b class="caret">-->
					</b>

					<!-- <ul class="dropdown-menu multi-column columns-3">
								<div class="row">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Mobiles</h6>
											<li><a href="products.html">Mobile Phones</a></li>
											<li><a href="products.html">Mp3 Players <span>New</span></a></li> 
											<li><a href="products.html">Popular Models</a></li>
											<li><a href="products.html">All Tablets<span>New</span></a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
											<h6>Accessories</h6>
											<li><a href="products1.html">Laptop</a></li>
											<li><a href="products1.html">Desktop</a></li>
											<li><a href="products1.html">Wearables <span>New</span></a></li>
											<li><a href="products1.html"><i>Summer Store</i></a></li>
										</ul>
									</div>
									<div class="col-sm-2">
										<ul class="multi-column-dropdown">
											<h6>Home</h6>
											<li><a href="products2.html">Tv</a></li>
											<li><a href="products2.html">Camera</a></li>
											<li><a href="products2.html">AC</a></li>
											<li><a href="products2.html">Grinders</a></li>
										</ul>
									</div>
									<div class="col-sm-4">
										<div class="w3ls_products_pos">
											<h4>30%<i>Off/-</i></h4>
											<img src="images/1.jpg" alt=" " class="img-responsive" />
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul>-->
					</li>
					<li><a href="#">Apropos de nous </a></li>
					<!--
					<li class="w3pages"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Pages <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="icons.html">Web Icons</a></li>
							<li><a href="codes.html">Short Codes</a></li>
						</ul></li>-->
					<!--<li><a href="mail.html">Mail Us</a></li>-->
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<!-- //navigation -->
</html>