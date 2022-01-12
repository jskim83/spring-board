package cs.dit.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage, endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO (Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/(double)cri.getAmount()))*10;
		this.startPage = this.endPage-9;
		
		int realEndPage = (int)(Math.ceil(total*1.0 /cri.getAmount()));
		this.endPage = realEndPage <= this.endPage ? realEndPage : endPage;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
		
		
		
	}
	
	
	
}
