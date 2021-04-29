package kh.board.model;

import java.sql.Connection;
import java.util.List;

import common.jdbc.JDBCConectionPool;

public class BoardService {

	public List<Board> getBoardAll() {
		Connection conn = JDBCConectionPool.getConnection();
		List<Board> list = new BoardDAO().getBoardAll(conn);
		JDBCConectionPool.colse(conn);
		return list;
	}
	public List<Board> getBoardByPage(int start, int end, String search) {
		Connection conn = JDBCConectionPool.getConnection();
		List<Board> list = new BoardDAO().getBoardByPage(conn, start, end, search);
		JDBCConectionPool.colse(conn);
		return list;
	}
	
	public int boardWrite(Board vo) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().boardWrite(conn, vo);
		JDBCConectionPool.colse(conn);
		return result;
	}
	public int getBoardCount(String search) {
		Connection conn = JDBCConectionPool.getConnection();
		int result = new BoardDAO().getBoardCount(conn, search);
		JDBCConectionPool.colse(conn);
		return result;
	}
	public Board getBoardRead(Board inputVo) {
		Connection conn = JDBCConectionPool.getConnection();
		Board result = new BoardDAO().getBoardRead(conn, inputVo);
		JDBCConectionPool.colse(conn);
		return result;
	}
}
