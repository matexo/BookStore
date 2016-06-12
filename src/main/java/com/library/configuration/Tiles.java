package com.library.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

/**
 * Created by Matexo on 2016-06-12.
 */
@Configuration
@EnableWebMvc
//@ComponentScan(basePackageClasses = {  ViewController.class, CustomerService.class })
public class Tiles {

    @Bean
    public UrlBasedViewResolver viewResolver() {
        UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
        viewResolver.setViewClass(TilesView.class);
        return viewResolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(new String[] {"WEB-INF/tiles/configuration/tilesConfiguration.xml"});
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }
}
