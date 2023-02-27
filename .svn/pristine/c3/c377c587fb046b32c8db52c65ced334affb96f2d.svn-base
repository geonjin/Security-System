<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- <meta charset="UTF-8">
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<title>write</title> -->

<jsp:include page="../header/head.jsp"></jsp:include>

<style>
body {
	padding-bottom: 30px;
}

#box1 {
	margin: 0px 0px 0px 20px;
}
</style>

<script type="text/javascript">
	window.onload = function() {

	}

	function noticeSave() {

		var sj = document.getElementById("sj").value;
		var register = document.getElementById("register").value;
		var cn = document.getElementById("cn").value;
		var fixingAt = document.getElementById("fixingAt").checked;

		var url = "notice/insertNoticeInfo.do";

		var param = {};

		param.sj = sj;
		param.register = register;
		param.cn = cn;
		param.fixingAt = fixingAt;

		$.ajax({
			url : url,
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : JSON.stringify(param),
		}).done(function(data) {

			console.log("data : ", data);
			if (data.result > 0) {
				// 저장 성공
				alert('저장되었습니다.');
			} else {
				// 실패
				alert('저장 실패하였습니다.');
			}

		}).fail(
				function() {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				});
	}
	function cmgCancel() {
		alert('취소!');
	}
</script>
</head>
<body>



	<jsp:include page="../header/nav.jsp"></jsp:include>

	<article>

		<div class="container" role="main">

			<h2>글쓰기</h2>

			<form name="form" id="form" role="form" method="post"
				action="${pageContext.request.contextPath}/board/saveBoard">

				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="sj"
						placeholder="제목을 입력해 주세요." value="${mainResult.sj}">
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label> <input type="text"
						class="form-control" name="reg_id" id="register"
						placeholder="이름을 입력해 주세요." value="${mainResult.register}">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="cn"
						placeholder="내용을 입력해 주세요.">${mainResult.cn}</textarea>
				</div>
				<div id="box1">
					<input class="form-check-input" type="checkbox"
						id="fixingAt" value="" aria-label="..."> <label
						for="tag">공지사항 여부</label>
				</div>
			</form>

			<div style="float:right;">
				
				<a onclick="javascript:history.go(-1);" style="cursor: pointer"><button
						type="button" class="btn btn-sm btn-primary" id="btnList">취소</button></a>
						<a onclick="javascript:noticeSave();" style="cursor: pointer" href="mngrBbs"><button
						type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="location.reload">저장</button></a>
			</div>
		</div>
	</article>

</body>
</html>