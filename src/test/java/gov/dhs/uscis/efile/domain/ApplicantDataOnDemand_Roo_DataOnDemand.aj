// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package gov.dhs.uscis.efile.domain;

import gov.dhs.uscis.efile.domain.Applicant;
import gov.dhs.uscis.efile.domain.ApplicantDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ApplicantDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ApplicantDataOnDemand: @Component;
    
    private Random ApplicantDataOnDemand.rnd = new SecureRandom();
    
    private List<Applicant> ApplicantDataOnDemand.data;
    
    public Applicant ApplicantDataOnDemand.getNewTransientApplicant(int index) {
        Applicant obj = new Applicant();
        setDob(obj, index);
        setEmail(obj, index);
        setFname(obj, index);
        setLname(obj, index);
        setPassword(obj, index);
        setSsn(obj, index);
        return obj;
    }
    
    public void ApplicantDataOnDemand.setDob(Applicant obj, int index) {
        Date dob = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDob(dob);
    }
    
    public void ApplicantDataOnDemand.setEmail(Applicant obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void ApplicantDataOnDemand.setFname(Applicant obj, int index) {
        String fname = "fname_" + index;
        obj.setFname(fname);
    }
    
    public void ApplicantDataOnDemand.setLname(Applicant obj, int index) {
        String lname = "lname_" + index;
        obj.setLname(lname);
    }
    
    public void ApplicantDataOnDemand.setPassword(Applicant obj, int index) {
        String password = "password_" + index;
        if (password.length() > 10) {
            password = password.substring(0, 10);
        }
        obj.setPassword(password);
    }
    
    public void ApplicantDataOnDemand.setSsn(Applicant obj, int index) {
        Integer ssn = new Integer(index);
        if (ssn < 9) {
            ssn = 9;
        }
        obj.setSsn(ssn);
    }
    
    public Applicant ApplicantDataOnDemand.getSpecificApplicant(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Applicant obj = data.get(index);
        Long id = obj.getId();
        return Applicant.findApplicant(id);
    }
    
    public Applicant ApplicantDataOnDemand.getRandomApplicant() {
        init();
        Applicant obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Applicant.findApplicant(id);
    }
    
    public boolean ApplicantDataOnDemand.modifyApplicant(Applicant obj) {
        return false;
    }
    
    public void ApplicantDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Applicant.findApplicantEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Applicant' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Applicant>();
        for (int i = 0; i < 10; i++) {
            Applicant obj = getNewTransientApplicant(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
