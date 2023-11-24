package com.example.inyeon.main.service;

import com.example.inyeon.main.dto.VoucherDTO;

import java.util.List;

public interface VoucherService {
    List<VoucherDTO> voucherSelectAll(VoucherDTO dto);
    List<VoucherDTO> voucherSelect(VoucherDTO dto);

    List<VoucherDTO> sportsclassName();
    int voucherCount(VoucherDTO dto);

    //검색
    List<VoucherDTO> voucherSearch(VoucherDTO dto);
}
