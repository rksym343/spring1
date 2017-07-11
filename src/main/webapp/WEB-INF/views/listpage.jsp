<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp"%>


<div class="container">    

  

  <table class="table table-striped">
    <thead>
      <tr>
        <th>프로젝트 이름</th>
        <th>시작날짜</th>
        <th>종료날짜</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
	    <c:forEach items="${list}" var="pro">
		      <tr>
		       <td><a href="read?pno=${pro.pno }">${pro.pName }</a></td>
		       <td><fmt:formatDate value="${pro.startDate}" pattern="yyyy-MM-dd"/></td>
		       <td><fmt:formatDate value="${pro.endDate }" pattern="yyyy-MM-dd"/></td>
		       <td>${pro.pCondition }</td>
		      </tr>
	     </c:forEach> 
    </tbody>
  </table>
  
  <button type="button" style="margin:10px" class="btn btn-info" id="regProject" >새 프로젝트 등록</button>
  
</div>
	
	<script type="text/javascript">
		$("#regProject").click(function() {
			location.href="register";
		});
	</script>
	
	
<%@ include file="footer.jsp"%>

</body>
</html>