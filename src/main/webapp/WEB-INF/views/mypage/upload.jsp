﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.bootstrap-tagsinput .tag {
	background-color: #9c27b0;
}

/* 마이페이지 상단 메뉴 위,아래 여백 */
.my-ul {
	padding-top: 30px;
	padding-bottom: 30px;
}
/*얼굴 영역 잡기 */
.face-rectangle {
	/* id:faceIt; */
	position: absolute;
	height: 100px;
	width: 100px;
	border-width: 3px;
	border-style: solid;
	border-color: #F2F2F2;
	background-color: transparent;
	/*  background-position: inherit; */
}

input[type=radio] {
	display: none;
}

input[type=radio]+label {
	display: inline-block;
	cursor: pointer;
	/* 	line-height: 22px; */
	padding-left: 22px;
	/* 	background: url('/picsion/assets/img/favicon.png') left/22px no-repeat; */
	border-width: 2px;
	border-style: solid;
	border-color: #BDBDBD;
}

input[type=radio]:checked+label {
	/* background-image: url('/picsion/assets/img/loading_bar2.gif'); */
	border-width: 2px;
	border-style: solid;
	border-color: #9c27b0;
}

.bootstrap-tagsinput .tag {
	border: 2px solid;
	background-color: #fff;
	color: #9c27b0;
}
</style>

<script type="text/javascript">
$(document).on("click", "#tagAdd", function() {
    if($('#tagAddName').val()==0){
        alert("태그를 입력해주세요.");
    }else{
        $('#picTags').append("<input type='text' value="+$('#tagAddName').val()+" name='tag' data-role='tagsinput'>");
        $("input[data-role=tagsinput]").tagsinput();
        $('#tagAddName').val("");
    }
    
});

function drawFace(imgId,rectX,rectY,rectWid,rectHei){
	var img,sagac;
	var wid,hei,scalWid,scalHei;
	img = document.getElementById(imgId);
	sagac = document.createElement("DIV");
	sagac.setAttribute("class","face-rectangle");
	
	img.parentElement.insertBefore(sagac,img);
/* 	sagac.style.backgroundImage = "url('"+img.src+"')"; */
	sagac.style.backgroundRepeat = "no-repeat";
	/* sagc.style.background-origin = "padding-box"; */
	sagac.style.width= rectWid + "px";
	sagac.style.height=rectHei + "px";
	
	sagac.style.backgroundSize = img.width + "px " + img.height + "px";
	showRect();
	function showRect(){
		var x,y;
		
		x = rectX; 
		y = rectY;
		x*=1;
		sagac.style.left = x+"px";
		sagac.style.top = y+"px";
	}
	
}
/* $("#preview").mouseover(function(){
	$("#preview").style("color","red");
	
	 $("#preview").css("class", "rainbow-color"); }) */
</script>

<div id="changemain"
	class="page-header header-filter clear-filter purple-filter"
	data-parallax="true">
	<div class="container"></div>
</div>
<div class="main">
	<div class="profile-content">
		<div class="container">
			<ul class="nav nav-pills justify-content-center my-ul">
				<li class="nav-item"><a class="nav-link active"
					href="<%=request.getContextPath()%>/upload.ps">업로드</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/bookmarklist.ps">즐겨찾기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/message/receivemessage.ps">메시지함</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/purchase/history.ps">거래 내역</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/operation/operequest.ps">요청/작업</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/updatebefore.ps">정보 수정</a></li>
			</ul>
			<h1></h1>
			<div class="row">
				<div class="col-md-6">
					<form id="fileForm" enctype="multipart/form-data" method="post">

						<div class="fileinput fileinput-new text-center"
							data-provides="fileinput">
							<div class="fileinput-new thumbnail">
								<img src="assets/img/up.png" alt="...">
							</div>
							<div class="fileinput-preview fileinput-exists thumbnail">

							</div>
							<div>
								<span class="btn btn-raised btn-round btn-default btn-file">
									<span class="fileinput-new" id="selectImage">Select	image</span> 
									<span class="fileinput-exists" id="changeImage">Change</span>
									<input type="file" name="filePath" accept=".jpg, .png, .bmp" />
								</span> 
								<a href="#Redirect" class="btn btn-default btn-round" id="removeBtn" onclick="fileCancle()"> Remove </a>
							</div>
							<div id="peopleRadio" class="form-group" style="display: none;">
								<br> 
								<label for="numberPeople">사람수</label> 
								<input type="radio" name="picPeople" id="zero" value="0">
								<label for="zero"> 0 
									<img src="/picsion/assets/img/userNo.png" width="30px" height="30px">
								</label> 
								<input type="radio" name="picPeople" id="one" value="1">
								<label for="one"> 1 
									<img src="/picsion/assets/img/user1.png" width="30px" height="30px">
								</label> 
								<input type="radio" name="picPeople" id="two" value="2">
								<label for="two"> 2 
									<img src="assets/img/user2.png" width="30px" height="30px">
								</label> 
								<input type="radio" name="picPeople" id="thr" value="3">
								<label for="thr"> 3~5 
									<img src="assets/img/user5.png" width="30px" height="30px">
								</label> 
								<input type="radio" name="picPeople" id="six" value="6">
								<label for="six"> 6+ 
									<img src="assets/img/user6.png" width="30px" height="30px">
								</label>
							</div>
							<div class="form-group" id="price" style="display: none;">
								<label for="price">희망 가격</label> 
								<input type="text" class="form-control" id="picPrice" name="picPrice" style="width: 90%">
							</div>
						</div>

					</form>
				</div>

				<div class="col-md-6">
					<form id="uploadForm" action="<%=request.getContextPath()%>/picture/uploadAfter.ps">

						<div class="form-group">
							<label for="title">제목</label> 
							<input type="text" class="form-control" id="pictureTitle" name="picTitle">
						</div>

						<div class="form-group">
							<label for="description">설명</label> 
							<input type="text" class="form-control" id="pictureDesc" name="picContent">
						</div>

						<!-- <form action=""> -->
						<div id="picTags" class="form-group">
							<label for="comment">Tags</label>
							<div id="loaderIcon"></div>
						</div>
						<div id="tagA"></div>
						<input type="hidden" id="subPrice" name="picPrice" value="" /> 

						<input type="button" id="uploadSubmit" class="btn btn-primary" value="저장하기"/>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var isUpload = false;
	function fileCancle(){
		if(isUpload){
			fileChange()
			$('#selectImage').show()
			$('#changeImage').hide()
			$('.fileinput-preview').empty().append('<img src="assets/img/up.png">')
		}
	}
	
	function fileChange(){
		$('#removeBtn,#peopleRadio,#selectImage,#price').hide()
		$('#tagA,#picTags').empty()
		$('#changeImage').show()
		$('.alert').remove()
		$('#picTags').append('<label for="comment">태그</label><div id="loaderIcon"></div>')
	}
	
	$(function() {
		var priceCheck=0;
		$('#picPrice').focusout(function(){
			$('#subPrice').val($(this).val());
			priceCheck=$('#subPrice').val();
			console.log(priceCheck);
		});
		$("input:radio[name='picPeople']").click(function(){
			$('#picPeople').val($(this).val());
		});
		$('#removeBtn').hide()
		

		$('#uploadSubmit').click(function(){
			priceCheck = $('#subPrice').val();
			if(priceCheck<1000 || isNaN(priceCheck)){
				alert("사진의 가격을 다시 측정해주세요.가격 기준 :사진 당 1000원 이상 ");
				$('#picPrice').focus();
				return;
			}else{
				console.log("왔다");
				$('#uploadForm').submit();
			}
		})
		
		$('input[type=file]').change(function() {
			isUpload = false;
			if($('input[type=file]').val().trim()==""){
				$('form').reset()
				return false
			}
			fileChange()
			$('#removeBtn').show(function(){
				if(isUpload == false){
					return;
				}
			})

			var formData = new FormData($('#fileForm')[0])
			$("fileinput-preview fileinput-exists thumbnail img-raised:first").attr({
				id:"preview"
			})
			$.ajax({
				url : "/picsion/vision.ps",
				data : formData,
				processData: false,
				contentType: false,
				type :'POST',
				success : function(data){
					isUpload = true;
					console.log(data)
					$("#loaderIcon").empty();
					if(data.logo != null){
					var logo =''
						logo += '<div class="alert alert-info">'
						logo += 	'<div class="container-fluid">'
						logo += 		'<div class="alert-icon">'
						logo += 			'<i class="material-icons">warning</i>'
						logo += 		'</div>'
						logo += 		'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'
						logo += 			'<span aria-hidden="true"><i class="material-icons">clear</i></span>'
						logo += 		'</button>'
						logo += 		'<b>Warning Alert</b> ' + data.logo
						logo += 	'</div>'
						logo += '</div>'
						
						$('h1').after(logo)
						
					}
					/*사람수 측정*/
					$('#peopleRadio').show();
					var peopleNum = data.face.length;
					console.log(peopleNum);
					if(peopleNum==0){
						$('#zero').attr('checked',true);
					}else if(peopleNum==1){
						$('#one').attr('checked',true);
					}else if(peopleNum==2){
						$('#two').attr('checked',true);
					}else if(peopleNum>=3&&peopleNum<=5){
						$('#thr').attr('checked',true);
					}else{
						$('#six').attr('checked',true);
					}
 					/*얼굴감지*/
 					$(".fileinput-preview").children().attr({id:"preview"});
 					console.log($(".fileinput-preview").children());
					console.log($("#preview")["0"].naturalHeight);
					console.log($("#preview")["0"].height);
					console.log($("#preview")["0"].naturalWidth);
					console.log($("#preview")["0"].width);
					var chaHei = $("#preview")["0"].height;
					var natHei = $("#preview")["0"].naturalHeight;
					var chaWid = $("#preview")["0"].width;
					var natWid = $("#preview")["0"].naturalWidth;
					var moveLeft = $("#preview")["0"].offsetLeft;
					chaHei *= 1;
					natHei *= 1;
					chaWid *= 1;
					natWid *= 1;					
					var scalH = (chaHei/natHei).toFixed(3);
					var scalW = (chaWid/natWid).toFixed(3);
					console.log(scalH);
					console.log(scalW);
					
 					 if(data.face != 0){
						
 						var modelUse =''
 						modelUse += '<div class="alert alert-info">'
 						modelUse += 	'<div class="container-fluid">'
 						modelUse += 		'<div class="alert-icon">'
 						modelUse += 			'<i class="material-icons">warning</i>'
 						modelUse += 		'</div>'
 						modelUse += 		'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'
 						modelUse += 			'<span aria-hidden="true"><i class="material-icons">clear</i></span>'
 						modelUse += 		'</button>'
 						modelUse += 		'<b>Warning Alert</b>' + ' 사진 속에 사람이 감지되었습니다. 모델 사용권을 확인해주세요.'
 						modelUse += 	'</div>'
 						modelUse += '</div>'
 						$('h1').after(modelUse)
 						console.log("얼굴그리기")
 						$(".fileinput-preview").attr({
 							position:"relative"
 						})
 						
 						/* drawFace("preview",scalW*data.face["0"].x_0,scalH*data.face["0"].y_1,scalW*data.face["0"].width,
 								scalH*data.face["0"].height); */
 						$.each(data.face,function(i,val){
 							console.log(val.x_0,val.y_1,val.width,
 									val.height);
 							drawFace("preview",Math.ceil(scalW*val.x_0)+moveLeft,scalH*val.y_1,scalW*val.width,
 	 								scalH*val.height);
 							console.log(Math.ceil(scalW*val.x_0)+moveLeft,scalH*val.y_1,scalW*val.width,
 	 								scalH*val.height);
 						})
 						
  						
 					} 
					
					if(data.safe != null){
						var safe = ''
						safe += '<div class="alert alert-danger">'
						safe += 	'<div class="container-fluid">'
						safe += 		'<div class="alert-icon">'
						safe += 			'<i class="material-icons">warning</i>'
						safe += 		'</div>'
						safe += 		'<button type="button" class="close" data-dismiss="alert" aria-label="Close">'
						safe += 			'<span aria-hidden="true"><i class="material-icons">clear</i></span>'
						safe += 		'</button>'
						safe += 		'<b>Warning Alert</b> ' + data.safe
						safe += 	'</div>'
						safe += '</div>'
						$('h1').after(safe)
					}
					
					var tags = ''
					$.each(data.label, function(i, elt) {
						tags += '<input type="text" value="' + elt + '" data-role="tagsinput" name="tag">'
					})
					$.each(data.label2,function(i,elt){
						tags += '<input type="text" value="' + elt + '" data-role="tagsinput" name="tag">'
					})
					
					$('#picTags').append(tags)
					
					var cameraName = data.metaMap.cameraName=='undefined'? 'null' : data.metaMap.cameraName;
					var resolH = data.metaMap.resolH=='undefined'? 'null' : data.metaMap.resolH;
					var resolW = data.metaMap.resolW=='undefined'? 'null' : data.metaMap.resolW;
					var pictureDate = data.metaMap.pictureDate=='undefined'? 'null' : data.metaMap.pictureDate;
					var lensName = data.metaMap.lensName=='undefined'? 'null' : data.metaMap.lensName;
					
					tags ='<br><div class="form-group"><label for="title">태그추가</label><div class="row"><div class="col-md-6"><input type="text" class="form-control" id="tagAddName"></div>';
					tags +='<div class="col-md-6"><button type="button" class="btn btn-primary" id="tagAdd">추가</button></div></div><br>';
					tags += '<input type="hidden" name="picPath" value="' + data.picPath + '">';
					tags += '<input type="hidden" name="camera" id="camera" value="'+cameraName+'"/>';
					tags += '<input type="hidden" name="resolutionH" id="resolutionH" value="'+resolH+'"/>';
					tags += '<input type="hidden" name="resolutionW" id="resolutionW" value="'+resolW+'"/>';
					tags += '<input type="hidden" name="photoDate" id="photoDate" value="'+Date(pictureDate)+'"/>';
					tags += '<input type="hidden" name="lens" id="lens" value="'+lensName+'"/>';
					tags += '<input type="hidden" name="picPeople" id="picPeople" value="'+peopleNum+'"/>';

					$('#tagA').append(tags)
					$("input[data-role=tagsinput]").tagsinput();
					
					/*색깔*/
					var color =''
					$.each(data.color,function(i,elt){
						
					 	color += '<input type="hidden" name="colorList['+i+'].colorR" id="colorList['+i+'].colorR" value="'+elt.red+'"/>';
						color += '<input type="hidden" name="colorList['+i+'].colorG" id="colorList['+i+'].colorG" value="'+elt.green+'"/>';
						color += '<input type="hidden" name="colorList['+i+'].colorB" id="colorList['+i+'].colorB" value="'+elt.blue+'"/>';
						
					}) 
					$('#tagA').append(color);
					$('#price').show();
				},beforeSend:function(){
					$("#loaderIcon").html("<img height='250px' src='<%=request.getContextPath()%>/assets/img/eyeMove.gif'/>"); }
			})
		})
	})

	$(document).ready(function() {

		$(document).on('mouseover', '.face-rectangle', function() {
			$(this).css("border-color", "#9c27b0");
		});
		$(document).on('mouseout', '.face-rectangle', function() {
			$(this).css("border-color", "#F2F2F2");
		});

		/* $(".face-rectangle").mouseover(function(){
			consol.log("띠띠");
			$(".face-rectangle").style("border-color","red");
		
		/* $("#preview").css("class", "rainbow-color"); 
		}); */
	});
</script>