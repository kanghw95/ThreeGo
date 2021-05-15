package threego.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;

import threego.model.dao.CommentDAO;

import threego.model.vo.Comment_tb;

public class CommentService {

	public int CommentWrite(Comment_tb co) {
		Connection conn = JDBCTemplate.getConnection();
		int result= new CommentDAO().CommentWrite(conn, co);
		JDBCTemplate.close(conn);
		return result;
	}
	 public List<Comment_tb> getCommentAll(int bd_content_no) {
		Connection conn = JDBCTemplate.getConnection();
		List<Comment_tb> list = new CommentDAO().getCommentAll(conn,bd_content_no);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Comment_tb> getCommentByPage(int start, int end, int bd_content_no) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Comment_tb> list = new CommentDAO().getCommentByPage(conn, start, end,  bd_content_no);		
		JDBCTemplate.close(conn);
		return list;
	}	

	
	public int getCommentCount( int bd_content_no) {     
		Connection conn = JDBCTemplate.getConnection();
	    int result = new CommentDAO().getCommentCount(conn, bd_content_no);	
	    JDBCTemplate.close(conn);
		return result;
	
	}

	/**
public Comment_tb getCommentRead( Comment_tb co ) {
	Connection conn = JDBCTemplate.getConnection();
	Comment_tb result = new CommentDAO().getCommentRead(conn, co);	
    JDBCTemplate.close(conn);
	return result;
}
**/
public int getCommentUpdate( Comment_tb co ) {
	Connection conn = JDBCTemplate.getConnection();
    int result = new CommentDAO().getCommentUpdate(conn, co);	
    JDBCTemplate.close(conn);
	return result;
}
public int getCommentDelete( Comment_tb co ) {
	Connection conn = JDBCTemplate.getConnection();
    int result = new CommentDAO().getCommentDelete(conn, co);	
    JDBCTemplate.close(conn);
	return result;
}





}


