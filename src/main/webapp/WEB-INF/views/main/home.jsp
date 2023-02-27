<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>

	<jsp:include page="../header/head.jsp"></jsp:include>

</head>

<body>


<script>
	window.onload = function() {
		// 	alert()
		const labels = [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ];
		
		const data = {
			labels : labels,
			datasets : [ {
				label : '2023년',
				backgroundColor : 'rgb(54, 162, 235)',
				borderColor : 'rgb(255, 99, 132)',
				data : ${month},
			}]
		};

		const config = {
			type : 'bar',
			data : data,
			options : {
				responsive : false,
				plugins: {
					legend: {
							display: true,
							position : 'right'
					},
				},
				responsive : false,
				},
			}
		
		
/* 		const actions = [
			  {
			    name: 'Position: right',
			    handler(myChart) {
			      chart.options.plugins.legend.position = 'right';
			      chart.update();
			    }
			  }
			];
		 */
		const myChart = new Chart(document.getElementById('myChart'), config);
	 };
	
	
</script>


	
<!-- 	<nav id="navbar-example2" class="navbar bg-light mb-3" style="justify-content: unset; padding-left:0; padding-right:0;"> -->
<!-- 		<ul class="nav nav-pills"> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" href="/home" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">HOME</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" href="/board" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">출입대장</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" href="/chartboard" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">출입현황판</a> -->
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<!-- 				<a class="nav-link" href="/mngrBbs" style="color: black; font-size: var(--bs-navbar-brand-font-size); padding-left:0.5rem; padding-right:0.5rem;">관리자 게시판</a> -->
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->
	
	<jsp:include page="../header/nav.jsp"></jsp:include>
	
	
	<div class="container" >
		<div class="row" style="padding-left:0.5rem; padding-right:0.5rem;">
			<div class="col-sm-6"><h5>최근 출입자</h5></div>
			<div class="col-sm-1" style="width:5.3333333%"></div>
			<div class="col-sm-4"><h5 style="padding-left:0.5rem;">공지사항</h5></div>
			<div class="col-sm-1"><a href="/mngrBbs" style="color: black; text-decoration: none; float:right; display:block">+</a></div>
		</div>
		<div class="row" style="padding-left:0.5rem;">
			 <c:if test="${limitCmg ne null}">
               <c:forEach items="${limitCmg}" var="item" varStatus="status">
                 <div class="col-sm-2" style="margin:0 0 0 0px;">
                  <div class="card" style="width: 18rem auto;">
                    <a href="photoClick?idx=${item.idx}"><img src="<spring:url value='/image/${item.cgpnPhoto}'/>" class="card-img-top" alt="" style="width: 18rem auto; height: 19rem ; display:block ;object-fit: contain;"></a>
                    <div class="card-body" style="width: 18rem auto;">
                      <c:if test="${item.cgpnNm ne null}">
                      	<h5 class="card-title" style="text-align: center; vertical-align:middle"><a href="photoClick?idx=${item.idx}">${item.cgpnNm}</a></h5>
                      </c:if>
                      <c:if test="${item.cgpnNm eq null}">
                      	<h5 class="card-title" style="text-align: center; vertical-align:middle"><a href="photoClick?idx=${item.idx}">알 수 없음</a></h5>
                      </c:if>
                    </div>
                  </div>
               </div>  
               </c:forEach>
            </c:if> 
		  <div class="col-sm-1" style="width:5.3333333%"></div>
		  <div class="col-sm-5" style="width:44.6666667%; height:18 rem; layout:fixed">
				<table class="table table-hover" style="height:16rem; height:18rem; id="table">
				  <thead>
				    <tr>
				      <th class="col-sm-1" id="no" scope="col">번호</th>
				      <th class="col-sm-6" id="title" scope="col">제목</th>
				      <th class="col-sm-2" id="date" scope="col" style="padding-top:0; text-align: center;">작성일시</th>
				      <th class="col-sm-2" id="name" scope="col" style="padding-top:0; text-align: center;">작성자</th>
				  </thead>
				  <tbody class="table-group-divider">
					<c:forEach items="${limitNot}" var="item" varStatus="status">
						<!-- param 형식으로 idx 값을 백에 넘겨줌 -->
				  		<tr style="cursor: pointer;" onclick="location.href='/boardRead?idx=${item.idx}'">
					      <th scope="row" style="text-align: center;vertical-align:middle;">${status.count}</th>
					      <td style="vertical-align:middle;">${item.sj}</td>
					      <td style="vertical-align:middle; text-align: center">${item.updtDt}</td>
					      <td style="text-align: center; vertical-align:middle;">${item.register}</td>
					    </tr>
					</c:forEach>
				  </tbody>
				</table>
		  </div>
		</div>
		<br>
		<div class="row" style="padding-left:0.5rem; padding-right:0.5rem;">
			<div class="col-sm-2" style="margin-top:0.5rem;"><h5>월별 출입 현황</h5></div>
			<div class="col-sm-10" style="margin-top:0.5rem;">
				<div class="chart-wrap">
	  				<canvas id="myChart" width="1060vw" height="450vh"></canvas>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>