package controller;

import model.TLabUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.LabUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/usermanage")
public class UserController {
    @Autowired
    private LabUserService labUserService;

    @RequestMapping(value = "/login")
    public String login(String name, String password, Model model,
                        HttpServletRequest req) {
        TLabUser user = labUserService.login(name, password);
        if (user != null && user.getUserid() != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loginUser", user);
            return "redirect:/view/website/beikemain.jsp";  //simple redirect
        } else {
            model.addAttribute("errMsg", "Your user account and password is incorrect!");
            model.addAttribute("backUrl", "../view/website/login.jsp");
            return "redirect:/view/website/errors.jsp";   //dispatch  to  error.jsp
        }
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.removeAttribute("loginUser");
        return "redirect:/view/website/home.jsp";
    }

    @RequestMapping(value = "/addlabstudent")
    public String addMember(TLabUser user, String password2, Model model) {
        String errMsg = "";
        if (user.getName() == null || user.getName().equals("")) {
            errMsg = "User name can not be empty!";
        } else if (user.getPassword() == null || user.getPassword().equals("")) {
            errMsg = "User login password can not be empty!";
        } else if (password2 == null || !password2.equals(user.getPassword())) {
            errMsg = "Password Mismatch!";
        }
        if (!errMsg.equals("")) {
            model.addAttribute("errMsg", errMsg);
            model.addAttribute("backUrl", "../view/website/addlabstudent.jsp");
            return "/website/mg";
        }
        user.setUtid(2);
        if (labUserService.registerUser(user)) {
            //register user successful
            return "redirect:/view/website/home.jsp";
        } else {
            //fail
            model.addAttribute("errMsg", "Website occur some unknow problem, register failure!");
            model.addAttribute("backUrl", "../view/website/addlabstudent.jsp");
            return "/website/mg";
        }
    }

    @RequestMapping(value = "/addadmin")
    public String addAdmin(TLabUser admin, String password2, Model model) {
        String errMsg = "";
        if (admin.getName() == null || admin.getName().equals("")) {
            errMsg = "User name can not be empty!";
        } else if (admin.getPassword() == null || admin.getPassword().equals("")) {
            errMsg = "User login password can not be empty!";
        } else if (password2 == null || !password2.equals(admin.getPassword())) {
            errMsg = "Password Mismatch!";
        }

        if (!errMsg.equals("")) {
            model.addAttribute("errMsg", errMsg);
            model.addAttribute("backUrl", "../view/website/addlabadmin.jsp");
            return "/website/errors";
        }

        if (admin.getUserid() == null || admin.getUserid() == 0) {
            admin.setUtid(1);  //lab administrator's user type's id is 1
            if (labUserService.registerUser(admin)) {
                //register user successful
                return "redirect:/view/website/home.jsp";
            } else {
                //fail
                model.addAttribute("errMsg", "Website occur some unknow problem, register failure!");
                model.addAttribute("backUrl", "../view/website/addlabadmin.jsp");
                return "/website/errors";
            }
        } else {
            if (labUserService.modifyUser(admin)) {

                //success
                return "redirect:/view/website/home.jsp";
            } else { //fail
                errMsg = "There are some error occured in database!";
                model.addAttribute("errMsg", "Website occur some unknow problem, register failure!");
                model.addAttribute("backUrl", "../view/website/addlabadmin.jsp");
                return "/website/errors";
            }
        }
    }
}
