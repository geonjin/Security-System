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
	<title>photoClick</title> -->
	
	<jsp:include page="../header/head.jsp"></jsp:include>
	
	<style>
		#box1 {
            margin:0px 0px 0px 10px;
        }
        
        #pad2{
        	padding:30px 0px;
        }
	</style>
	
	<!-- <script type="text/javascript" src="/js/main/main.js"></script> -->
	
	
	<script type="text/javascript">
		window.onload = function(){
			
		}
		// 저장
		
		function cmgSave(){
			 var idx=${idx};
			 var cgpnNm = document.getElementById("cgpnNm").value;
			 var comingTm = document.getElementById("comingTm").value;
			 var goingTm = document.getElementById("goingTm").value;
			 var wrDtls = document.getElementById("wrDtls").value;
			 
			if($('#noticeSj').val() == ''){
				alert('검색어를 입력해 주세요.');
				return;
			}
			
			var url = "cmg/insertCmgRegstr.do";
			
			// var param = {};  => var param = new param()과 같음
			var param = {};
			
			param.cgpnNm = cgpnNm;
			param.comingTm = comingTm;
			param.goingTm = goingTm;
			param.wrDtls = wrDtls;
			param.idx=idx;
			$.ajax({
				url: url,
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: JSON.stringify(param),
			})
			.done(function(data) {
				
				console.log("data : ", data);
				if(data.result > 0){
					// 저장 성공
					alert('저장되었습니다.');
				} else{
					// 실패
					alert('저장 실패하였습니다.');
				}
				
			})
			.fail(function() {
				alert("AJAX Error! Please refresh the page!'");
			});	
		}
		
		function cmgCancel(){
			alert('취소!');
		}
		
	</script>
	
</head>
<body>

	<!-- <nav id="navbar-example2" class="navbar bg-light px-3 mb-3">
     <a class="navbar-brand" href="/home">홈</a>
     <ul class="nav nav-pills">
     
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
	  <div class="row">
	    <div class="col-sm-2" >
			<div class="card" style="width: 18rem;">
			   <img src="<spring:url value='/image/${mainResult.cgpnPhoto }'/>" class="card-img-top" alt="..." style="width: 18rem; height: 12rem; object-fit: contain;">
			</div>
		</div>
		<div class="col-sm-2"></div>     
	    	<div class="col-sm-8">
				  <label for="exampleFormControlInput1" class="form-label">성명</label>
				  <input style="width: 342.68px;" type="email" class="form-control" id="cgpnNm" placeholder="정확한 성명을 입력해주세요" value="${mainResult.cgpnNm }">
				<br>
				<div class="row">
				<div class="col-sm-5">
				  <label for="exampleFormControlInput1" class="form-label">들어온 시간</label>
				  <input type="datetime-local" class="form-control" id="comingTm" step="10" value="${mainResult.comingTm }">
				</div>
				<div class="col-sm-2" style="padding-top:1rem;"></div>
    			<div class="col-sm-5">
				  <label for="exampleFormControlInput1" class="form-label">나간 시간</label>
				  <input type="datetime-local" class="form-control" id="goingTm" step="10" value="${mainResult.goingTm }">
				</div>
				
	    		</div>
	    </div>
	    </div>
	  <br/>
	  <hr>
	  <br/>
	  <div class="row">
		<div class="mb-10" >
			  <label for="exampleFormControlTextarea1" class="form-label">작업 내역</label>
			  <textarea class="form-control" id="wrDtls" rows="10" placeholder="작업내역을 작성해주세요" style="width:930px; height:200px;" >${mainResult.wrDtls }</textarea>
		</div>
	  		 
		</div>	
		<br/>
		<hr>
		<span style="float:right">
			<a onclick="javascript:cmgSave();" style="cursor:pointer"><button type="button" onClick="location.href='/board'" id="box1" class="btn btn-primary btn-sm">저장</button></a>
		</span>
	  	<span style="float:right">
	  		<a onclick="javascript:history.go(-1);" style="cursor:pointer"><button type="button"  id="pull-rignt" class="btn btn-primary btn-sm" >취소</button></a>
	  	</span>
	</div>


</body>
</html>