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
	
	<script type="text/javascript">
		window.onload = function(){
			var mainResult = '${mainResult}';
			console.log("mainResult :::: ", mainResult);
		}
		
	</script>
	
</head>

<body>

	
<!-- 	<nav id="navbar-example2" class="navbar bg-light px-3 mb-3">
     <a class="navbar-brand" href="/home">홈</a>
     <ul class="nav nav-pills" ">
     
     <li class="nav-item">
         <a class="nav-link" href="/photoClick">정보입력</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" href="/board">게시판</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" href="/chartboard">출입현황판</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" href="/mngrBbs">관리자 게시판</a>
       </li>
        <li class="nav-item">
         <a class="nav-link" href="/cmgStatus">출입 현황판</a>
       </li>
     </ul>
   </nav> -->
   
   <jsp:include page="../header/nav.jsp"></jsp:include>
   
   <div class="container">
   	<div style="width : 1100px; margin:0 auto">
   	<span style="float:right">
	  		<button type="button" onclick="location.href='/write' "  id="pull-rignt" class="btn btn-primary btn-sm" >글쓰기</button>
	 </span>
   </div>
   
	  <div class="col-sm-1" style="width:5.3333333%"></div>
	  <div class="col-sm-5" style="width:44.6666667%">
			<table class="table table-hover" style="height:18 rem; width:980px; height:500px;">
			  <thead>
			    <tr>
			      <th class="col-sm-1" scope="col" style="padding-top:0; text-align: center;">번호</th>
			      <th class="col-sm-6" scope="col" style="padding-top:0; text-align: left;">제목</th>
			      <th class="col-sm-2" scope="col" style="padding-top:0; text-align: center;">작성일시</th>
			      <th class="col-sm-2" scope="col" style="padding-top:0; text-align: center;">작성자</th>

			  </thead>
			  <tbody class="table-group-divider">
			  	
			  	
				<c:if test="${mainResult ne null}">
					<c:forEach items="${mainResult}" var="item" varStatus="status">
						<c:if test="${item.fixingAt == 'T'}">
					  		<tr onclick="location.href='/boardRead?idx=${item.idx}'" style="background-color:rgba(193, 55, 19, 0.08);cursor: pointer;">   <!--  <tr onclick="location.href='/boardRead'"> -->
						      <th scope="row" style="text-align: center; vertical-align:middle;" >공지</th>
						      <td style="text-align: left; vertical-align:middle;">${item.sj}</td>
						      <td style="text-align: center; vertical-align:middle;">${item.updtDt}</td>
						      <td style="text-align: center; vertical-align:middle;">${item.register}</td>
						    </tr>
						    </c:if>
					</c:forEach>
					<%int count = 1;%>
					<c:forEach items="${mainResult}" var="item" varStatus="status">
					<c:if test="${item.fixingAt == 'F'}">
			  		<tr style="cursor: pointer;" onclick="location.href='/boardRead?idx=${item.idx}'">   <!--  <tr onclick="location.href='/boardRead'"> -->
				      <th scope="row" style="text-align: center; vertical-align:middle;" ><%=count++%></th>
				      <td style="text-align: left; vertical-align:middle">${item.sj}</td>
				      <td style="text-align: center; vertical-align:middle;">${item.updtDt}</td>
				      <td style="text-align: center; vertical-align:middle;">${item.register}</td>
				    </tr>
				    </c:if>
				    </c:forEach>
				</c:if>
				
				
			    <!-- 
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row" style="text-align: center;">1</th>
			      <td style="text-align: left;">공지 사항 게시판입니다.</td>
			      <td style="text-align: center;">2023-02-18</td>
			      <td style="text-align: center;">신우성</td>
			      <td></td>
			    </tr> -->
			  </tbody>
			</table>
	  </div>
	</div>
	<hr>
	<div>
		<ul class="pagination justify-content-center">
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> <</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> 1</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> 2</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> 3</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> 4</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> 5</a></li>
			<li><a href="#" style="margin-right:5px;" class="text-secondary"> ></a></li>
		</ul>
	</div>
</div>
</body>
</html>