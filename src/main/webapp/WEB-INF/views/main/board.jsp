<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<!-- <head>
	<meta charset="UTF-8">
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<title>관리자 게시판</title>


</head> -->


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
	
		<script type="text/javascript">
		window.onload = function(){
			var mainResult = '${mainResult}';
			console.log("mainResult :::: ", mainResult);
		}
	</script>
	
</head>

	
<body>
	
	<jsp:include page="../header/nav.jsp"></jsp:include>
	
	<div class="container">
<%-- 		<a onclick="location.href='/photoClick?idx=${item.idx}'" class="btn btn-primary" style="float:right; margin-bottom:1rem;">글쓰기</a> --%>
				<table class="table table-hover" id="inoutTable">
				  <thead>
				    <tr>
				      <th class="col-sm-1" scope="col">번호</th>
				      <th class="col-sm-1" scope="col">출입자 사진</th>
				      <th class="col-sm-3" scope="col">들어온 시간</th>
				      <th class="col-sm-2" scope="col"></th>  
				      <th class="col-sm-3" scope="col">나간 시간</th>
				      <th class="col-sm-2" scope="col">출입자 명</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				  
				    
				    <c:if test="${mainResult ne null}">
				    
					 <c:forEach items="${mainResult}" var="item" varStatus="status">
                       <tr style="cursor: pointer;" onclick="location.href='/photoClick?idx=${item.idx}'"> <!-- 출입현황판에서  컨트롤러로 인덱스 번호를 보내 주어서 사진 클릭시 정보가 나오게 함.  -->
                        <th scope="row">${status.count}</th>
                        <td><img src="<spring:url value='/image/${item.cgpnPhoto }'/>" style="width: 7rem; height: 7rem; object-fit: contain;"></td>
                        <td style="padding-top: 50px;">${item.comingTm}</td>
                        <td style="padding-top: 50px;">~</td>
                        <td style="padding-top: 50px;">${item.goingTm}</td>
                        <td style="padding-top: 50px;">${item.cgpnNm}</td>
                        
                      </tr>
                  </c:forEach>
				</c:if>
				
				<c:if test="${mainResult eq null}">
					<tr><td colspan="5">데이터가 없습니다.</td></tr>
				</c:if>
				  </tbody>
				</table>
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