package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.SubjectVO;

public interface CmMapper {
	
	/**
	 * 강의목록 전체 불러오기
	 * @return List SubjectVO
	 */
	public List<SubjectVO> getAll();

}
