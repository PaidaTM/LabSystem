package controller;

import model.TEquipment;
import model.TLabUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.EquipmentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/equipmentmanage")
public class EquipmentController {
    @Autowired
    private EquipmentService equipmentService;

    @RequestMapping(value="/save")
    public String saveEquipment(TEquipment equipment, Model model, HttpServletRequest req){
        HttpSession session = req.getSession(); //get session object
        TLabUser loginUser = (TLabUser)session.getAttribute("loginUser");

        //check if Equipment's data has no error
        String errMsg = "";
        if(equipment.getEquipmentname()==null || equipment.getEquipmentname().equals("")){
            errMsg = "Equipment name can not empty!";
        }else if(loginUser==null || loginUser.getUtid()!=1){
            errMsg = "You are not log in or you are not laboratory administrator!";
        }
        if(!errMsg.equals("")){
            model.addAttribute("errMsg",errMsg);
            model.addAttribute("backUrl","../view/website/editequipment.jsp");
            return "/website/errors";
        }
        //save new equipment information to database
//        equipment.setUserid(loginUser.getUserid());
        if (equipment.getLabid()==1){
            equipment.setLabname("Chemistry Laboratory");
        }else if(equipment.getLabid()==2){
            equipment.setLabname("Physic Laboratory");
        }
        if(equipment.getEqid()==null || equipment.getEqid()==0){
            //Add new equipment process
            if(equipmentService.addEquipment(equipment)>0){  //success
                return "redirect:/view/website/beikemain.jsp";
            }else{ //fail
                errMsg = "There are some error occured in database!";
                model.addAttribute("errMsg",errMsg);
                model.addAttribute("backUrl","../view/website/editequipment.jsp");
                return "/website/errors";
            }
        }else{
            //update existence Equipment information
            if(equipmentService.updateEquipment(equipment)==true){ //success
                return "redirect:/view/website/beikemain.jsp";
            }else{ //fail
                errMsg = "There are some error occured in database!";
                model.addAttribute("errMsg",errMsg);
                model.addAttribute("backUrl","../view/website/editequipment.jsp");
                return "/website/errors";
            }
        }
    }

    @RequestMapping(value="/delete")
    public String deleteEquipment(int eqid, Model model){
        if(equipmentService.removeEquipment(eqid)){
            return "redirect:/view/website/equipmentmanagement.jsp";
        }else{ //fail
            String errMsg = "There are some error occured in database!";
            model.addAttribute("errMsg",errMsg);
            model.addAttribute("backUrl","../view/website/equipmentmanagement.jsp");
            return "/website/errors";
        }
    }
}
