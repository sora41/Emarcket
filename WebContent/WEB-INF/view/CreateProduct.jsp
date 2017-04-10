<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>
	<h1>Ajoute un nouveaux produit</h1>
	<FORM METHOD=POST ACTION="/EMarket3/CreateProductServ1">

			
				Nom
				<INPUT TYPE=TEXT NAME="name">

				prix
				<INPUT TYPE=TEXT NAME="price">
				
				Url-image
				<INPUT TYPE=TEXT NAME="urlImg">
				
				Description
				<INPUT TYPE=TEXT NAME="description">
			
			
				<INPUT TYPE=SUBMIT VALUE="SUBMIT">
				<INPUT TYPE="reset" VALUE="CLEAR">
		
	</FORM>
		<%@ include file="/WEB-INF/view/Footer.jsp" %>    
</html>