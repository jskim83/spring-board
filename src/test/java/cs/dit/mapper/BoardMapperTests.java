package cs.dit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cs.dit.domain.BoardVO;
import cs.dit.domain.Criteria;
import cs.dit.domain.PageDTO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		
		log.info("-------------------------------------------");
		boardMapper.getList().forEach(board->log.info(board));
	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("테스트 코드에서 입력");
		board.setContent("테스트 코드에서 입력");
		board.setWriter("홍길동");
		
		//boardMapper.insert(board);
		boardMapper.insertSelectKey(board); //새로 추가되는 bno 확인할 때 사용
		log.info("testInsert --------------------------------------------");
		log.info(board);
	}
	
	@Test
	public void testRead() {
		BoardVO board = boardMapper.read(323L);

		log.info("testRead --------------------------------------------");
		log.info(board);
	}
	
	@Test
	public void testDelete() {

		log.info("test/delete --------------------------------------------");	
		log.info("delete" + boardMapper.delete(61L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(4L);
		board.setTitle("수정 제목");
		board.setContent("수정 내용");
		board.setWriter("작성자 수정");
		
		log.info("test-update --------------------------------------------");
		int count = boardMapper.update(board);
		log.info("update count" + count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(2);
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		cri.setPageNum(25);
		
		PageDTO pageDTO = new PageDTO(cri, 253);
		
		log.info(pageDTO);
	}
}
