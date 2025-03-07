package com.quanxiaoha.weblog.common.config;

import com.google.common.eventbus.EventBus;
import com.quanxiaoha.weblog.common.eventbus.EventListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author: XXX
 * @url: www.XXX.com.com
 * @date: 2024-07-01 21:42
 * @description: TODO
 **/
@Configuration
public class EventBusConfig {

    @Autowired
    private EventListener eventListener;

    @Bean
    public EventBus eventBus() {
        EventBus eventBus = new EventBus();
        eventBus.register(eventListener);
        return eventBus;
    }

}
