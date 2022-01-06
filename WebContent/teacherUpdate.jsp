<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String idx=request.getParameter("idx");
	
	try{
		String sql="select * from teacher1220 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String major=rs.getString("major");
			String field=rs.getString("field");
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="teacherUpdate_Process.jsp">
<h1>강사 수정 화면</h1>
<table border=1 id="tab4">
	<tr>
		<th id="th3">강사 ID</th>
		<td><input type="text" name="idx" id="in1" value="<%=idx %>">자동증가(Sequence 발생)</td>
	</tr>
	<tr>
		<th id="th3">강 사 명</th>
		<td><input type="text" name="name" id="in1" value="<%=name %>"></td>
	</tr>
	<tr>
		<th id="th3">전 공</th>
		<td><input type="text" name="major" id="in1" value="<%=major %>"></td>
	</tr>
	<tr>
		<th id="th3">세부 전공</th>
		<td><input type="text" name="field" id="in1" value="<%=field %>"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<button type="button" onclick="location.href='teacherSelect.jsp'" id="btn2">목록</button>
			<input type="button" value="수정" onclick="check()" id="btn2">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("강사명이 입력되지 않았습니다.");
			document.form.name.focus();
		}else if(document.form.major.value==""){
			alert("전공이 입력되지 않았습니다.");
			document.form.major.focus();
		}else if(document.form.field.value==""){
			alert("세부전공이 입력되지 않았습니다.");
			document.form.field.focus();
		}else{
			alert("수정이 완료되었습니다.");
			document.form.submit();
		}
	}
</script>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
	}
%>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>