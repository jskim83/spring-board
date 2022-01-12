<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="../includes/header.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify/Delete</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify/Delete
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form>
                        		<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
                        		<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                        		
	                          <div class="form-group">
	                               <label>BNO</label>
	                               <input class="form-control" name="bno" readonly="readonly" value="<c:out value='${board.bno}'/>"/>
	                          </div> 
	                          <div class="form-group">
	                               <label>Title</label>
	                               <input class="form-control" name="title" value="<c:out value='${board.title}'/>"/>
	                          </div>
	                          <div class="form-group">
	                               <label>Content</label>
	                               <textarea class="form-control" rows="5" cols="50" name="content"><c:out value='${board.content}'/>
	                               </textarea>
	                          </div>
	                          <div class="form-group">
	                               <label>Writer</label>
	                               <input class="form-control" name="writer" value="<c:out value='${board.writer}'/>"/>
	                          </div>	
	                                                    	                          
	                          <button class="btn btn-default" data-oper="modify">Modify</button>
	                          <button class="btn btn-danger" data-oper="remove">Remove</button>
														<button class="btn btn-info" data-oper="list">List</button>
													</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
<script>
$(document).ready(function(){
	var formObj = $("form");
	
	$('.btn').click(function(e){
		
		e.preventDefault(); //폼태그의 기본동작이 submit인데 이를 막기위해 사용(링크도 막음)
		
		var operation = $(this).data("oper");  //$(this)는 버튼을 의미
		console.log(operation);  //개발자 도구 콘솔창에서 확인
		
		if(operation ==='list'){
			formObj.attr("action", "/board/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);

		}else if(operation ==='remove'){
			formObj.attr("action", "/board/remove").attr("method", "post");
			
		}else if(operation ==='modify'){
			formObj.attr("action", "/board/modify").attr("method", "post");
		}
		formObj.submit();
	});
});
</script>            

<%@ include file="../includes/footer.jsp"%>