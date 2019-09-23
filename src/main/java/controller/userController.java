package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Major;
import entity.User;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.userService;
import util.Msg;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class userController {
    @Autowired
    private userService userService;

    /**
     * 通过userid得到user
     * @param userid
     * @return
     */
    @RequestMapping("/getuser")
    @ResponseBody
    public Msg getUser(String userid) {
        User user = userService.queryById(userid);
        System.out.println(user);
        return Msg.success().add("user", user);
    }

    /**
     * 根据权限得到user
     * @param pn
     * @param permissions
     * @return
     */
    @RequestMapping("/getuserAll")
    @ResponseBody
    public Msg queryByPermissions(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Integer permissions) {
        PageHelper.startPage(pn, 7);
        List<User> list = userService.getAllByPermissions(permissions);
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageinfo", pageInfo);
    }

    /**
     * 得到所有user
     * @param pn
     * @return
     */
    @RequestMapping("/getAll")
    @ResponseBody
    public Msg getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 7);
        List<User> list = userService.getAll();
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageinfo", pageInfo);
    }

    /**
     * 登录
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request) {
        User user1 = userService.login(user.getUsername(), user.getPassword());
        System.out.println(user1);
        request.getSession().setAttribute("user", user1);
        if (user1 == null) return "redirect:login.jsp";
        if (user1.getPermissions() > 0)
            return "redirect:backStage.jsp";
        else return "redirect:index.jsp";
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping("/register")
    @ResponseBody
    public Msg register(User user) {
        String maxUserid = userService.queryMaxUserid(0);
        System.out.println(maxUserid);
        int id = Integer.parseInt(maxUserid)+1;
       String userid = String.valueOf(id);
        System.out.println(userid);
       user.setUserid(userid);
        System.out.println("设置userid:"+user);
        int result = userService.addUser(user);
        if(result != 0){
            return Msg.success();
        }else
            return Msg.fail();
    }

    /**
     * 管理员更新
     * @param user
     * @param userid
     * @param arr
     * @param request
     * @return
     */
    @RequestMapping("/updateAdmin")
    @ResponseBody
    public Msg updateAdmin(User user, String userid, @RequestParam("arr") List<String> arr, HttpServletRequest request) {
        int result = userService.updateUser(user);
        System.out.println(result);
        int result1 = userService.deleteMajorType(userid);
        System.out.println(result1);
        List<Major> list = new ArrayList();
        for (String str : arr) {
            Major major = new Major();
            major.setMajorType(str);
            major.setUserid(userid);
            list.add(major);
        }
        System.out.println(list);
        int result2 = userService.insertMajorType(list);
        System.out.println(result2);
        user = userService.queryById(userid);
        request.getSession().setAttribute("user", user);
        return Msg.success().add("admin", user);
    }

    /**
     * 上传头像
     * @param fileload
     * @param userid
     * @param request
     * @return
     * @throws IOException
     * @throws ServletException
     */
    @RequestMapping("/upload")
    @ResponseBody
    public Msg upload(@RequestParam(value = "fileload", required = false) MultipartFile fileload, String userid, HttpServletRequest request)
            throws IOException, ServletException {
        String filename = fileload.getOriginalFilename();
        System.out.println(filename);
//        fileload.transferTo(new File("E:/picture/" + filename));
        User user = userService.queryById(userid);
        user.setPic(filename);
        int result = userService.update_img(user);
        System.out.println(result);
        String url = request.getSession().getServletContext().getRealPath("assets/img");
        System.out.println(url);
        fileload.transferTo(new File(url + File.separator + filename));
        request.getSession().setAttribute("user", user);
        return Msg.success().add("img", user);
    }

    /**
     * 删除user
     * @param userid
     * @return
     */
    @RequestMapping("/deleteUser")
    @ResponseBody
    public Msg deleteUser(String userid) {
        System.out.println(userid);
        int result = userService.deleteUser(userid);
        System.out.println(result);
        return Msg.success();
    }

    /**
     * 批量删除user
     * @param arr
     * @return
     */
    @RequestMapping("/deleteUsers")
    @ResponseBody
    public Msg deleteUsers(@RequestParam(value = "arr") List arr) {
        System.out.println(arr);
        int result = userService.deleteUsers(arr);
        System.out.println(result);
        return Msg.success();
    }

    /**
     * 更新user权限
     * @param userid
     * @param permissions
     * @param request
     * @return
     */
    @RequestMapping("/updatePermissions")
    @ResponseBody
    public Msg updatePermissions(String userid, int permissions, HttpServletRequest request) {
        User user1 = new User();
        if (permissions == 2) {
            List<User> list = userService.getAllByPermissions(2);
            user1 = list.get(0);
            user1.setPermissions(user1.getPermissions() - 1);
            request.getSession().setAttribute("user", user1);
            int result1 = userService.update_permissions(user1);
            System.out.println(result1);
        }
        User user = userService.queryById(userid);
        user.setPermissions(permissions);
        int result = userService.update_permissions(user);
        System.out.println(result);
        return Msg.success().add("user", user1);
    }

    /**
     * 更新密码
     * @param newPassword
     * @param userid
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Msg updatePwd(String newPassword, String userid) {
        System.out.println(userid);
        System.out.println(newPassword);
        User user = userService.queryById(userid);
        user.setPassword(newPassword);
        System.out.println(user);
        int result = userService.updateUser(user);
        System.out.println(result);
        return Msg.success();
    }

    /**
     * 退出登录
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            System.out.println("没删干净!");
            return "redirect:logout";
        } else
            return "login";
    }
}
