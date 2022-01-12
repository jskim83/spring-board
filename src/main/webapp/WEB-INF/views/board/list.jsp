<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%@ include file="../includes/header.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="board" items="${list}">
                                    <tr class="odd gradeX">
                                        <td><c:out value="${board.bno}"/></td>
                                        <td><a class="move" href='<c:out value="${board.bno}"/>'>
                                        		<c:out value="${board.title}"/></a></td>
                             						<td><c:out value="${board.writer}"/></td>
																			  <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.regDate}" /></td>
																			  <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.updateDate}" /></td>  
                                    </tr>
                                  </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                            
                            <!-- pagination 시작 -->
                            
														<div class="pull-right">
														  <ul class="pagination">
																<c:if test="${pageMaker.prev}">
															    <li class="page-item">
															      <a class="page-link" href="${pageMaker.startPage - 1}">Prev</a>
															    </li>
														    </c:if>
														    
														    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
															    <li class="page-item ${pageMaker.cri.pageNum == num? 'active' : ''}">
															    	<a class="page-link" href="${num}">${num}</a>
															    </li>
														    </c:forEach>
														    
														    <c:if test="${pageMaker.next}">
															    <li class="page-item">
															      <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
															    </li>
														    </c:if>
														  </ul>
														</div>
														<!-- pagination 끝 -->
														
														<!-- 페이지번호 링크를 클릭하면 다음 데이터를 전달하도록 javascript으로 구현 -->
														<form id="actionForm" action="/board/list" method="get">
															<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
															<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
														</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
<div id="myModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시글 처리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready(function(){
		var result = "<c:out value='${result}'/>";
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result){
			
			if(result ==='' || history.state){
				return;
			}
			if(result==='success'){
				$(".modal-body").html("정상적으로 처리되었습니다!");
			}else if(parseInt(result)>0){
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").click(function(){
			self.location = "/board/register";
		});
		
		
		//페이지번호 하이퍼링크 처리
		var actionForm = $("#actionForm");
		
		$(".page-link").on("click", function(e){
			e.preventDefault(); //기본동작을 막는 코드 : 여기서는 <a> 태그의 기본동작인 링크타고 이동하는 것 막기
			
			var targetPage = $(this).attr("href"); //해당 page-link를 클릭하면 그 링크의 href 속성값을 targetPage(현재페이지)에 저장
			
			console.log(targetPage);
			
			actionForm.find("input[name='pageNum']").val(targetPage);//actionForm의 pageNum를 찾아 값을 현재페이지로 변경
			
			actionForm.submit();//실제 페이지 이동 실행
		});
		
		//자세히 보기(get)를 <a>태그의 링크가 아니라 form태그의 input type='hidden'으로 넘겨준다.
		//이유는 검색시에 링크가 너무 복잡해질 수 있으므로 확장성과 가독성을 위해 javascript로 작성한다.
		$(".move").on("click", function(e){
			e.preventDefault();
			
		var targetBno = $(this).attr("href");
			
		console.log(targetBno);
		
		actionForm.append("<input type='hidden' name='bno' value='" + targetBno + "'>");
		actionForm.attr("action", "/board/get");
		actionForm.submit();
			
		});
	});
</script>


<%@ include file="../includes/footer.jsp"%>