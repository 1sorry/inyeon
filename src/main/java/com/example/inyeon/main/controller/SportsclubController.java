package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.SportsclassDTO;
import com.example.inyeon.main.dto.SportsclubDTO;
import com.example.inyeon.main.service.SportsclubService;
import com.example.inyeon.paging.Paging;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class SportsclubController {

    Logger logger = LogManager.getLogger(this.getClass());
    private final SportsclubService sportsclubService;

    // 전체 조회
    @GetMapping("/sportsclub")
    public String sportsclubSelectAll(SportsclubDTO dto, Model m){

        int sportsclubCount = sportsclubService.sportsclubCount(dto);
        logger.info(sportsclubCount);

        int a = dto.getPage();
        logger.info("controller >>> " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclubCount);
        logger.info(dto.getPage());
        List<SportsclubDTO> sportsclubselectAll = sportsclubService.sportsclubSelectAll(dto);
        List<SportsclubDTO> listname = sportsclubService.sportsclubName();

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
        m.addAttribute("itemname", itemname);
        m.addAttribute("sportsclub", sportsclubselectAll);
        m.addAttribute("paging", paging);

        return "sportsclubSelectAll";
    }

    @GetMapping("sportsclubcityname")
    @ResponseBody
    public Map<String, Object> sportsclubcityname(SportsclubDTO dto, Model m){
        Map<String, Object> responseData = new HashMap<>();
        List<SportsclubDTO> list = new ArrayList<>();
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

            int sportsclubCount = sportsclubService.sportsclubCount(dto);
            logger.info(sportsclubCount);

            logger.info(dto.getCtprvn_nm());

            Paging paging = new Paging();
            paging.setCri(dto);
            paging.setTotalCount(sportsclubCount);

            logger.info(dto.getCtprvn_nm());
            logger.info(dto.getItem_nm());


            list = sportsclubService.sportsclubSelectAll(dto);
            responseData.put("paging", paging);
            responseData.put("list",list);

        }catch(Exception e) {
            logger.info(e);
        }

        return responseData;
    }

    // 조건 조회
    @GetMapping("/sportsclubSelect")
    public String sportsclubSelect(SportsclubDTO dto, Model m) {
        logger.info("sportsclubSelect 진입 : ");
        logger.info(dto.getClub_nm());

        List<SportsclubDTO> list = sportsclubService.sportsclubSelect(dto);
        logger.info("list : " + list);
        logger.info("list.size()" + list.size());

        if (list.size() == 1) {
            logger.info("sportsclubSelect list.size() : " + list.size());

            m.addAttribute("list", list);
            return "sportsclubSelect";
        }else{
            logger.info("실패");
        }
        return "sportsclubSelectAll";
    }

    // 검색
    @GetMapping("/clubSearch")
    public String clubSearch(Model m, SportsclubDTO dto) {
        logger.info("clubSearch 진입 : ");
        logger.info(dto.getKeyword());
        logger.info(dto.getType());
        String keyW = dto.getKeyword();
        int sportsclubCount = sportsclubService.sportsclubCount(dto);
        logger.info(sportsclubCount);

        int a = dto.getPage();
        logger.info("controller >>> " + a);

        Paging paging = new Paging();
        paging.setCri(dto);
        paging.setTotalCount(sportsclubCount);
        logger.info(dto.getPage());

        List<SportsclubDTO> list = null;
        logger.info("list : " + list);

        list = sportsclubService.clubSearch(dto);

        m.addAttribute("keyW",keyW);
        m.addAttribute("list", list);
        m.addAttribute("paging", paging);

        return "clubSearch";
    }
}
