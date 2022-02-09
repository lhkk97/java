package com.human.exercise;

import java.util.ArrayList;

public interface iJob {
	ArrayList<Job> jobList();
	ArrayList<EmpInfo> getList(String jobid);
	
	ArrayList<Dept> deptList();
	ArrayList<Employee> getDept(int did);
	ArrayList<emp> getMList();
}
