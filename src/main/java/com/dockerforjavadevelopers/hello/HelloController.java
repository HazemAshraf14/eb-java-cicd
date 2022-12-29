package com.dockerforjavadevelopers.hello;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {

    @Value("${version}")
    private String version;
    @RequestMapping("/")
    public String index() {
        return "Service is fine.";
    }
    @RequestMapping("/version")
    public String getVersion() {
        return version;
    }

}
