$(document).ready(function() {
	
	$("#noticeSj").keyup(function(e){
		if(e.keyCode == "13"){
			$("#btnSearch").trigger("click");
		}
	});
	
	$("#btnSearch").click(function(e){
		
		if($('#noticeSj').val() == ''){
			alert('검색어를 입력해 주세요.');
			return;
		}
		
		var url = "main/getMainInfos.do";
		
		// var param = {};
		var param = new Object();
		
		param.noticeSj = $("#noticeSj").val();
		
		$.ajax({
			url: url,
			type: 'POST',
			contentType: 'application/json',
			dataType: 'json',
			data: JSON.stringify(param),
		})
		.done(function(result) {
			console.log("result : ", result);
			if(result){
				
				$('#listbody').empty();
				
				if(result.mainResult.length == 0){
					var th = $('<th colspan="2">').text('검색결과가 없습니다.');
					
					$('#listbody').append( $('<tr>').append(th) );
				} else{
					$.each(result.mainResult, function(idx, item){
						var tr = $('<tr>');
						
						var td1= $('<td>').text(item.noticeId);
						var td2= $('<td>').text(item.noticeSj);
						
						tr.append(td1).append(td2);
						
						$('#listbody').append(tr);
					});
				}
			}
			
		})
		.fail(function() {
			alert("AJAX Error! Please refresh the page!'");
		});	
	});
	
});
