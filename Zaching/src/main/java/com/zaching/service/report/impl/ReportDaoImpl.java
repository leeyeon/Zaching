package com.zaching.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Report;
import com.zaching.service.report.ReportDao;

@Repository("reportDaoImpl")
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public ReportDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addReport(Report report) throws Exception{
		sqlSession.insert("ReportMapper.addReport", report);
	}
	
	
	@Override
	public List<Report> listReport(Search search) throws Exception{
		return sqlSession.selectList("ReportMapper.listReport", search);
	}
	
	
	@Override
	public Report getReport(int reportId) throws Exception{
		return sqlSession.selectOne("ReportMapper.getReport", reportId);
		
	}
	
	
	@Override
	public void updateReport(int reportId) throws Exception{
		sqlSession.update("ReportMapper.updateReport", reportId);
	}
	

	

}
