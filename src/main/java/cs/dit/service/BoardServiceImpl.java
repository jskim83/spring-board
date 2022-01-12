package cs.dit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cs.dit.domain.BoardVO;
import cs.dit.domain.Criteria;
import cs.dit.mapper.BoardMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getList() {
		
		return boardMapper.getList();
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {

		return boardMapper.getListWithPaging(cri);
	}

	@Override
    public void register(BoardVO board) {
		log.info("register -------------------");
		boardMapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		
		return boardMapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		return boardMapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		
		return boardMapper.delete(bno)==1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return boardMapper.getTotalCount(cri);
	}

 }

