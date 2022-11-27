<%@page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel=stylesheet href="<c:url value='/css/group.css' />"
	type="text/css">
<link rel=stylesheet href="<c:url value='/css/modal.css' />" type="text/css">
<title>StudySet: ${studyGroup.groupName}</title>
<script>
    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};
</script>
</head>
<body leftmargin="0" bgcolor="#DFE5DD">
	<br>
	<table style="width: 100%; border-collapse: collapse">
		<tr>
			<td style="vertical-align: top; text-align: left; width: 130px;">
				<!-- 왼쪽 사이드(로고, 메뉴) 구성 -->
				<table>
					<tr>
						<td><img src="<c:url value='/images/studysetlogo.png'/>"
							width="130px" /><br> <br></td>
					</tr>
					<tr>
						<td><jsp:include page="menu.jsp" flush="false" /></td>
					</tr>
				</table>
			</td>
			<td style="vertical-align: top">
				<table style="width: 100%; padding: 20px;">
					<!-- 이 테이블 안에 메인 화면 구성하면 될듯 -->
					<tr>
						<td colspan="2">
							<h2>&nbsp;&nbsp;${studyGroup.groupName}</h2>
							<h4 style="color: gray">
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${studyGroup.groupCategory eq 1}">프로그래밍</c:when>
									<c:when test="${studyGroup.groupCategory eq 2}">외국어</c:when>
									<c:when test="${studyGroup.groupCategory eq 3}">디자인</c:when>
									<c:when test="${studyGroup.groupCategory eq 4}">음악</c:when>
									<c:when test="${studyGroup.groupCategory eq 5}">경영</c:when>
									<c:when test="${studyGroup.groupCategory eq 5}">기타</c:when>
								</c:choose>
							</h4>
						</td>
					</tr>
					<tr>
						<td><h4>${studyGroup.groupDescription}</h4></td>
						<td align="center"><input id="modal_btn" type="button"
							value="그룹원 검색" /><br></td>
					</tr>
					<tr>
						<td><input type="button" value="가입 코드 보기"
							onClick="alert('${studyGroup.code}')" /><br></td>
					</tr>
					<tr>
						<td width="50%">
							<table class="tb">
								<tr>
									<td style="vertical-align: top;"><h3>&nbsp;&nbsp;주요
											전달 사항</h3></td>
									<td style="vertical-align: top;"></td>
								</tr>
							</table>
						</td>
						<td>
							<table class="tb">
								<tr>
									<td style="vertical-align: top;"><h3>&nbsp;&nbsp;Quick
											Notes</h3></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div
		style="<c:if test='${findMemberList eq null}'>display: none;</c:if>
	<c:if test='${findMemberList ne null}'>display: block;</c:if>"
		class="modal_wrap">
		<!--모달창 영역-->
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div align="center">
			<jsp:include page="search.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>