package com.zaching.service.report.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Report;
import com.zaching.service.report.ReportDao;
import com.zaching.service.report.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	@Qualifier("reportDaoImpl")
	private ReportDao reportDao;

	
	public ReportServiceImpl() {
		System.out.println(this.getClass());
	}
	
	
	@Override
	public List<Report> listReport(Search search) throws Exception{
		return reportDao.listReport(search);
	}
	
	
	
	@Override
	public void addReport(Report report) throws Exception{
		
		reportDao.addReport(report);
		
	}
	
	
	
	@Override
	public Report getReport(int reportId) throws Exception{
		return reportDao.getReport(reportId);
	}
	
	
	
	@Override
	public void updateReport(int reportId) throws Exception{
		reportDao.updateReport(reportId);
		
	}

	 


}
