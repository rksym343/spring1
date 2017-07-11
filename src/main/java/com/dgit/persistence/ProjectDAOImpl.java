package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ProjectVO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.dgit.persistence.ProjectDAO";

	@Override
	public void register(ProjectVO vo) throws Exception {
		session.insert(namespace+".register", vo);
	}

	@Override
	public void modify(ProjectVO vo) throws Exception {
		session.update(namespace+".modify", vo);		
	}

	@Override
	public void remove(int pno) throws Exception {
		session.delete(namespace+".remove", pno);
	}

	@Override
	public ProjectVO read(int pno) throws Exception {
		return session.selectOne(namespace+".read", pno);
	}

	@Override
	public List<ProjectVO> readAll() throws Exception {
		return session.selectList(namespace+".readAll");
	}

	@Override
	public int lastPno() throws Exception {
		return session.selectOne(namespace+".lastPno");
	}
	
}
