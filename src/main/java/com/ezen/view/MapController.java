package com.ezen.view;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.location.Location;
import com.ezen.biz.service.MapService;


@Controller
public class MapController {

  @Autowired
  private MapService mapService;

  @GetMapping("/map")
  public String mapView() {
    
    return "member/map";
  }
  
  @PostMapping(value="/map", produces="application/json; charset=UTF-8")
  @ResponseBody
  public ArrayList<Location> mapAction(Model model) {
    ArrayList<Location> locations = mapService.getAllLocations();
    model.addAttribute("locations", locations);
    return locations;
  }
}