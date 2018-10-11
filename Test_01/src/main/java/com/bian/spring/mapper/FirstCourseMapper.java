package com.bian.spring.mapper;


import java.util.List;

import com.bian.spring.entites.Course;
import com.bian.spring.entites.FirstCourse;
import com.bian.spring.entites.Video;

public interface FirstCourseMapper {
    int deleteByPrimaryKey(Integer fId);

    int insert(FirstCourse record);

    int insertSelective(FirstCourse record);

    FirstCourse selectByPrimaryKey(Integer fId);

    int updateByPrimaryKeySelective(FirstCourse record);

    int updateByPrimaryKey(FirstCourse record);
    
    
    //查询所有课程
    public List<FirstCourse> selectAllCourse();
    
    //添加课程
    public int addCourse(Course course);
    
    //根据第二列课程id 查询相关课程
    public List<Course> getCourseAll(Integer sId);
    
    //根据第二列课程cName 查询相关课程
    public List<Course> getCourseByName(String cName);
    
    //根据第二列课表的sId 查询课程
    public List<Course> getCourseBySecondLesson(Integer sId);
    
    //随机取出数据(推荐页面)
    public List<Course> getRandomLesson();
    
    //取出
    public List<Course> getVideoCourse();
    
    //取出课表信息
    public List<Course> getVideoCourse1();
    
    
    
    
    //添加视频
    public int insertVideoId(Video video);
    
    //查询课程具体信息
    public Course getCourseByCId(Integer cId);
    
    //根据id修改课程内容
    public int updateCourseByCid(Course course);
    
    //根据id vide课程内容
    public int updateVideoByCid(Video video );
    
    //获取课程与视频的所有的信息
    public Course getVideoInfo(Integer cId);
    
    
}