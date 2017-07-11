<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp"%>

<div class="container">
  <form class="form-horizontal" id="f1">
  	<input type="hidden" value="${vo.pno }" name="pno">
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">프로젝트 이름</label>
      <div class="col-sm-10">
        <input readonly="readonly" type="text" class="form-control" id="title" value="${vo.pName }" placeholder="프로젝트 이름" name="pName">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pDetail">프로젝트 내용</label>
      <div class="col-sm-10">   
 	 	<textarea class="form-control" readonly="readonly" 
 	 	rows="5" id="pDetail" name="pDetail" placeholder="프로젝트 내용">${vo.pDetail }</textarea>
 	 </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="startDate">시작날짜</label>
      <div class="col-sm-10">
     	<fmt:formatDate value="${vo.startDate }" var="sd" pattern="yyyy-MM-dd"/>          
        <input readonly="readonly" type="text" class="form-control" id="startDate" value="${sd }" placeholder="시작날짜" name="sd">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="endDate">종료날짜</label>
      <div class="col-sm-10">          
      	<fmt:formatDate value="${vo.endDate }" var="ed" pattern="yyyy-MM-dd"/>
        <input readonly="readonly" type="text" class="form-control" id="endDate" value="${ed }" placeholder="종료날짜" name="ed">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pCondition">상태</label>
       <div class="col-sm-10"> 
     	  <input readonly="readonly" type="text" class="form-control" id="pCondition" value="${vo.pCondition }" name="pCondition">  
     	 </div>
      </div>
    
    
 
    <div class="form-group">     
      <div class="col-sm-12">
       <div style="text-align:center">
		      <input type="submit" id="modBtn" value="수정" class="btn btn-info" >
		      <input type="button" id="delBtn" value="삭제" class="btn btn-danger">
		      <input type="button" id="backBtn" value="리스트" class="btn btn-default">
	      </div>
      </div>
    </div>
    
  </form>
</div>
  
<script>
	$("#modBtn").click(function() {
		$("#f1").attr("action","modify");
		$("#f1").attr("method","get");
		$("#f1").submit();
	});
	
	$("#delBtn").click(function() {
		if(confirm("삭제하시겠습니까?")){
			$("#f1").attr("action","delete");
			$("#f1").attr("method","post");
			$("#f1").submit(); 
		};
	});
	
	$("#backBtn").click(function() {
		location.href="listpage";
	});
</script>


<%@ include file="footer.jsp"%>