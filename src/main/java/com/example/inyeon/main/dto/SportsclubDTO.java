package com.example.inyeon.main.dto;

import com.example.inyeon.paging.Criteria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SportsclubDTO extends Criteria {

    private String item_nm;
    private String subitem_nm;
    private String ctprvn_nm;
    private String signgu_nm;
    private String club_nm;
    private String trobl_ty_nm;
    private String oper_time_cn;
    private String club_intrcn_cn;

    // 검색
    private String keyword;
    private String type;
}
