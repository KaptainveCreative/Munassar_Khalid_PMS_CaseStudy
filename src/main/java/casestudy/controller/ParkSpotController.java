/*
* This controller sets up the search page
* implements methods from DAO to find parking spots with "available" status and search for parking spots in a given state
* If spot not in state given, show a message to user
* */
package casestudy.controller;

import casestudy.database.DAO.ParkingSpotDAO;
import casestudy.database.DAO.UserDAO;
import casestudy.database.Entity.ParkingSpot;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ParkSpotController {


    @Autowired
    private ParkingSpotDAO parkingSpotDAO;


    @GetMapping("/park/Search")
    public ModelAndView search(String state) {
        ModelAndView response = new ModelAndView();

        response.setViewName("park/Search");

        List<ParkingSpot> allparkingSpots = parkingSpotDAO.findByStatus("Available"); // When you reserve a spot, the status changes to not available
        response.addObject("allparkingSpots", allparkingSpots);


        List<ParkingSpot> parkingSpots = parkingSpotDAO.findByStateIgnoreCase(state); // finding spots by state


        if (state != null && parkingSpots.isEmpty()) {

            String error = "Sorry! We are currently not operating in " + state;
            response.addObject("error", error);
            return response;
        }


        response.addObject("parkingSpots", parkingSpots);


        response.setViewName("park/Search");

        return response;
    }


}
