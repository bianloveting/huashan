package com.bian.spring.mapper;

import com.bian.spring.entites.SecondCourse;

public interface SecondCourseMapper {
    int deleteByPrimaryKey(Integer sId);

    int insert(SecondCourse record);

    int insertSelective(SecondCourse record);

    SecondCourse selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(SecondCourse record);

    int updateByPrimaryKey(SecondCourse record);
}