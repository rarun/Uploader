package gov.dhs.uscis.efile.domain;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Evidence {

    @NotNull
    @Size(max = 128)
    private String filepath;

    @NotNull
    private long filesize;

    @NotNull
    private String contentType;

    @NotNull
    @ManyToOne
    private Applicant applicant;
}
