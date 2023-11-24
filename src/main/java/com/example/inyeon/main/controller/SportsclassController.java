package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.SportsclubDTO;
import com.example.inyeon.main.service.SportsclassService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.inyeon.paging.Paging;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.http.HttpRequest;
import java.util.*;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Controller
public class SportsclassController {

    private final SportsclassService sportsclassService;
    Logger logger = LogManager.getLogger(this.getClass());

    @GetMapping("/sportsclass")
    public String sportsclassSelectAll(SportsclassDTO dto, Model m){
        logger.info(dto.getCtprvn_nm());
        logger.info(dto.getItem_nm());
        String ctnm = dto.getCtprvn_nm();
        String itnm = dto.getItem_nm();

        logger.info(ctnm);
        logger.info(itnm);

        int sportsclassCount = sportsclassService.sportsclassCount(dto);
        logger.info(sportsclassCount);

        logger.info(dto.getCtprvn_nm());
        logger.info(dto.getItem_nm());

        int a = dto.getPage();
        logger.info("controller - > " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclassCount);
        logger.info(dto.getPage());
        List<SportsclassDTO> list = sportsclassService.sportsclassSelectAll(dto);
        List<SportsclassDTO> listname = sportsclassService.sportsclassName();

        List<String> cityname = new ArrayList();
        List<String> itemname = new ArrayList();

        for(int i = 0; i < listname.size(); i++){
            String cityN = listname.get(i).getCtprvn_nm();
            String itemN = listname.get(i).getItem_nm();
            cityname.add(cityN);
            itemname.add(itemN);
        }

        cityname = cityname.stream().distinct().collect(Collectors.toList());
        itemname = itemname.stream().distinct().collect(Collectors.toList());

        m.addAttribute("cityname", cityname);
        m.addAttribute("itemname",itemname);
        m.addAttribute("list",list);
        m.addAttribute("paging", paging);

        return "sportsclassView";
    };
    @GetMapping("sportsclasscityname")
    @ResponseBody
    public Map<String, Object> sportsclasscityname(SportsclassDTO dto, Model m){
        Map<String, Object> responseData = new HashMap<>();
        List<SportsclassDTO> list = new ArrayList<>();
        try {
            logger.info(dto.getCtprvn_nm());
            logger.info(dto.getItem_nm());

            String ctnm = dto.getCtprvn_nm();
            String itnm = dto.getItem_nm();

            if(ctnm.equals("-")){
                ctnm = null;
                dto.setCtprvn_nm(ctnm);
            }

            if(itnm.equals("-")){
                itnm = null;
                dto.setItem_nm(itnm);
            }

            int sportsclassCount = sportsclassService.sportsclassCount(dto);
            logger.info(sportsclassCount);

            logger.info(dto.getCtprvn_nm());

            Paging paging = new Paging();
            paging.setCri(dto);
            paging.setTotalCount(sportsclassCount);

            logger.info(dto.getCtprvn_nm());
            logger.info(dto.getItem_nm());


            list = sportsclassService.sportsclassSelectAll(dto);
            responseData.put("paging", paging);
            responseData.put("list",list);

        }catch(Exception e) {
            logger.info(e);
        }

        return responseData;
    }

    @GetMapping("/sportsclassselect")
    public String sportsclassSelect(SportsclassDTO dto, Model m){

        List<SportsclassDTO> list = sportsclassService.sportsclassSelect(dto);

        m.addAttribute("list", list);

        return "sportsclassSelect";
    }

    // 검색
    @GetMapping("/classSearch")
    public String classSearch(Model m, SportsclassDTO dto) {
        logger.info("classSearch 진입 : ");
        logger.info(dto.getKeyword());
        logger.info(dto.getType());
        String keyW = dto.getKeyword();

        int sportsclassCount = sportsclassService.sportsclassCount(dto);
        logger.info(sportsclassCount);

        int a = dto.getPage();
        logger.info("controller >>> " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclassCount);
        logger.info(dto.getPage());

        List<SportsclassDTO> list = null;
        logger.info("list : " + list);

        list = sportsclassService.classSearch(dto);

        m.addAttribute("keyW",keyW);
        m.addAttribute("list", list);
        m.addAttribute("paging", paging);

        return "classSearch";
    }
}
