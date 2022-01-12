<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="../includes/header.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <div class="form-group">
                               <label>BNO</label>
                               <input class="form-control" name="bno" readonly="readonly" value="<c:out value='${board.bno}'/>"/>
                          </div> 
                          <div class="form-group">
                               <label>Title</label>
                               <input class="form-control" name="title" readonly="readonly" value="<c:out value='${board.title}'/>"/>
                          </div>
                          <div class="form-group">
                               <label>Content</label>
                               <textarea class="form-control" rows="5" cols="50" name="content"><c:out value='${board.content}'/></textarea>
                          </div>
                          <div class="form-group">
                               <label>Writer</label>
                               <input class="form-control" name="writer" value="<c:out value='${board.writer}'/>"/>
                          </div>	
                          
                          <!-- 폼태그와 이벤트로 데이터 유지 이동 -->         
                          <form id='actionForm' action="/board/list" method="get">
													  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
													  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
													  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
													</form>
                                                    	                          
                          <button type="button" class="btn btn-default listBtn">List</button>
                          <button type="button" class="btn btn-default modBtn">Modify</button>
                          
                          <script>
                          var actionForm = $("#actionForm");
                          
                          $(".listBtn").click(function(e){
                          		e.preventDefault();
                          		
                          		actionForm.find("input[name='bno']").remove(); //리스트로 이동시에는 bno 필요없음
                          		actionForm.submit();
                          });
                          
                          $(".modBtn").click(function(e){
                        		e.preventDefault();
                        		
                        		actionForm.attr("action", "/board/modify"); //modify로 이동
                        		actionForm.submit();
                        	});
                          </script>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

<%@ include file="../includes/footer.jsp"%>