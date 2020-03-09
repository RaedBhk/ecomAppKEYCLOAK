package org.rbhk.ecomapp.controller;

import org.keycloak.adapters.AdapterDeploymentContext;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.spi.HttpFacade;
import org.keycloak.adapters.springsecurity.facade.SimpleHttpFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SecurityController {

    @Autowired
    private AdapterDeploymentContext adapterDeploymentContext;
    @GetMapping("/logout")
    public String logout(HttpServletRequest httpServletRequest) throws Exception{
        httpServletRequest.logout();
        return "redirect:/";
    }

    @GetMapping("/updatePassword")
    public String updatePassword(HttpServletRequest request, HttpServletResponse response, RedirectAttributes attributes){
        HttpFacade httpFacade = new SimpleHttpFacade(request, response);
        KeycloakDeployment keycloakDeployment = adapterDeploymentContext.resolveDeployment(httpFacade);
        attributes.addAttribute("referrer", keycloakDeployment.getResourceName());
        return "redirect:" + keycloakDeployment.getAccountUrl() + "/password";
    }

}
