package gov.dhs.uscis.efile.web;

import gov.dhs.uscis.efile.domain.Evidence;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RequestMapping("/evidences")
@Controller
@RooWebScaffold(path = "evidences", formBackingObject = Evidence.class)
public class EvidenceController {
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid Evidence evidence, BindingResult bindingResult, Model uiModel,
	       @RequestParam("content") CommonsMultipartFile content,
	       HttpServletRequest httpServletRequest) {
	   File dest = new File("C:/java/" + content.getOriginalFilename());
	   try {
	      content.transferTo(dest);
	      evidence.setFilesize(content.getSize());
	      evidence.setFilepath(dest.getAbsolutePath());
	      evidence.setContentType(content.getContentType());
	   } catch (Exception e) {
	      e.printStackTrace();
	      return "evidences/create";
	   }

	   uiModel.asMap().clear();
	   evidence.persist();
	   return "redirect:/evidences/" + encodeUrlPathSegment(evidence.getId().toString(),
	      httpServletRequest);
	}

}
