<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>


<head>
	
	<style>
		.nav-link:hover{
	    background: rgba(96,96,0,0.5);
	    color: white;
	    transition: all 0.5s;
		}
		
		#inoutTable > thead > tr > th {
			vertical-align: middle;
			text-align: center;
		}
		
		#inoutTable > tbody > tr > th,td {
			vertical-align: middle;
			text-align: center;	
		}
		
		.td-center {
			padding-top:50px;
		}
	</style>

	<jsp:include page="../header/head.jsp"></jsp:include>
	
		
	
</head>

	
<body>
	
	<jsp:include page="../header/nav.jsp"></jsp:include>
	
	<div> <h1 center>잘못된 요청입니다</h1> </div>
		
	<div class="container">
	<p>
	<a href="<c:url value="/home"/>" class="btn" style="background-color : yellow";>초기화면으로 이동 &raquo;</a>
	</p>
	</div>
</body>
</html>