package com.recruit.service;

import java.util.List;

import com.recruit.dao.gen.model.Job;
import com.recruit.dto.JobDto;
import com.recruit.util.JqueryDto;
import com.recruit.util.Pager;




public interface JobService {

	public boolean saveJob(Job job);
	
	public boolean saveTopJob(int job);

	public boolean updateJob(Job dp);
	
	public List<JobDto> findTen();
	
	public JobDto findByJobId(int id);
	
	public JqueryDto findComJobList(Pager pager,int comid);

	public boolean del(int id);
	
	public boolean delRview(int resume_id);
	
	public JqueryDto findJobList(Pager pager,Job job);
	
	public JqueryDto findHistoryJobList(Pager pager,Job job,int userId);

	JqueryDto findComJobRviewList(Pager pager, int comid);

//	public String editOrSavejob(Job job);
}
