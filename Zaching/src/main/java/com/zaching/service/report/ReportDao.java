package com.zaching.service.report;

import java.util.List;

import com.zaching.service.domain.Report;

public interface ReportDao {
	
	public void addReport(Report report) throws Exception;
	
	public List<Report> listReport(int reportId) throws Exception;
	
	public Report getReport(int reportId) throws Exception;
	
	public void updateReport(int reportId) throws Exception;
	
	

}
