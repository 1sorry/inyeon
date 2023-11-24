package com.example.inyeon.main.mapper;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.SportsclubDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SportsclassMapper {
    List<SportsclassDTO> sportsclassSelectAll(SportsclassDTO dto);

    int sportsclassCount(SportsclassDTO dto);

    List<SportsclassDTO> sportsclassName();

    List<SportsclassDTO> sportsclassSelect(SportsclassDTO dto);

    //검색
    List<SportsclassDTO> classSearch(SportsclassDTO dto);

}
