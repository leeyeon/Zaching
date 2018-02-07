package com.zaching.service.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zaching.service.bob.BobDao;

@Configuration
@ComponentScan(basePackages="com.zaching.service.bob.impl")
@EnableScheduling
public class SchedulerConfig {

	public SchedulerConfig() {
		System.out.println(this.getClass()+".Scheduler()");
	}

	
}
