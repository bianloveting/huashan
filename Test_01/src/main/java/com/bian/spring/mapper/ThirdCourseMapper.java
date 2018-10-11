package com.bian.spring.mapper;

import com.bian.spring.entites.ThirdCourse;

public interface ThirdCourseMapper {
    int deleteByPrimaryKey(Integer tId);

    int insert(ThirdCourse record);

    int insertSelective(ThirdCourse record);

    ThirdCourse selectByPrimaryKey(Integer tId);

    int updateByPrimaryKeySelective(ThirdCourse record);

    int updateByPrimaryKey(ThirdCourse record);
}