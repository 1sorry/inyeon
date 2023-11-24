package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.VoucherDTO;
import com.example.inyeon.main.mapper.VoucherMapper;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VoucherServiceImpl implements VoucherService {

    private final VoucherMapper voucherMapper;
    Logger logger = LogManager.getLogger(this.getClass());


    @Override
    public List<VoucherDTO> voucherSelectAll(VoucherDTO dto) {
            logger.info("service 진입");
        return voucherMapper.voucherSelectAll(dto);
    }
    @Override
    public List<VoucherDTO> voucherSelect(VoucherDTO dto) {

        return voucherMapper.voucherSelect(dto);
    }


    @Override
    public List<VoucherDTO> sportsclassName() {

        return voucherMapper.sportsclassName();
    }

    @Override
    public int voucherCount(VoucherDTO dto) {

        return voucherMapper.voucherCount(dto);

    }


    @Override
    public List<VoucherDTO> voucherSearch(VoucherDTO dto) {
        logger.info("voucherSearch");
        return voucherMapper.voucherSearch(dto);
    }

}
