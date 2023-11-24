package com.example.inyeon.main.mapper;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.VoucherDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VoucherMapper {

    List<VoucherDTO> voucherSelectAll(VoucherDTO dto);
    List<VoucherDTO> voucherSelect(VoucherDTO dto);
    int voucherCount(VoucherDTO dto);
    List<VoucherDTO> sportsclassName();

//    List<VoucherDTO> setSelectedSigngu(VoucherDTO dto);

    //검색
    List<VoucherDTO> voucherSearch(VoucherDTO dto);
}
