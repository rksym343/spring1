package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.ProjectVO;
import com.dgit.persistence.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	private ProjectDAO dao;

	@Override
	public void register(ProjectVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public void modify(ProjectVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void remove(int pno) throws Exception {
		dao.remove(pno);
	}

	@Override
	public ProjectVO read(int pno) throws Exception {
		return dao.read(pno);
	}

	@Override
	public List<ProjectVO> readAll() throws Exception {
		return dao.readAll();
	}

	@Override
	public int lastPno() throws Exception {
		return dao.lastPno();
	}
	
}
