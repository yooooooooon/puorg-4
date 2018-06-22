<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script>
  $( function() {
	  $('.datetimepicker').datetimepicker({
		    icons: {
		        time: "fa fa-clock-o",
		        date: "fa fa-calendar",
		        up: "fa fa-chevron-up",
		        down: "fa fa-chevron-down",
		        previous: 'fa fa-chevron-left',
		        next: 'fa fa-chevron-right',
		        today: 'fa fa-screenshot',
		        clear: 'fa fa-trash',
		        close: 'fa fa-remove'
		    }
		});
	  
	  $('#purchaseSearch').click(function(){
		  var datePicker = $('#datePicker')[0].value
		console.log(datePicker)
		$.ajax({
			url:"/picsion/purchase/adminPurchaseSearch.ps",
			data:{date:datePicker},
			success: function (data) {
				console.log(data)
				var table = ''
				$.each(data.purchaseList, function(i,elt){
				console.log(elt)
				
				table += '<tr>'
				table += '<td>' + elt.picNo + '</td>'
				table += '<td>' + elt.purchaseUserNo + '</td>'
				table += '<td>' + elt.saleUserNo + '</td>'
				table += '<td>' + moment(elt.purchaseReg).format('YYYY-MM-DD, H:mm:ss') + '</td>'
				table += '</tr>'
				})
				
				$('#tableBody').empty()
				$('#tableBody').append(table) 
				
			}
		})
		
	  })
	  
  })
</script>

<div class="page-header header-filter clear-filter purple-filter"
	data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/bg2.jpg'); transform: translate3d(0px, 0px, 0px);">
	<div class="container"></div>
</div>
<div class="main main-raised">
	<div class="section section-basic">
		<div class="container">
		
		<ul class="nav nav-pills nav-pills-rose">
		  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/admin.ps">회원 관리</a></li>
		  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/blame/adminComplainList.ps">신고글 관리</a></li>
		  <li class="nav-item"><a class="nav-link active" href="<%=request.getContextPath()%>/purchase/adminPurchase.ps">매출 내역</a></li>
		  <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/user/adminPurchase.ps">통계</a></li>
		</ul>
		
		
			<h1>전체 매출 내역</h1>
			<div class="form-group">
			    <label class="label-control">날짜 선택</label>
			    <input id="datePicker" type="text" class="form-control datetimepicker"/>
			    <button id="purchaseSearch">검색</button><button id="allUser">전체 조회</button>
			</div>
			<table border="3">
				<thead>
					<tr>
						<th>사진 번호</th>
						<th>구매 유저 번호</th>
						<th>판매 유저 번호</th>
						<th>구매 날짜</th>
					</tr>
				</thead>

				<tbody id="tableBody">
					<c:forEach var="admin" items="${purchaseList}">

						<tr>
							<td>${admin.picNo}</td>
							<td>${admin.purchaseUserNo}</td>
							<td>${admin.saleUserNo}</td>
							<td><fmt:formatDate pattern = "yyyy-MM-dd, HH:mm:ss" value = "${admin.purchaseReg}" /></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>