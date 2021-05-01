package threego.model.service;
import static common.JDBCTemplate.*;  
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import threego.model.dao.BoardDAO;
import threego.model.vo.Board_Attach;
import threego.model.vo.Board;

public class BoardService {

	public int boardWrite(Board vo ,Board_Attach ao) {
			Connection conn = JDBCTemplate.getConnection();
			int result= new BoardDAO().boardWrite(conn, vo ,ao);
			JDBCTemplate.close(conn);
			System.out.println("패스");
			return result;
	}
	
	
	
	
	public List<Board> getBoardByPage(  int start , int end , String search){
		Connection conn = JDBCTemplate.getConnection();
		List<Board> list = new BoardDAO().getBoardByPage(conn, start, end , search);		
		JDBCTemplate.close(conn);
		return list;
		
	}	
	
	
	public int getBoardCount(String search , Board vo) {     
		Connection conn = JDBCTemplate.getConnection();
	    int result = new BoardDAO().getBoardCount(conn, search ,vo);	
	    JDBCTemplate.close(conn);
		return result;
	
	}
	
	public Board getBoardRead( Board inputVo ) {
		Connection conn = JDBCTemplate.getConnection();
	    Board result = new BoardDAO().getBoardRead(conn, inputVo);	
	    JDBCTemplate.close(conn);
		return result;
	}
	
	
	
	
	}
	

