<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/WEB-INF/view/Header.jsp"%>


<div class="container">

	<div class="starter-template">
		<h1>Bootstrap starter template</h1>
		<p class="lead">
			Use this document as a way to quickly start any new project.<br>
			All you get is this text and a mostly barebones HTML document.
		</p>
		<h2>bienvenue !!!</h2>
		<c:out value="${user.login}"></c:out>
		<c:out value="${user.role}"></c:out>
		<br />
	</div>

</div>
<!-- /.container -->

<%@ include file="/WEB-INF/view/Footer.jsp"%>
</html>