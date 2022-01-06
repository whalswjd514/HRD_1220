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
<h1>학사정보 목록</h1>
<hr>
<table border=1 id="tab3">
	<tr>
		<th id="th2">학번</th>
		<th id="th2">성명</th>
		<th id="th2">학과</th>
		<th id="th2">학년</th>
		<th id="th2">주소</th>
		<th id="th2">연락처</th>
		<th id="th2">취미</th>
		<th id="th2">관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from stud1220";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String studno=rs.getString(1);
			String name=rs.getString(2);
			String dept=rs.getString(3);
			String position=rs.getString(4);
			String address=rs.getString(5);
			String phone=rs.getString(6);
			String hobby=rs.getString(7);

%>
	<tr>
		<td><%=studno %></td>
		<td><%=name %></td>
		<td><%=dept %></td>
		<td><%=position %></td>
		<td><%=address %></td>
		<td><%=phone %></td>
		<td><%=hobby %></td>
		<td><a href="studentUpdate.jsp?studno=<%=studno %>">수정</a>/
			<a href="studentDelete.jsp?studno=<%=studno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
	}
%>
</table>
<div class="btn_group">
<button type="button" onclick="location.href='studentInsert.jsp'">학사정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>