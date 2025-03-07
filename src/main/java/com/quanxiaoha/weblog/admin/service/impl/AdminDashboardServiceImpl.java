package com.quanxiaoha.weblog.admin.service.impl;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.quanxiaoha.weblog.admin.dao.AdminArticleDao;
import com.quanxiaoha.weblog.admin.dao.AdminCategoryDao;
import com.quanxiaoha.weblog.admin.dao.AdminTagDao;
import com.quanxiaoha.weblog.admin.dao.AdminStatisticsArticlePVDao;
import com.quanxiaoha.weblog.admin.model.vo.dashboard.QueryDashboardArticleStatisticsRspVO;
import com.quanxiaoha.weblog.admin.model.vo.dashboard.QueryDashboardPVStatisticsRspVO;
import com.quanxiaoha.weblog.admin.service.AdminDashboardService;
import com.quanxiaoha.weblog.common.Response;
import com.quanxiaoha.weblog.common.constant.Constants;
import com.quanxiaoha.weblog.common.domain.dos.ArticleCountDO;
import com.quanxiaoha.weblog.common.domain.dos.QueryArticleTypeRspDO;
import com.quanxiaoha.weblog.common.domain.dos.StatisticsArticlePVDO;
import com.quanxiaoha.weblog.common.domain.dos.VisitorAreaRspDO;
import com.quanxiaoha.weblog.common.domain.mapper.ArticleMapper;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author: XXX
 * @url: www.XXX.com.com
 * @date: 2024-04-17 12:08
 * @description: TODO
 **/
@Service
@Slf4j
public class AdminDashboardServiceImpl implements AdminDashboardService {

    @Autowired
    private AdminArticleDao articleDao;
    @Autowired
    private AdminCategoryDao categoryDao;
    @Autowired
    private AdminTagDao tagDao;
    @Autowired
    private AdminStatisticsArticlePVDao statisticsArticlePVDao;
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Response queryDashboardArticleStatisticsInfo() {
        Long articleTotalCount = articleDao.selectTotalCount();
        Long categoryTotalCount = categoryDao.selectTotalCount();
        Long tagTotalCount = tagDao.selectTotalCount();

        // 总浏览量
        List<StatisticsArticlePVDO> pvCounts = statisticsArticlePVDao.selectAllPVCount();
        Long pvTotalCount = pvCounts.stream().mapToLong(StatisticsArticlePVDO::getPvCount).sum();

        QueryDashboardArticleStatisticsRspVO queryDashboardArticleStatisticsRspVO = QueryDashboardArticleStatisticsRspVO.builder()
                .articleTotalCount(Objects.isNull(articleTotalCount) ? 0 : articleTotalCount)
                .categoryTotalCount(Objects.isNull(categoryTotalCount) ? 0 : categoryTotalCount)
                .tagTotalCount(Objects.isNull(tagTotalCount) ? 0 : tagTotalCount)
                .pvTotalCount(pvTotalCount)
                .build();

        return Response.success(queryDashboardArticleStatisticsRspVO);
    }

    @Override
    public Response queryDashboardPublishArticleStatisticsInfo() {
        // 年初
        int currYear = LocalDate.now().getYear();
        LocalDate firstDayOfYear = LocalDate.of(currYear, 1, 1);
        String firstDayStr = firstDayOfYear.format(Constants.DATE_TIME_FORMATTER);

        // 当日
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String currDayStr = LocalDateTime.now().format(dateTimeFormatter);

        List<ArticleCountDO> articleCountDOS = articleDao.selectArticleCount(firstDayStr, currDayStr);

        Map<String, Long> map = null;
        if (!CollectionUtils.isEmpty(articleCountDOS)) {
            Map<String, Long> dateCountMap = articleCountDOS.stream().collect(Collectors.toMap(ArticleCountDO::getDate, ArticleCountDO::getCount));

            map = Maps.newLinkedHashMap();

            LocalDate currDate = LocalDate.now();
            for (LocalDate date = firstDayOfYear; date.isBefore(currDate) || date.isEqual(currDate); date.plusDays(1)) {
                String key = date.format(Constants.DATE_TIME_FORMATTER);
                map.put(key, Objects.isNull(dateCountMap.get(key)) ? 0L : dateCountMap.get(key));
                date = date.plusDays(1);
            }
        }

        return Response.success(map);
    }

    @Override
    public Response queryDashboardPVStatisticsInfo() {
        List<StatisticsArticlePVDO> statisticsArticlePVDOS = statisticsArticlePVDao.selectLatestWeekRecords();

        QueryDashboardPVStatisticsRspVO queryDashboardPVStatisticsRspVO = null;

        List<String> pvDates = Lists.newArrayList();
        List<Long> pvCounts = Lists.newArrayList();

        LocalDate minus7date = LocalDate.now().minusDays(7);

        for (int i = 1; i < 8; i++) {
            LocalDate plusDate = minus7date.plusDays(i);

            String dateStr = plusDate.format(DateTimeFormatter.ofPattern("MM-dd"));

            pvDates.add(dateStr);
        }

        queryDashboardPVStatisticsRspVO = QueryDashboardPVStatisticsRspVO.builder()
                .pvDates(pvDates)
                .build();

        if (!CollectionUtils.isEmpty(statisticsArticlePVDOS)) {
            DateFormat dateFormat = new SimpleDateFormat("MM-dd");
            Map<String, Long> pvDateCountMap = statisticsArticlePVDOS.stream().collect(Collectors.toMap(p -> {
                Date date = p.getPvDate();
                return dateFormat.format(date);
            }, StatisticsArticlePVDO::getPvCount));

            pvDates.forEach(pvDate -> {
                pvCounts.add(Objects.isNull(pvDateCountMap.get(pvDate)) ? 0 : pvDateCountMap.get(pvDate));
            });

            queryDashboardPVStatisticsRspVO.setPvCounts(pvCounts);
        }

        return Response.success(queryDashboardPVStatisticsRspVO);
    }

    @Override
    public Response queryDashboardArticleTypeStatisticsInfo() {
        List<QueryArticleTypeRspDO> list = articleMapper.selectArticleType();
        return Response.success(list);
    }

    @Override
    public Response queryDashboardVisitorAreaStatistics() {

        List<String> list = articleMapper.selectVisitorArea();
        String filePath = "D:\\mylog\\weblog-springboot\\weblog-web\\src\\main\\resources\\ip2region.xdb";
        List<String> provinceList = Lists.newArrayList();
        for(String item : list) {
            String ip =item;
            try {
                Searcher searcher = Searcher.newWithFileOnly(filePath);
                String region = searcher.search(ip);
                String[] parts = region.split("\\|");
                String province = parts[2];
                if(province.equals("0")) {
                    province = "内网";
                }
                provinceList.add(province);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        Map<String, Integer> provinceMap = new HashMap<>();
        for (String province : provinceList) {
                provinceMap.put(province, provinceMap.getOrDefault(province, 0) + 1);
            }
        List<VisitorAreaRspDO> resultList = Lists.newArrayList();

        // 在循环内部创建新的 VisitorAreaRspDO 对象
        provinceMap.forEach((provinceName, visitorNum) -> {
            VisitorAreaRspDO visitorAreaRspDO = new VisitorAreaRspDO(provinceName, visitorNum);
            resultList.add(visitorAreaRspDO);
        });

        return Response.success(resultList);

    }
}

