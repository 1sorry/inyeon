package com.example.inyeon.main.controller;

import com.example.inyeon.main.dto.TestDTO;
import com.example.inyeon.main.service.TestService;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
//@RequiredArgsConstructor
public class Maintest {

    private Logger logger = LogManager.getLogger(Maintest.class);
    //private final TestService testService;
    @GetMapping("/main")
    public String test(Model model){
        /*
        logger.info("test!!! >>>> ");
        List<TestDTO> selecttest = testService.selectTest();

        //logger.info(">>>> : " + selecttest.toString());

        model.addAttribute("test", selecttest);
        */
        return "mainBody";
    }

}
