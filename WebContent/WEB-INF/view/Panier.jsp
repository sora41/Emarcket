<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>
<div class="container">
	<h1>PANIER</h1>
	<div>Validation </div>
	<div id="templateLegende">
		<div class="model row">

			<div class=" col-xs-1"></div>
			<div class=" col-xs-1 libelle">Designation</div>
			<div class=" col-md-2">Quantite</div>
			<div class=" col-xs-1">Prix Unitaire</div>
			<div class=" col-xs-1">Prix Total</div>
		</div>
	</div>
	<div id="listProducts"></div>

	<div id="LastCartline">
		<div class="model row">
			<button id="validerPanier" class=" col-xs-1 modelProduct">Valider</button>
			<div class=" col-xs-2 "></div>
			<div  class ="col-xs-2">Total de votre Panier :</div>
			<div id="total" class=" col-xs-1 CartTTC">0.0</div>
			<div class=" col-xs-1 ">euro</div>
		</div>
	</div>

	<div id="template" class="hide">
		<div class="model row">

			<button class=" col-xs-1 deleteProduct">X</button>
			<div class=" col-xs-1 libelle">nom defaut</div>
			<!--<div class=" col-xs-1">Quantity</div>-->
			<div class="col-md-2 quantity-select">
				<div class="col-xs-1 entry value-minus1">&nbsp;</div>
				<div class="col-xs-1  entry value1">
					<span> 1 </span>
				</div>
				<div class="col-xs-1 entry value-plus1 active">&nbsp;</div>
			</div>
			<!--<div class=" col-xs-1">Prix Unitaire</div>-->
			<div class=" col-xs-1 prixU">0.0</div>
			<!-- 	<div class=" col-xs-1">euro</div>
		 <div class=" col-xs-1">Prix Total</div>-->
			<div class=" col-xs-1 prixT">0.0</div>
			<div class=" col-xs-1">euro</div>
		</div>
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