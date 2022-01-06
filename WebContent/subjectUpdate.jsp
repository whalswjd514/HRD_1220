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
	String id=request.getParameter("id");
	try{
		String sql="select * from sub1220 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String subject_name=rs.getString("subject_name");
			String credit=rs.getString("credit");
			String lecturer=rs.getString("lecturer");
			String week=rs.getString("week");
			String start_hour=rs.getString("start_hour");
			String end_hour=rs.getString("end_hour");
			System.out.println("데이터 조회 성공");

%>
<form name="form" method="post" action="subjectUpdate_Process.jsp">
<h1>교과목 수정 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th3">교과목 코드</th>
		<td><input type="text" name="id" value="<%=id %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th3">과 목 명</th>
		<td><input type="text" name="subject_name" value="<%=subject_name %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th3">학 점</th>
		<td><input type="text" name="credit" value="<%=credit %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th3">담 당 강 사</th>
		<td>
			<select name="lecturer" id="in1">
				<option value="0" <%if(lecturer.equals("0")){%>selected<%}%>>담당강사 선택</option>
				<option value="1" <%if(lecturer.equals("1")){%>selected<%}%>>김교수</option>
				<option value="2" <%if(lecturer.equals("2")){%>selected<%}%>>이교수</option>
				<option value="3" <%if(lecturer.equals("3")){%>selected<%}%>>박교수</option>
				<option value="4" <%if(lecturer.equals("4")){%>selected<%}%>>우교수</option>
				<option value="5" <%if(lecturer.equals("5")){%>selected<%}%>>최교수</option>
				<option value="6" <%if(lecturer.equals("6")){%>selected<%}%>>강교수</option>
				<option value="7" <%if(lecturer.equals("7")){%>selected<%}%>>황교수</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th3">요 일</th>
		<td><input type="radio" name="week" value="1" <%=week.equals("1") ? "checked":"" %>>월요일
			<input type="radio" name="week" value="2" <%=week.equals("2") ? "checked":"" %>>화요일
			<input type="radio" name="week" value="3" <%=week.equals("3") ? "checked":"" %>>수요일
			<input type="radio" name="week" value="4" <%=week.equals("4") ? "checked":"" %>>목요일
			<input type="radio" name="week" value="5" <%=week.equals("5") ? "checked":"" %>>금요일
			<input type="radio" name="week" value="6" <%=week.equals("6") ? "checked":"" %>>토요일
		</td>
	</tr>
	<tr>
		<th id="th3">시 작</th>
		<td><input type="text" name="start_hour" value="<%=start_hour %>" id="in1"></td>
	</tr>
	<tr>
		<th id="th3">종 료</th>
		<td><input type="text" name="end_hour" value="<%=end_hour %>" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="목록" id="btn1">
			<input type="button" value="수정" id="btn1" onclick="check()">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.id.value==""){
			alert("교과목 코드가 입력되지 않았습니다.");
			document.form.id.focus();
		}else if(document.form.subject_name.value==""){
			alert("교과목명이 입력되지 않았습니다.");
			document.form.subject_name.focus();
		}else if(document.form.credit.value==""){
			alert("학점이 입력되지 않았습니다.");
			document.form.credit.focus();
		}else if(document.form.lecturer.value=="0"){
			alert("담당강사가 입력되지 않았습니다.");
			document.form.lecturer.focus();
		}else if(document.form.start_hour.value==""){
			alert("시작시간이 입력되지 않았습니다.");
			document.form.start_hour.focus();
		}else if(document.form.end_hour.value==""){
			alert("종료시간이 입력되지 않았습니다.");
			document.form.end_hour.focus();
		}else{
			alert("수정 완료");
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