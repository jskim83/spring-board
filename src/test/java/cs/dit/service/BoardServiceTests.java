package cs.dit.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.BoardVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testGetList() {
		log.info("GetList---------------------------");
		
		//service.getList().forEach(board-> log.info(board)); //람다식 표현
		List<BoardVO> list = service.getList();
		for(BoardVO board : list) {
			log.info(board);
		}
	}
	@Test
	public void testGet() {
		log.info("GET---------------------------");
		
		BoardVO board = service.get(322L);
		log.info(board);
	}
	
	@Test
	public void testRemove() {
		log.info("Remove---------------------------");
		
		log.info("remove result : " + service.remove(4L));
	}
	
	@Test
	public void testModify() {
		log.info("Modify---------------------------");
		BoardVO board = service.get(62L);
		
		board.setContent("진짜 졸린다!!!!");
		log.info("Modify result : " + service.modify(board));
	}
}
