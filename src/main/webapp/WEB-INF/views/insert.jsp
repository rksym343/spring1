<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="container">
  <form id="f1" class="form-horizontal">
  	
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">프로젝트 이름</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" placeholder="프로젝트 이름" name="pName">
        <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pDetail">프로젝트 내용</label>
      <div class="col-sm-10">   
 	 	<textarea class="form-control" rows="5" id="pDetail" name="pDetail" placeholder="프로젝트 내용"></textarea>
 	 	<span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
 	 </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="startDate">시작날짜</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control date_form" id="startDate" placeholder="OOOO-OO-OO" name="sd">
        <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="endDate">종료날짜</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control date_form" id="endDate" placeholder="OOOO-OO-OO" name="ed">
        <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pCondition">상태</label>
       <div class="col-sm-10">   
	     <select class="form-control" name="pCondition" id="pCondition">
	     	<option value="">---------</option>
	        <option value="준비">준비</option>
	        <option value="진행중">진행중</option>
	        <option value="종료">종료</option>
	        <option value="보류">보류</option>
	      </select>
	      <span class="glyphicon glyphicon-warning-sign form-control-feedback"></span>
     	 </div>
      </div>
    
    
 
    <div class="form-group">     
      <div class="col-sm-12">
       <div style="text-align:center">
	      <input type="submit" id="addBtn" value="저장" class="btn btn-info" >
	      <input type="reset" id="backBtn" value="취소" class="btn btn-default">
      </div>
      </div>
    </div>
    
  </form>
</div>

<script>

function checkInputEmpty($obj) {
	   var count = 0;
	   
	   $obj.each(function(i, element) {
	      if ($(element).val() == "") {
	    	  $(this).next("span").removeClass();
	    		$(this).next("span").addClass("glyphicon glyphicon-warning-sign form-control-feedback");
	    	  	
	    	  	$(this).parent().parent().removeClass();
				$(this).parent().parent().addClass("form-group has-warning has-feedback");
				$(this).next("span").show();
	         	count++;
	      }else if($(element).attr("class").match("date_form") != null && dateCheck($(element).val())==false){
		    	$(this).next("span").removeClass();
		    	$(this).next("span").addClass("glyphicon glyphicon-remove form-control-feedback");
		    	$(this).parent().parent().removeClass();
				$(this).parent().parent().addClass("form-group has-error has-feedback");
				$(this).next("span").show();
		        count++;
	      }else{
	    	  $(this).next("span").hide();
	    	  $(this).parent().parent().removeClass();
				$(this).parent().parent().addClass("form-group");
	      }
	      
	   })
	   if (count > 0) {
	      return false;
	   }
	   return true;
	}
	
	function dateCheck(str){
		var arr = str.split("-");
		
		if(arr.length != 3){
			return false;
		}		
		if(arr[0].length > 4 || arr[1].length > 2 || arr[2].length >2){
			return false;
		}
		if(parseInt(arr[0]) < 1900){
			return false;
		}
		if(parseInt(arr[1])> 12 || parseInt(arr[1]) < 0){
			return false;
		}
		
		if(parseInt(arr[1]) == 2){
			if(parseInt(arr[0])%4==0 && parseInt(arr[0])%100 !=0 || parseInt(arr[0]) %400 == 0){
				if(parseInt(arr[2])>29){
					return false
				}
			}else{
				if(parseInt(arr[2])>28){
					return false
				}
			}
		}else if(parseInt(arr[1]) == 1 || 3 || 5 || 7 || 8 || 10 || 12 ){
			if(parseInt(arr[2])>31){
				return false
			}
		}else{
			if(parseInt(arr[2])>30){
				return false
			}
		}
		return true;
		
	}
	
	$(function(){
		  $(".form-control").next("span").hide();
	      $("#f1").submit(function() {
	    	  if($("#f1").attr("action")=="register"){
		         if(checkInputEmpty($(".form-control")) == false){
		            return false; // 서버로 값 전달 안되게 처리함
		         }
	    	  }
	      });
	})
	
	$("#addBtn").click(function() {
		$("#f1").attr("action","register");
		$("#f1").attr("method","post");
		$("#f1").submit(); 
	});

	$("#backBtn").click(function() {
		$("#f1").attr("action", "listpage");
		$("#f1").attr("method", "get"); 
		$("#f1").submit();
	});
	
	
</script>

<%@ include file="footer.jsp"%>