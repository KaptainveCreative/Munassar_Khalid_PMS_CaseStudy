package casestudy.controller;

import casestudy.database.DAO.CompanyDAO;
import casestudy.database.DAO.ParkingSpotDAO;
import casestudy.database.DAO.ReviewDAO;
import casestudy.database.Entity.*;
import casestudy.formbean.ReviewFormBean;
import casestudy.security.UserDetailsServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;


import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ReviewController {

    @Autowired
    private ReviewDAO reviewDAO;

    @Autowired
    private CompanyDAO companyDAO;

    @Autowired
    private ParkingSpotDAO parkingSpotDAO;

    @RequestMapping(value = "/park/Review", method = RequestMethod.GET)
    public ModelAndView review() throws Exception {

        ModelAndView response = new ModelAndView();

        List<Review> allReviews = reviewDAO.findAll();

        List<ParkingSpot> allparkingSpots = parkingSpotDAO.findAll(); // finding All spots


        response.addObject("allparkingSpots", allparkingSpots);
        response.addObject("allReviews", allReviews);

        response.setViewName("/park/Review");

        return response;
    }


    @RequestMapping(value = "/park/ReviewSubmit", method = {RequestMethod.POST, RequestMethod.GET})

    public ModelAndView reviewSubmit(@Valid ReviewFormBean form , BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        log.info(form.toString());

        if (bindingResult.hasErrors()) {
            List<String> errorMessages = new ArrayList<>();
            for (ObjectError error : bindingResult.getAllErrors()) {
                errorMessages.add(error.getDefaultMessage());
                //errors.put(((FieldError) error).getField(), error.getDefaultMessage());
                log.info(((FieldError) error).getField() + " " + error.getDefaultMessage());
            }

            response.addObject("form", form);
            response.addObject("errorMessages", errorMessages);


            response.addObject("bindingResult", bindingResult);

            response.setViewName("login/Review");

            return response;
        }


        Review review = new Review();

        Company company = companyDAO.getById(form.getCompanyId());



        review.setCompany(company);

        review.setCustomerReviews(form.getCustomerReviews());
        review.setCustomerName(form.getCustomerName());

        reviewDAO.save(review);

        response.setViewName("redirect:/park/Review");
        return response;

    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/park/Review/{id}")
    public String deleteReviews(@PathVariable Integer id) {



        Review deleteReview = reviewDAO.getById(id); // finding All spots


        reviewDAO.deleteById(id);


        return "redirect:/park/Review";

    }


}
