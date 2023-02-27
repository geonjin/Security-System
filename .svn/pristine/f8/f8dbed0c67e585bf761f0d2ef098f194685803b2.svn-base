<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

	<!-- <meta charset="UTF-8">
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<title>관리자 게시판</title> -->
	
	<jsp:include page="../header/head.jsp"></jsp:include>
	
	<style>
		.nav-link:hover{
	    background: rgba(96,96,0,0.5);
	    color: white;
	    transition: all 0.5s;
		}
		
		th, td {
			vertical-align: middle;
			text-align: center;
			border: 1px solid;
		}
		#box1 {
			margin:0px 0px 0px 10px;
    }
	</style>

</head>
<body>
<div class="container-fluid">
	
	<!-- <nav id="navbar-example2" class="navbar bg-light mb-3" style="justify-content: unset; padding-left:0; padding-right:0;">
		<ul class="nav nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="/home" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">HOME</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/board" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">출입대장</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/chartboard" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">출입현황판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/mngrBbs" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">관리자 게시판</a>
			</li>
		</ul>
	</nav> -->
	
	<jsp:include page="../header/nav.jsp"></jsp:include>
	
	<div class="container">
		<hr>
		<div style="text-align: center"><h2>${mainResult.sj}</h2></div>
		<hr>
		<div class="row">
			<div class="col-sm-1">작성자</div>
			<div class="col-sm-1">${mainResult.register}</div>
			<div class="col-sm-8"></div>
			<div class="col-sm-1" style="text-align: center">작성일시</div>
			<div class="col-sm-1" style="text-align: right">${mainResult.registdt}</div>
		</div>
		<hr>
		<div style="height:500px;">${mainResult.cn}</div>
		<hr>
		<a onClick="location.href='/changeWrite?idx=${mainResult.idx}'" class="btn btn-primary">수정</a>
	</div>
</div>
</body>
</html>