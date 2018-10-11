package com.bian.spring.test;




import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class Test {
	
	@Value("#{config['jdbc.driverClass']}")
	private String accessKey;

	@Autowired
	private SqlSession sqlSession;
	
	@org.junit.Test
	public void test(){
		System.out.println(sqlSession);
		System.out.println(222);
		System.out.println(accessKey);
	}
	
	public static void main(String[] args) {
		System.out.println(5555);
		
	}
	
		
		
	}
