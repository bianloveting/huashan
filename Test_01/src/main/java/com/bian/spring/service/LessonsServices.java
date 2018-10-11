package com.bian.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bian.spring.entites.Course;
import com.bian.spring.entites.FirstCourse;
import com.bian.spring.entites.Video;
import com.bian.spring.exception.ServiceException;
import com.bian.spring.mapper.FirstCourseMapper;

@Service
public class LessonsServices {
	
	@Autowired
	private FirstCourseMapper firstCourseMapper;
	
	
	public List<FirstCourse> getAllCourse(){
		return firstCourseMapper.selectAllCourse();
	}


	/*public int uploadFilePath(String string, String getcName) {
		
		return 0;
	}*/
	
	/**
	 * 添加课程
	 * @param course
	 * @return
	 */
	public int addLesson(Course course){
		return firstCourseMapper.addCourse(course);
	}
	
	/**
	 * 根据sId  获取所有的课程信息
	 * @param sId
	 * @return
	 */
	public List<Course> getCourseAll(Integer sId){
		return firstCourseMapper.getCourseAll(sId);
	}
	
	/**
	 * 根据课程的name获取课程信息
	 * @param cName
	 * @return
	 */
	public List<Course> getCourseByName(String cName){
		return firstCourseMapper.getCourseByName(cName);
	}
	
	/**
	 * 根据课程中第二课程的id 查询相关的课程信息
	 * @param sId
	 * @return
	 */
	public List<Course> getCourseBySecondLesson(Integer sId){
		return firstCourseMapper.getCourseBySecondLesson(sId);
	}
	
	
	/**
	 * 随机取出数据(推荐)
	 * @return
	 */
	public List<Course> getRandomLesson(){
		return firstCourseMapper.getRandomLesson();
	}
	
	
	/**
	 * 获取视频所属的课程名
	 * @return
	 */
	public List<Course> getVideoCourse(){
		return firstCourseMapper.getVideoCourse();
	}
	
	/**
	 * 获取视频所属的课程名 
	 * @return
	 */
	public List<Course> getVideoCourse1(){
		return firstCourseMapper.getVideoCourse();
	}
	
	
	/**
	 * 添加视频
	 * @param video
	 * @return
	 */
	public int insertVideoId(Video video){
		return firstCourseMapper.insertVideoId(video);
	}
	
	
	/**
	 * 获取信息
	 * @param id
	 * @return
	 */
	public Course getCourseByCId(Integer id){
		return firstCourseMapper.getCourseByCId(id);
	}
	
	/***
	 * 失败进行回滚
	 * @param c
	 * @return
	 */
	@Transactional 
	public boolean updateCourseByCid(Course c){
		int count =  firstCourseMapper.updateCourseByCid(c);
		if(count <= 0 ){
			throw new ServiceException("错误");
		}
	   return true;
	}
	
	@Transactional
	public boolean updateVideoByCid(Video v){
		int count =  firstCourseMapper.updateVideoByCid(v);
		if(count <= 0){
			throw new RuntimeException("回滚");
		}
	   return true;
	}
	
	/**
	 * 获取所有视频和课程相关的信息
	 * @param cId
	 * @return
	 */
	public Course getVideoInfo(Integer cId){
		return firstCourseMapper.getVideoInfo(cId);
	}
	
	
	
}
