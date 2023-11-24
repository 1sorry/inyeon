package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclubDTO;

import java.util.List;

public interface SportsclubService {

    List<SportsclubDTO> sportsclubSelectAll(SportsclubDTO dto);
    List<SportsclubDTO> sportsclubSelect(SportsclubDTO dto);

    List<SportsclubDTO> sportsclubName();
    int sportsclubCount(SportsclubDTO dto);

    //검색
    List<SportsclubDTO> clubSearch(SportsclubDTO dto);

}
