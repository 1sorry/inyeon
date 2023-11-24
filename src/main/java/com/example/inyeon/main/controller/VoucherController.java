package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.VoucherDTO;
import com.example.inyeon.main.service.VoucherService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.inyeon.paging.Paging;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class VoucherController {

    private final VoucherService voucherService;
    Logger logger = LogManager.getLogger(this.getClass());


    @GetMapping("/voucher")
    public String voucherSelectAll(VoucherDTO dto, Model m){

        int voucherCount = voucherService.voucherCount(dto);
        Paging paging = new Paging();
        paging.setCri(dto);
        logger.info("asdsadadas"+ dto.getPage());
        paging.setTotalCount(voucherCount);
        logger.info("asdsadadas"+ dto.getPage());
        List<VoucherDTO> list = voucherService.voucherSelectAll(dto);
        List<VoucherDTO> listname = voucherService.sportsclassName();

        List<String> cityname = new ArrayList();
        List<String> itemname = new ArrayList();

        for(int i = 0; i < listname.size(); i++){
            String cityN = listname.get(i).getCtprvn_nm();
            String itemN = listname.get(i).getMain_item_nm();
            cityname.add(cityN);
            itemname.add(itemN);
        }

        cityname = cityname.stream().distinct().collect(Collectors.toList());
        itemname = itemname.stream().distinct().collect(Collectors.toList());

        logger.info("asdsadadas"+ cityname);
        logger.info("asdsadadas"+ itemname);

        m.addAttribute("cityname", cityname);
        m.addAttribute("itemname",itemname);
        m.addAttribute("list",list);
        m.addAttribute("paging", paging);

        logger.info("asdsadfltmxmadas"+ list);
        logger.info("asdsavpdlwlddadas"+ paging);

        return "inVoucher";
    }

    @GetMapping("/voucherselect")
    public String voucherSelect(VoucherDTO dto, Model m){

        List<VoucherDTO> listS = voucherService.voucherSelect(dto);

        m.addAttribute("listS",listS);

        return "inVoucherSelect";
    }

    // 검색
    @GetMapping("/voucherSearch")
    public String voucherSearch(Model m, VoucherDTO dto) {
        logger.info("voucherSearch 진입 : ");
        logger.info(dto.getKeyword());
        logger.info(dto.getType());
        String keyW = dto.getKeyword();

        int voucherCount = voucherService.voucherCount(dto);
        logger.info(voucherCount);

        int a = dto.getPage();
        logger.info("controller >>> " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(voucherCount);
        logger.info(dto.getPage());

        List<VoucherDTO> list = null;
        logger.info("list : " + list);

        list = voucherService.voucherSearch(dto);

        m.addAttribute("keyW",keyW);
        m.addAttribute("list", list);
        m.addAttribute("paging", paging);

        return "voucherSearch";
    }
    @GetMapping("vouchername")
    @ResponseBody
    public Map<String, Object> vouchername(VoucherDTO dto, Model m){
        Map<String, Object> responseData = new HashMap<>();
        List<VoucherDTO> list = new ArrayList<>();
        try {
            String ctnm = dto.getCtprvn_nm();
            String itnm = dto.getMain_item_nm();

            if(ctnm.equals("-")){
                ctnm = null;
                dto.setCtprvn_nm(ctnm);
            }

            if(itnm.equals("-")){
                itnm = null;
                dto.setMain_item_nm(itnm);
            }

            int voucherCount = voucherService.voucherCount(dto);

            Paging paging = new Paging();
            paging.setCri(dto);
            paging.setTotalCount(voucherCount);

            list = voucherService.voucherSelectAll(dto);
            responseData.put("paging", paging);
            responseData.put("list",list);

            logger.info("asdsavpdlwlddadas"+ list);

        }catch(Exception e) {
            logger.info(e);
        }
        return responseData;

    }

}