package com.quanxiaoha.weblog.common.domain.dos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Administrator
 * @date 2025/1/6
 * @description: 文章热点类型图的实体类
 */
@Data
@Builder
public class QueryArticleTypeRspDO {

    private String name;
    private int count_num;

}
