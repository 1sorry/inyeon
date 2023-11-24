package com.example.inyeon.main.dto;

import com.example.inyeon.paging.Criteria;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoucherDTO extends Criteria {
    private String ctprvn_cd;
    private String ctprvn_nm;
    private String signgu_cd;
    private String signgu_nm;
    private String fclty_nm;
    private String rprsntv_tel_no;
    private String zip_no;
    private String fclty_addr;
    private String fclty_detail_addr;
    private String main_item_cd;
    private String main_item_nm;
    private String fclty_crdnt_lo;
    private String fclty_crdnt_la;
    private String course_flag_cd;
    private String course_item_nm;
    private String course_nm;

    // 검색
    private String keyword;
    private String type;

}
