// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.team28.web;

import ee.itcollege.i377.team28.entities.PIIRILOIK;
import ee.itcollege.i377.team28.entities.VAHTKOND;
import ee.itcollege.i377.team28.entities.VAHTKOND_PIIRILOIGUL;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VAHTKOND_PIIRILOIGULController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VAHTKOND_PIIRILOIGULController.create(@Valid VAHTKOND_PIIRILOIGUL VAHTKOND_PIIRILOIGUL, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("VAHTKOND_PIIRILOIGUL", VAHTKOND_PIIRILOIGUL);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkond_piiriloiguls/create";
        }
        uiModel.asMap().clear();
        VAHTKOND_PIIRILOIGUL.persist();
        return "redirect:/vahtkond_piiriloiguls/" + encodeUrlPathSegment(VAHTKOND_PIIRILOIGUL.getVahtkond_piiriloigul_id().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VAHTKOND_PIIRILOIGULController.createForm(Model uiModel) {
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL", new VAHTKOND_PIIRILOIGUL());
        addDateTimeFormatPatterns(uiModel);
        return "vahtkond_piiriloiguls/create";
    }
    
    @RequestMapping(value = "/{vahtkond_piiriloigul_id}", method = RequestMethod.GET)
    public String VAHTKOND_PIIRILOIGULController.show(@PathVariable("vahtkond_piiriloigul_id") Long vahtkond_piiriloigul_id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vahtkond_piiriloigul", VAHTKOND_PIIRILOIGUL.findVAHTKOND_PIIRILOIGUL(vahtkond_piiriloigul_id));
        uiModel.addAttribute("itemId", vahtkond_piiriloigul_id);
        return "vahtkond_piiriloiguls/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VAHTKOND_PIIRILOIGULController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vahtkond_piiriloiguls", VAHTKOND_PIIRILOIGUL.findVAHTKOND_PIIRILOIGULEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) VAHTKOND_PIIRILOIGUL.countVAHTKOND_PIIRILOIGULs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vahtkond_piiriloiguls", VAHTKOND_PIIRILOIGUL.findAllVAHTKOND_PIIRILOIGULs());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vahtkond_piiriloiguls/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VAHTKOND_PIIRILOIGULController.update(@Valid VAHTKOND_PIIRILOIGUL VAHTKOND_PIIRILOIGUL, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("VAHTKOND_PIIRILOIGUL", VAHTKOND_PIIRILOIGUL);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkond_piiriloiguls/update";
        }
        uiModel.asMap().clear();
        VAHTKOND_PIIRILOIGUL.merge();
        return "redirect:/vahtkond_piiriloiguls/" + encodeUrlPathSegment(VAHTKOND_PIIRILOIGUL.getVahtkond_piiriloigul_id().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{vahtkond_piiriloigul_id}", params = "form", method = RequestMethod.GET)
    public String VAHTKOND_PIIRILOIGULController.updateForm(@PathVariable("vahtkond_piiriloigul_id") Long vahtkond_piiriloigul_id, Model uiModel) {
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL", VAHTKOND_PIIRILOIGUL.findVAHTKOND_PIIRILOIGUL(vahtkond_piiriloigul_id));
        addDateTimeFormatPatterns(uiModel);
        return "vahtkond_piiriloiguls/update";
    }
    
    @RequestMapping(value = "/{vahtkond_piiriloigul_id}", method = RequestMethod.DELETE)
    public String VAHTKOND_PIIRILOIGULController.delete(@PathVariable("vahtkond_piiriloigul_id") Long vahtkond_piiriloigul_id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VAHTKOND_PIIRILOIGUL.findVAHTKOND_PIIRILOIGUL(vahtkond_piiriloigul_id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vahtkond_piiriloiguls";
    }
    
    @ModelAttribute("piiriloiks")
    public Collection<PIIRILOIK> VAHTKOND_PIIRILOIGULController.populatePIIRILOIKS() {
        return PIIRILOIK.findAllPIIRILOIKS();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<VAHTKOND> VAHTKOND_PIIRILOIGULController.populateVAHTKONDS() {
        return VAHTKOND.findAllVAHTKONDS();
    }
    
    @ModelAttribute("vahtkond_piiriloiguls")
    public Collection<VAHTKOND_PIIRILOIGUL> VAHTKOND_PIIRILOIGULController.populateVAHTKOND_PIIRILOIGULs() {
        return VAHTKOND_PIIRILOIGUL.findAllVAHTKOND_PIIRILOIGULs();
    }
    
    void VAHTKOND_PIIRILOIGULController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("VAHTKOND_PIIRILOIGUL_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VAHTKOND_PIIRILOIGULController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
