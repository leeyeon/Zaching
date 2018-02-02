package com.zaching.service.report;

import java.util.List;

import com.zaching.common.domain.Search;
import com.zaching.service.domain.Report;

public interface ReportDao {
	
	public void addReport(Report report) throws Exception;
	
	public List<Report> listReport(Search search) throws Exception;
	
	public Report getReport(int reportId) throws Exception;
	
	public void updateReport(int reportId) throws Exception;
	
	

}
