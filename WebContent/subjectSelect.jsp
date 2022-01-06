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
<h1>교과목 목록</h1>
<hr>
<table border=1 id="tab3">
	<tr>
		<th>과목코드</th>
		<th>과목명</th>
		<th>학점</th>
		<th>담당강사</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from sub1220 order by id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String subject_name=rs.getString(2);
			String credit=rs.getString(3);
			String lecturer=rs.getString(4);
			if(lecturer.equals("1")){
				lecturer="김교수";
			}else if(lecturer.equals("2")){
				lecturer="이교수";
			}else if(lecturer.equals("3")){
				lecturer="박교수";
			}else if(lecturer.equals("4")){
				lecturer="우교수";
			}else if(lecturer.equals("5")){
				lecturer="최교수";
			}else if(lecturer.equals("6")){
				lecturer="강교수";
			}else if(lecturer.equals("7")){
				lecturer="황교수";
			}
			String week=rs.getString(5);
			String start_hour=rs.getString(6);
			String end_hour=rs.getString(7);
			System.out.println("테이블 조회 성공");

%>
	<tr>
		<td><%=id %></td>
		<td><%=subject_name %></td>
		<td><%=credit %></td>
		<td><%=lecturer %></td>
		<td><%=week %></td>
		<td><%=start_hour %></td>
		<td><%=end_hour %></td>
		<td><a href="subjectUpdate.jsp?id=<%=id %>">수정</a> / 
			<a href="subjectDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
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
<button type="button" onclick="location.href='subjectInsert.jsp'">작성</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>