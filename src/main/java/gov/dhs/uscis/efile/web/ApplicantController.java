package gov.dhs.uscis.efile.web;

import gov.dhs.uscis.efile.domain.Applicant;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/applicants")
@Controller
@RooWebScaffold(path = "applicants", formBackingObject = Applicant.class)
public class ApplicantController {
}
