<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>
<div class="container">
	<h1>PANIER</h1>
	<div> Validation panier</div>
		<div id="listProducts"></div>
		
	<button id="validerPanier"  class=" col-xs-1 modelProduct">Valider</button>
	<div class=" col-xs-1 ">Total :</div>
	<div id ="total" class=" col-xs-1 CartTTC">0.0</div>
	<div class=" col-xs-1 ">euro</div>
	</div>


	<div id="template" class="hide">
		<div class="model row">

			<button class=" col-xs-1 deleteProduct">X</button>
			<div class=" col-xs-1 libelle">nom defaut</div>
			<div class=" col-xs-1">Quantity</div>
			<div class="  quantity-select">

				<div class="col-xs-1 entry value-minus1">&nbsp;</div>
				<div class="col-xs-1  entry value1">
					<span> 1 </span>
				</div>
				<div class="col-xs-1 entry value-plus1 active">&nbsp;</div>
			</div>
			<div class=" col-xs-1">Prix Unitaire</div>
			<div class=" col-xs-1 prixU">0.0</div>
			<div class=" col-xs-1">euro</div>
			<div class=" col-xs-1">Prix Total</div>
			<div class=" col-xs-1 prixT">0.0</div>
			<div class=" col-xs-1">euro</div>
		</div>
	</div>


<%@ include file="/WEB-INF/view/Footer.jsp"%>
<script>
	$(function() {
		generateCart();
		ValidateCart()
	})
</script>
</html>