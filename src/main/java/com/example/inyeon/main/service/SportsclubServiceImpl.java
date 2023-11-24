package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclubDTO;
import com.example.inyeon.main.mapper.SportsclubMapper;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SportsclubServiceImpl implements SportsclubService {

    private final SportsclubMapper sportsclubMapper;
    private Logger logger = LogManager.getLogger(this.getClass());

    @Override
    public List<SportsclubDTO> sportsclubSelectAll(SportsclubDTO dto) {
        logger.info("SportsclubServiceAll 진입 >>>> ");
        return sportsclubMapper.sportsclubSelectAll(dto);
    }
    @Override
    public List<SportsclubDTO> sportsclubSelect(SportsclubDTO dto) {
        logger.info("SportsclubService 진입 >>>> ");
        return sportsclubMapper.sportsclubSelect(dto);
    }

    @Override
    public List<SportsclubDTO> sportsclubName() {

        return sportsclubMapper.sportsclubName();
    }

    @Override
    public int sportsclubCount(SportsclubDTO dto) {
        return sportsclubMapper.sportsclubCount(dto);
    }

    @Override
    public List<SportsclubDTO> clubSearch(SportsclubDTO dto) {
        logger.info("clubSearch");
        return sportsclubMapper.clubSearch(dto);
    }


}
