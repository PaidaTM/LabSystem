package controller;


import model.TDevice;
import model.TLabUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DeviceService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/devicemanage")
public class DeviceController {

        @Autowired
        private DeviceService deviceService;

        @RequestMapping(value="/save")
        public String saveDevice(TDevice device, Model model, HttpServletRequest req){
            HttpSession session = req.getSession(); //get session object
            TLabUser loginUser = (TLabUser)session.getAttribute("loginUser");

            //check if Device's data has no error
            String errMsg = "";
            if(device.getName()==null || device.getName().equals("")){
                errMsg = "Device name can not empty!";
            }else if(loginUser==null || loginUser.getUtid()!=1){
                errMsg = "You are not log in or you are not laboratory administrator!";
            }
            if(!errMsg.equals("")){
                model.addAttribute("errMsg",errMsg);
                model.addAttribute("backUrl","../view/website/editequipment.jsp");
                return "/website/errors";
            }
            //save new Device information to database
//        equipment.setUserid(loginUser.getUserid());


            if(device.getDvcid()==null || device.getDvcid()==0){
                //Add new equipment process

                if (device.getLabid()==1){
                    device.setLabname("Chemistry Laboratory");
                }else if(device.getLabid()==2){
                    device.setLabname("Physic Laboratory");
                }

                if(deviceService.addDevice(device)>0){  //success
                    return "redirect:/view/website/devicelist.jsp";
                }else{ //fail
                    errMsg = "There are some error occured in database!";
                    model.addAttribute("errMsg",errMsg);
                    model.addAttribute("backUrl","../view/website/editequipment.jsp");
                    return "/website/errors";
                }
            }else{
                //update existence Equipment information
                if(deviceService.updateDevice(device)){ //success
                    return "redirect:/view/website/devicelist.jsp";
                }else{ //fail
                    errMsg = "There are some error occured in database!";
                    model.addAttribute("errMsg",errMsg);
                    model.addAttribute("backUrl","../view/website/editequipment.jsp");
                    return "/website/errorrs";
                }
            }
        }

        @RequestMapping(value="/delete")
        public String deleteDevice(int dvcid, Model model){
            if(deviceService.deleteDevice(dvcid)){
                return "redirect:/view/website/devicelist.jsp";
            }else{ //fail
                String errMsg = "There are some error occured in database!";
                model.addAttribute("errMsg",errMsg);
                model.addAttribute("backUrl","../view/website/equipmentmanagement.jsp");
                return "/website/errors";
            }
        }

    }

