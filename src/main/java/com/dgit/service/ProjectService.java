package com.dgit.service;

import java.util.List;

import com.dgit.domain.ProjectVO;

public interface ProjectService {
	public void register(ProjectVO vo) throws Exception;
	public void modify(ProjectVO vo) throws Exception;
	public void remove(int pno) throws Exception;
	public ProjectVO read(int pno) throws Exception;
	public List<ProjectVO> readAll() throws Exception;
	public int lastPno() throws Exception;
}
