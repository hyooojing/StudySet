<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css" media="screen">
#our_table {
	
}

th {
	width: 140px;
	background-color: #ccc;
}

#our_table td {
	width: 140px;
	height: 20px;
	text-align: center;
	vertical-align: middle;
}

table td.highlighted {
	background-color: rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body leftmargin="0" bgcolor="#DFE5DD">
	<br>
	<table style="width: 100%; height: 100%;  border-collapse: collapse">
		<tr>
			<td style="vertical-align: top; text-align: left; width: 130px;">
				<!-- 왼쪽 사이드(로고, 메뉴) 구성 -->
				<table>
					<tr>
						<td><img src="<c:url value='/images/studysetlogo.png'/>"
							width="130px" /><br> <br></td>
					</tr>
					<tr>
						<td><jsp:include page="../menu.jsp" flush="false" /></td>
					</tr>
				</table>
			</td>
			<td style="vertical-align: top">
				<table style="width: 100%; height: 100%; padding: 60px;">
					<!-- 이 테이블 안에 메인 화면 구성하면 될듯 -->
					<tr>
						<td colspan="2">
							<h1>${studyGroup.groupName}</h1>
							<h2 style="color: gray">일정</h2>
						</td>
					</tr>
					<tr><td><h2>※안 되는 시간에 색칠해주세요</h2></td>
					<td><form><button>제출하기</button></form></td></tr>
					<tr>
						<td colspan="2">
							<table border="1" style="border-collapse: collapse"
								cellpadding="0" cellspacing="1" id="our_table">
								<tr>
									<th>시간(시)</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th>토</th>
									<th>일</th>
								</tr>
								<c:forEach var="i" begin="1" end="24">
									<tr>
										<th>${i}-${i+1}</th>
										<c:forEach var="i" begin="1" end="7">
											<td id="td${i}"></td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" charset="utf-8">
		$(function() {
			var isMouseDown = false;
			$("#our_table td").mousedown(function() {
				isMouseDown = true;
				$(this).toggleClass("highlighted");
				return false; // prevent text selection
			}).mouseover(function() {
				if (isMouseDown) {
					$(this).toggleClass("highlighted");
				}
			}).bind("selectstart", function() {
				return false; // prevent text selection in IE
			});

			$(document).mouseup(function() {
				isMouseDown = false;
			});
		});
	</script>
</body>
</html>