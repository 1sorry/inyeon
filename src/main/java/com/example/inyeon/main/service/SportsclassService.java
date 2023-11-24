package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.SportsclubDTO;

import java.util.List;

public interface SportsclassService {
    List<SportsclassDTO> sportsclassSelectAll(SportsclassDTO dto);
    int sportsclassCount(SportsclassDTO dto);

    List<SportsclassDTO> sportsclassName();

    List<SportsclassDTO> sportsclassSelect(SportsclassDTO dto);

    //검색
    List<SportsclassDTO> classSearch(SportsclassDTO dto);

}
