package com.bian.spring.mapper;

import com.bian.spring.entites.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKeyWithBLOBs(Course record);

    int updateByPrimaryKey(Course record);
}