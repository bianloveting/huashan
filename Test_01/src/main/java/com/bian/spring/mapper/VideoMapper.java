package com.bian.spring.mapper;

import com.bian.spring.entites.Video;

public interface VideoMapper {
    int deleteByPrimaryKey(Integer cId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
}