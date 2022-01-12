package cs.dit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration  //Test for controller: WebApplicationContext를 사용하기 위해
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"} )
@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; //uri와 파라미터 등을 브라우저에서 사용하는 것 처럼 만들어 컨트롤러를 테스트함
							//tomcat을 통해 실행하는 것이 아님
			//MockMvc는 서블릿 컨테이너의 구동 없이, 시뮬레이션된 MVC 환경에 모의 HTTP 서블릿 요청을 전송하는 기능을 제공하는 유틸리티 클래스
	
	@Before  //모든 테스트 전에 매번 실행되는 메서드가 됨
	public void setup() {
		//MockMvcBuilders를 이용하여 GET방식의 호출을 함
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info("test-----------------------------------------------------");
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andExpect(status().isOk())
				//	.andReturn()
				//	.getModelAndView()
				//	.getModelMap()				
				);
	}
	
	@Test
	public void testRegister() throws Exception {
		log.info("register test-----------------------------------------------");
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "제목 테스트 중...2")
				.param("content", "새로운 글 테스트 중...2")
				.param("writer", "홍길동...2")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	@Test
	public void testGet() throws Exception {
		log.info("get test-----------------------------------------------");
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "361")
				).andReturn().getModelAndView().getModelMap()
		);
	}
	
	@Test
	public void testModify() throws Exception {
		log.info("modify test-----------------------------------------------");
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "341")
				.param("title", "다시 쓰는 게시물")
				.param("content", "한번 볼까요?")
				.param("writer","성춘향")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception {
		log.info("remove test-----------------------------------------------");
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "341")
				).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testListPaging() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "3")
				.param("amount", "10"))
				.andReturn().getModelAndView().getModelMap()
				);
	}
}
