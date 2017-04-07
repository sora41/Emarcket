<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>



<!-- single -->
<div class="single">
	<div class="container">
		<div class="col-md-4 single-left">
			<div class="flexslider">
				<ul class="slides">

					<div class="thumb-image">
						<img src="${product.pathImg}" data-imagezoom="true"
							class="img-responsive" alt="">
					</div>

				</ul>
			</div>
			<!-- flexslider -->
			<script defer src="js/jquery.flexslider.js"></script>
			<link rel="stylesheet" href="css/flexslider.css" type="text/css"
				media="screen" />
			<script>
				// Can also be used with $(document).ready()
				/*
				$(window).load(function() {
					$('.flexslider').flexslider({
						animation : "slide",
						controlNav : "thumbnails"
					});
				});
				*/
			</script>
			<!-- flexslider -->
			<!-- //zooming-effect -->
		</div>
		<div class="col-md-8 single-right">
			<h3 id = "ProductName">
				<c:out value="${product.name}"></c:out>
			</h3>
			<div class="rating1">
				<span class="starRating"> <input id="rating5" type="radio"
					name="rating" value="5"> <label for="rating5">5</label> <input
					id="rating4" type="radio" name="rating" value="4"> <label
					for="rating4">4</label> <input id="rating3" type="radio"
					name="rating" value="3" checked> <label for="rating3">3</label>
					<input id="rating2" type="radio" name="rating" value="2"> <label
					for="rating2">2</label> <input id="rating1" type="radio"
					name="rating" value="1"> <label for="rating1">1</label>
				</span>
			</div>
			<div class="description">
				<h5>
					<i>Description</i>
				</h5>
				<p>
					<c:out value="${product.description}"></c:out>
					.
				</p>
			</div>
			<c:choose>
				<c:when test="${empty product.components}">
				</c:when>
				<c:otherwise>
					<div class="description">
						<h5>
							<i>Details</i>
						</h5>
						<p>
							<c:forEach var="component" items="${product.components}">
								<c:out value="${component.name}"></c:out>
								<c:out value="${component.libelle}"></c:out>
								<c:if test="${not empty component.unit}">
									<c:out value="${component.value}"></c:out>
									<c:out value="${component.unit}"></c:out>
								</c:if>
								<br />
							</c:forEach>
							.
						</p>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="color-quality">
				<div class="color-quality-right">
					<h5>Quatity :</h5>
					<div class="quantity">
						<div class="quantity-select">
							<div class="entry value-minus1">&nbsp;</div>
							<div class="entry value1" >
								<span> 1 </span>
							</div>
							<div class="entry value-plus1 active">&nbsp;</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>

			<div class="simpleCart_shelfItem">
				<p>
					<i class="item_price"><c:out
							value="${product.sellingPrice}"></c:out></i> euro
				</p>
				<!--<form action="" method="post">-->
					<input type="hidden" name="cmd" value="_cart"> <input
						type="hidden" name="add" value="${product.name}"> <input type="hidden"
						name="w3ls_item" value="<c:out value="${product.name}"></c:out>">
					<input type="hidden" name="amount"
						value=<c:out value="${product.sellingPrice}"></c:out>>
					<button type="submit" id="add" class="w3ls-cart" value="${product.id}">Add to cart</button>
			<!--  	</form>-->
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<%@ include file="/WEB-INF/view/Footer.jsp"%>
			<!-- zooming-effect -->
			<script src="js/imagezoom.js"></script>


<script>
$(function(){
	addCartAddItemDetails();
	loadEventQuantityAddOnes();
	loadEventQuantitySubstractOnes();
})
</script>
</html>