package kh.model;

import java.sql.Connection;
import java.util.List;

import common.jdbc.JDBCConectionPool;

public class BoardService {
	public List<Board> getBoardAll(Board vo) {
		Connection conn = JDBCConectionPool.getConnection();
		List<Board> list = new BoardDAO().getBoardAll(conn);
		JDBCConectionPool.close(conn);
		return list;
	}

	public List<Board> getBoardByPage(int start, int end, String search) {
		Connection conn = JDBCConectionPool.getConnection();
		List<Board> list = new BoardDAO().getBoardByPage(conn, start, end, search);
		JDBCConectionPool.close(conn);
		return list;
	}
	public int getBoardCount( String search) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().getBoardCount(conn, search);
		JDBCConectionPool.close(conn);
		return result;		
	}
	public int boardWrite( Board vo) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().boardWrite(conn, vo);
		JDBCConectionPool.close(conn);
		return result;		
	}
	public Board getBoardRead(Board inputVo) {
		Connection conn = JDBCConectionPool.getConnection();
		Board result = new BoardDAO().getBoardRead(conn, inputVo);
		JDBCConectionPool.close(conn);
		return result;		
	}
	public int boardUpdate( Board vo) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().boardUpdate(conn, vo);
		JDBCConectionPool.close(conn);
		return result;	
	}
	public int boardDelete( Board vo) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().boardDelete(conn, vo);
		JDBCConectionPool.close(conn);
		return result;	
	}
}
