/**
 * 
 */
// dit a javascript de faire in peu mieux son boulot
"use strict";
$.cookie.json = true;
function showErrorLogin(error) {
	if ($("#errorLogin")) {
		if (error == 1) {
			$("#errorLogin").show();
		} else {
			$("#errorLogin").hide();
		}
	}
}

function checkPanier(tab,indice)
{
	//console.log("indice :" +indice)
	if (isNaN(indice)){
		return 0;
	}
	
	//console.log(" tabt[indice] :" +tab[indice]);
	//console.log(" tabt[indice] :" +isNaN(tab[indice]));
	
	// test sur la case de tableau avec l indice est renseigner
	if ((tab[indice] == undefined)){
		return 0;
	}

	
	if (isNaN(tab[indice].qte) )
		{
			return 0;
		}
	else
		{
		 return tab[indice].qte;
		}
	// return isNaN(tab[indice].qte)?0:tab[indice].qte;
}

function generateCookieAdd(id,name,prix,quantity)
{
	var quantity2 =0;
	var chekpanier =0;
	if (!isNaN(quantity)) {
		console.log("id:"+id);
		var cartProducts = $.cookie("panier")||{};
		console.log("tab_cookie"+cartProducts);
		chekpanier =  checkPanier(cartProducts,id);
		quantity2 = quantity + chekpanier;
		console.log("chekpanier ="+chekpanier);			
		console.log("quantity ="+quantity);
		console.log("quantity2 ="+quantity2);
		cartProducts[id] = {qte:quantity2,nom:name,prix:prix};
		$.cookie("panier",cartProducts);
	}
}

function addCartAddItemDetails() {
	$("#add").on('click', function() {
		console.log("apelle addCartAddItemDetails ");
		var quantity = 0;
		quantity =parseInt( $(".value-plus1").parent().find('.value1').text());
		
		var name = $("#ProductName").text();
		var prix =  parseFloat($(".item_price").text());
		var id =parseInt( $(this).val());
		generateCookieAdd(id,name,prix,quantity);
	})
}


function addCartAddItemCatalogue() {
	$(".add-cart").on('click', function() {
		
		 var id = parseInt($(this).attr("data-id"));
		 console.log("clic add cart"+ id);
		 
		var name =  $(this).parent().parent().find(".nameProduct").text();
		var valuePrixText =$(this).parent().find(".item_price").text();
		var prix = parseFloat(valuePrixText);
		
		// console.log("prix: "+ prix);
		// console.log("name: "+ name);
		
		generateCookieAdd(id,name,prix,1);
		 
	})
}

function testConsole() {
	$("#add").on('click', function() {
		console.log("clic add cart");
	});
}
function updatePanier(id,qte)
{
	var panier = $.cookie("panier");
	// console.log("qte:"+qte);
	panier[id].qte= qte;
	// console.log("id:"+id);
	$.cookie("panier",panier);
}
function updateCartTotal (unitValue)
{
	var total = parseFloat( $(".CartTTC").text());
	total = total + unitValue;
	$(".CartTTC").text(total);
	$(".CartTTC").attr("data-total",total);
}

function loadEventQuantityAddOnes() {
	$(".value-plus1")
			.on(
					'click',
					function() {
						var divUpd = $(this).parent().find('.value1'), newVal = parseInt(
								divUpd.text(), 10) + 1;
						divUpd.text(newVal);
						if ($("#total").length > 0){
							// console.log("prix unitaire
							// "+$(this).parent().parent().find(".prixU"));
							var baliseUnitProductprice = $(this).parent().parent().find(".prixU");
							var unitProductprice = parseFloat(baliseUnitProductprice.text());
							
							// console.log("prix unitaire "+unitProductprice);
							// console.log("prix total
							// "+$(this).parent().parent().find(".prixT"));
							
							var baliseTotalProductPrice = $(this).parent().parent().find(".prixT");
							var totalProductprice = parseFloat(baliseTotalProductPrice.text());
							// console.log("prix total "+totalProductprice);
							
							totalProductprice = totalProductprice +unitProductprice;
							baliseTotalProductPrice.text(totalProductprice);
							updateCartTotal(unitProductprice);
							var id =parseInt( $(this).parent().find('.value1').attr("data-id"));
							// console.log("id:value1 "+id);
							updatePanier(id,newVal)		
						}
					});
}


function loadEventQuantitySubstractOnes() {
	$(".value-minus1").on('click',
		function() {
			var divUpd = $(this).parent().find('.value1'), newVal = parseInt(
					divUpd.text(), 10) - 1;
			
			
			if (newVal >= 1){
				divUpd.text(newVal);
				if ($("#total").length > 0){
					// console.log("prix unitaire
					// "+$(this).parent().parent().find(".prixU"));
					var baliseUnitProductprice= $(this).parent().parent().find(".prixU");
					var unitProductprice = parseFloat(baliseUnitProductprice.text());
					
					// console.log("prix unitaire
					// "+unitProductprice);
					// console.log("prix total
					// "+$(this).parent().parent().find(".prixT"));
					
					var baliseTotalProductPrice= $(this).parent().parent().find(".prixT");
					var totalProductprice = parseFloat(baliseTotalProductPrice.text());
					// console.log("prix total "+totalProductprice);
					
					totalProductprice = totalProductprice -unitProductprice;
					baliseTotalProductPrice.text(totalProductprice);
					var id =parseInt( $(this).parent().find('.value1').attr("data-id"));
					// console.log("id:value1 "+id);
					updatePanier(id,newVal)		
					
					updateCartTotal(-unitProductprice);
				}
			}
		}
	);
}

function generateCart(Debug = false)
{
	if ($("#listProducts").length > 0)
		{
		if (Debug)
			console.log("panier decteted");
			
		var panier = $.cookie("panier");
		if (Debug)
			console.log("panier cookie "+ panier);

			var numLigne=0;
			var total =0;
			for( var idProduct in panier){
					var subtotal = 0; 
					var nom = panier[idProduct].nom;
					var prix = panier[idProduct].prix;
					var qte = panier[idProduct].qte;
				
					subtotal =  prix * qte;
					total = total +subtotal;
					if (Debug)
						console.log($("#template>.model"));
					$("#template").find(".model").clone().appendTo("#listProducts");
					if (Debug)
						console.log(idProduct);
					var ligne = $("#listProducts").find(".model").eq(numLigne);
					ligne.find(".libelle").text(nom);
					ligne.find(".deleteProduct").attr("data-id",idProduct);
					ligne.find(".value1").text(qte);
					ligne.find(".value1").attr("data-id",idProduct);
					ligne.find(".prixU").text(prix);
					subtotal = Math.round(subtotal*100)/100; 
					ligne.find(".prixT").text(subtotal);	
					numLigne++;
				}
			total = Math.round(total*100)/100; 
			$(".CartTTC").text(total);
			$(".CartTTC").attr("data-total",total);
			loadEventQuantityAddOnes();
			loadEventQuantitySubstractOnes();
			deleteitemCart();
			
		}
	else
		{
		if (Debug)
			console.log("panier not found");
		}
}

function deleteitemCart()
{
	$(".deleteProduct").on("click",function () {
		//console.log("delete");
		var panier = $.cookie("panier");
		var id = $(this).attr("data-id");
		//console.log("id:"+id);
		var subtotal = panier[id].prix * panier[id].qte;
		//console.log("subtotal:"+ subtotal);
		var total = parseFloat(($("#total").attr("data-total")));
		//console.log("total:"+ total);
		total = total - subtotal;
		//console.log("total:"+ total);
		delete panier[id];
		$.cookie("panier",panier);
		$(this).parents(".model").remove();
		$("#total").attr("data.total",total).text(total);	
	})
}

function ValidateCart()
{	
	$("#validerPanier").on("click",function(){
		// url = url de la servlet
		// data les donne a transmetre
		// la reponse renvoie par le serveur
		// $.post("url",data, function(reponse){
		console.log("APELLE AJAX")
		$.post("ValidateCartServ",{panier:JSON.stringify($.cookie("panier"))}, function(reponse){
			// traite commander
			console.log("reponse:"+reponse)
			if (reponse =="ok")
				{alert("appelle AJAX reussi ")}
		})
	});
}