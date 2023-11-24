package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.TestDTO;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import com.example.inyeon.main.mapper.TestMapper;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

    //private final TestMapper testMapper;
    private Logger logger = LogManager.getLogger(this.getClass());

    @Override
    public List<TestDTO> selectTest() {
            logger.info("service 진입");
    //    return testMapper.selectTest();
        return null;
    }
}
