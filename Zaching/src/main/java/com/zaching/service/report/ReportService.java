package com.zaching.service.report;

import java.util.List;
import java.util.Map;

import com.zaching.service.domain.Report;

public interface ReportService {
	
	public List<Report> listReport(int reportId) throws Exception;
	
	public int addReport(Report report) throws Exception;
	
	public Report getReport(int reportId) throws Exception;
	
	public void updateReport(int reportId) throws Exception;

}
