package kr.or.ddit.cm.service;

import java.util.List;

import kr.or.ddit.vo.SubjectVO;

public interface CmService {

	/**
	 * 강의목록 전체 불러오기
	 * @return List SubjectVO
	 */
	public List<SubjectVO> getAll();

}
