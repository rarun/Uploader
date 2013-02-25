package gov.dhs.uscis.efile.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findApplicantsByEmailAndPasswordEquals" })
public class Applicant {

    @NotNull
    private String fname;

    @NotNull
    private String lname;

    @Min(9L)
    private Integer ssn;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date dob;

    @NotNull
    private String email;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Evidence> evidence = new HashSet<Evidence>();

    @NotNull
    @Size(min = 6, max = 10)
    private String password;
}
