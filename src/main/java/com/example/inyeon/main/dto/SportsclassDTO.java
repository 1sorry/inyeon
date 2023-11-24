package com.example.inyeon.main.dto;

import com.example.inyeon.paging.Criteria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SportsclassDTO extends Criteria {
    private String item_nm;
    private String subitem_nm;
    private String ctprvn_nm;
    private String signgu_nm;
    private String clssrm_nm;
    private String trobl_ty_nm;
    private String oper_time_cn;
    private String clssrm_intrcn_cn;
    private String rcrit_pd;
    private String oper_pd;
    private String ctprvn_cd;

    // 검색
    private String keyword;
    private String type;
}
