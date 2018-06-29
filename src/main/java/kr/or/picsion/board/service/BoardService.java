package kr.or.picsion.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.picsion.board.dao.BoardDao;
import kr.or.picsion.board.dto.Board;

@Service
public class BoardService {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : selectBoard 
	 * 작성자명 : 김준수 
	 * 기 능 : 글 상세보기 서비스
	 *
	 * @param brdNo
	 * @return
	 */
	public Board selectBoard(int brdNo) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		System.out.println("보드 서비스 ");
		Board board = boarddao.selectBoard(brdNo);

		return board;
	}
	

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : updateBoard 
	 * 작성자명 : 김준수 
	 * 기 능 : 글 수정 서비스
	 *
	 * @param board
	 * @return
	 */
	public int updateBoard(Board board) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		System.out.println("updateBoard 서비스 ");
		int result = boarddao.updateBoard(board);

		return result;
	}

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : boardList 
	 * 작성자명 : 김준수 
	 * 기 능 : 글목록보기 서비스
	 *
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<Board> boardList() throws ClassNotFoundException, SQLException {

		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		List<Board> list = boarddao.boardList();

		return list;
	}

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : insertBoard 
	 * 작성자명 : 김준수 
	 * 기 능 : 글쓰기
	 *
	 * @param board
	 */
	public void insertBoard(Board board) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		System.out.println("글 쓰기 전");
		boarddao.insertBoard(board);
		System.out.println("글쓰기 완료");
	}

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : operationBoardList 
	 * 작성자명 : 김준수
	 * 기 능 : 내 작업 게시판 리스트
	 *
	 * @param userNo
	 * @return
	 */
	public List<Board> operationBoardList(int userNo) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		System.out.println("operationBoardList 서비스 시작 ");
		return boarddao.operationBoardList(userNo);
	}

	/**
	 * 날 짜 : 2018. 6. 29. 
	 * 메소드명 : requestBoardList 
	 * 작성자명 : 김준수 
	 * 기 능 : 내 요청 게시판 리스트
	 *
	 * @param userNo
	 * @return
	 */
	public List<Board> requestBoardList(int userNo) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		System.out.println("requestBoardList 서비스 시작 ");
		return boarddao.requestBoardList(userNo);
	}

}
