<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 	<meta charset="UTF-8"> -->
<!-- 	<link href="/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->

<!-- <title>cmgStatus</title> -->

<jsp:include page="../header/head.jsp"></jsp:include>

<style>
	.wrap { 
    	margin:auto; 
        text-align:center;}
        
	.box { 
    	vertical-align:middle; 
        display:inline-block;}
        
	.box .in { 
    	width:50px; 
        height:30px; 
        background-color:#FFF;}
</style>

</head>

<body>

<!-- 	<nav id="navbar-example2" class="navbar bg-light px-3 mb-3"> -->
<!--      <a class="navbar-brand" href="/home">홈</a> -->
<!--      <ul class="nav nav-pills"> -->
     
<!--      <li class="nav-item"> -->
<!--          <a class="nav-link" href="/photoClick">정보입력</a> -->
<!--        </li> -->
<!--        <li class="nav-item"> -->
<!--          <a class="nav-link" href="/board">게시판</a> -->
<!--        </li> -->
<!--        <li class="nav-item"> -->
<!--          <a class="nav-link" href="/chartboard">출입현황판</a> -->
<!--        </li> -->
<!--        <li class="nav-item"> -->
<!--          <a class="nav-link" href="/mngrBbs">관리자 게시판</a> -->
<!--        </li> -->
<!--         <li class="nav-item"> -->
<!--          <a class="nav-link" href="/cmgStatus">출입 현황판</a> -->
<!--        </li> -->
<!--      </ul> -->
<!--    </nav> -->
   
   	<jsp:include page="../header/nav.jsp"></jsp:include>
   	<div class="container">
	   <div style = "float : left;width:30%; padding:15px;"><h3>금년 출입 현황</h3></div>
	   
	   <div class="wrap">
	   <div class="box">
	  		<canvas id="myChart" width="800" height="300"></canvas>
		</div>
		</div>
		
	   <hr>
	   <br>
		<div style = "float : left;width:30%; padding:15px;"><h3>당일 출입 현황</h3></div>
	  <div class="wrap">
	   <div class="box">
	  		<canvas id="horizontal" width="800" height="150"></canvas>
		</div>
	</div>

	<script>
		window.onload = function() {
			const labels = ['1월','2월 ','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',];
			const data = {
			  labels: labels,
			  datasets: [{
			    label: '금년 출입 현황',
			    backgroundColor: 'rgb(54, 162, 235)',
			    borderColor: 'rgb(255, 99, 132)',
			    data: ${month}
			  }]
			};
			
			var config = {
			  type: "bar",
			  data: data,
			  options: {
			         responsive: false,
					 plugins:{
						 legend:{
							 display: true,
							 position: 'right'
						 }
					 },
			       
			      }
			};
			
			
			  const myChart = new Chart(
			    document.getElementById('myChart'),
			    config
			  );
			  
			  
			// 날짜 시간 받아오는 것
			var today = new Date();
			var month = ('0'+(today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = month+ '-' +day;
			
			const label2 = [dateString];
			const data2 = {
			  labels: label2,
			  datasets: [{
			    label: '일일 출입 현황',
			    backgroundColor: 'rgb(0, 174, 152)',
			    borderColor: 'rgb(255, 255, 255)',
			    data: [${today}],
			  }]
			};
			
		
			var config2 = {
					  type: 'bar',
					  data: data2,
					  options: {
					         responsive: false,
							 plugins:{
								 legend:{
									 display: true,
									 position: 'right'
								 }
							 },
							 indexAxis:'y',
					        
					      }
					};


			
			  const horizontal = new Chart(
			    document.getElementById('horizontal'),
			    config2
			  );
			
		}
		
	</script>
	</div>

</body>
</html>