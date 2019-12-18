<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
					</th>
				</tr>
				<tr>
					<th>
						<!-- 
							하단 홈페이지 정보 작성
							- 회사정보
							- 정책안내
							- 기타 사이트맵
							- 연락처 
						-->
						
						<h3>ACOHOL WIKI&copy;</h3>
						
						<!-- 홈페이지 세션 상태값 출력 -->
						<h5>session id = <%=session.getId()%></h5>
						
						<%
							String id = (String)session.getAttribute("id");
							String grade = (String)session.getAttribute("grade");
						%>
						<h5>id = <%=id%>, grade = <%=grade%></h5>
						<h5>로그인 상태 = <%=id != null%></h5>
					</th>
				</tr>
			</tbody>	
		</table>
	</div>
</body>
</html>