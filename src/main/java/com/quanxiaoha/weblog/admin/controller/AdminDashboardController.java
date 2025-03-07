package com.quanxiaoha.weblog.admin.controller;

import com.quanxiaoha.weblog.admin.model.vo.blogsetting.UpdateBlogSettingReqVO;
import com.quanxiaoha.weblog.admin.service.AdminBlogSettingService;
import com.quanxiaoha.weblog.admin.service.AdminDashboardService;
import com.quanxiaoha.weblog.common.Response;
import com.quanxiaoha.weblog.common.aspect.ApiOperationLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author: XXX
 * @url: www.XXX.com.com
 * @date: 2024-04-19 16:06
 * @description: 后台首页 - 仪表盘
 **/
@RestController
@RequestMapping("/admin/dashboard")
public class AdminDashboardController {

    @Autowired
    private AdminDashboardService dashboardService;

    @PostMapping("/article/statistics")
    @ApiOperationLog(description = "获取后台仪表盘文章统计信息")
    public Response queryDashboardArticleStatisticsInfo() {
        return dashboardService.queryDashboardArticleStatisticsInfo();
    }

    @PostMapping("/publishArticle/statistics")
    @ApiOperationLog(description = "获取后台仪表盘文章发布 echat 统计信息")
    public Response queryDashboardPublishArticleStatisticsInfo() {
        return dashboardService.queryDashboardPublishArticleStatisticsInfo();
    }

    @PostMapping("/pv/statistics")
    @ApiOperationLog(description = "获取后台仪表盘 PV echat 统计信息")
    public Response queryDashboardPVStatisticsInfo() {
        return dashboardService.queryDashboardPVStatisticsInfo();
    }

    @GetMapping("/articleType/statistics")
    @ApiOperationLog(description = "获取后台仪表盘文章类型点击热度图")
    public Response queryDashboardArticleTypeStatistics() {return dashboardService.queryDashboardArticleTypeStatisticsInfo();}

    @GetMapping("/visitorArea/statistics")
    @ApiOperationLog(description = "获取后台仪表盘访客地域分布图")
    public Response queryDashboardVisitorAreaStatistics() {return dashboardService.queryDashboardVisitorAreaStatistics();}
}
