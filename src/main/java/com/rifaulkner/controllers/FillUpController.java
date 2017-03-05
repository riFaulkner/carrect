package com.rifaulkner.controllers;

import com.rifaulkner.fillUp.FillUp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;



/**
 * Created by richard on 3/4/17.
 */

@Controller
public class FillUpController {

    @GetMapping("/form")
    public String fillUpForm(Model model) {
        model.addAttribute("form", new FillUp());
        return "greeting";
    }

    @PostMapping("/form")
    public String greetingSubmit(@ModelAttribute FillUp form, Model model) {
        System.out.println("PRINTING2");
        System.out.println("ID = " + form.getId());
        System.out.println("Message = " + form.getContent());
        model.addAttribute("form", form);
        return "result";
    }

}
