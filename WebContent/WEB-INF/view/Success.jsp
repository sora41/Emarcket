<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>
	<h2>INSERTION EN BASE REUSSI</h2>
	<a href="<c:url value="index.jsp"/>">index</a>
	<br />
	<c:choose>
		<c:when test="${empty products}">
			Aucun reference contenu dans le catalogue
		</c:when>
		<c:otherwise>
			<c:forEach var="product" items="${products}">
				<c:out value="${product.id}"></c:out>
				<c:out value="${product.name}"></c:out>
				<c:out value="${product.sellingPrice}"></c:out>
				<br />
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<%@ include file="/WEB-INF/view/Footer.jsp"%>
</html>