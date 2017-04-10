<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>
<div class="mobiles">
	<div class="container">
		<p>affichage Produit disponible en stock</p>
		<!--  test affichage produit boot strap -->
		<div class="w3ls_mobiles_grid_right_grid3">
			<c:choose>
				<c:when test="${empty products}">
			Aucun reference contenu dans le catalogue
		</c:when>
				<c:otherwise>
					<c:forEach var="product" items="${products}" varStatus="status">
						<c:if test="${status.first}" var="rowZero">
							<div id="ZERO" class="row">
								<!--  changer condition  regarder varible pour le premier 
								et le dernier sur le foreach 
							 -->
						</c:if>


						<div
							class="col-lg-4 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
							<img src=${product.pathImg } alt=" " class="img-responsive" />
							<h5 class ="nameProduct" >${product.name}</h5>
							<div class="simpleCart_shelfItem">
								<p>
									<i class="item_price">${product.sellingPrice} Euro</i>
								</p>

								<input type="hidden" name="id"
									value=<c:out value="${product.id}"></c:out> />
								<button type="submit" class="w3ls-cart add-cart" data-id=" ${product.id}" >Ajouter aux panier</button>
								<form id="details" action="/EMarket3/DetailsProduitServ"
									method="post">
									<input type="hidden" name="id"
										value=<c:out value="${product.id}"></c:out> />
									<button class="w3ls-cart" type="submit">Details</button>
								</form>
							</div>
						</div>
						<c:if test="${ 0 == (status.count % 3)}" var="rowMod3">
		</div>
		<div id="Row${status.count}" class="row">
			</c:if>
			<c:if test="${status.last}">
		</div>
		</c:if>
		</c:forEach>
		</c:otherwise>
		</c:choose>
		<div class="clearfix"></div>
	</div>
</div>

</div>

<%@ include file="/WEB-INF/view/Footer.jsp"%>
<script>
	addCartAddItemCatalogue();
</script>
</html>