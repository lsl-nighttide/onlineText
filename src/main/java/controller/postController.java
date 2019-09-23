package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.postService;
import util.Msg;

import java.util.List;

@Controller
public class postController {
    @Autowired
    private postService postService;

    /**
     * 得到所有post
     * @param pn
     * @return
     */
    @RequestMapping("/getPostAll")
    @ResponseBody
    public Msg getPostAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 5);
        List<Post> list = postService.getPostAll();
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list, 3);
        return Msg.success().add("pageinfo", pageInfo);
    }

    /**
     * 根据试题id查询帖子
     * @param pn
     * @param content
     * @return
     */
    @RequestMapping("/queryByQuestion_Id")
    @ResponseBody
    public Msg queryByQuestion_Id(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String content) {
        PageHelper.startPage(pn, 5);
        int question_id = Integer.parseInt(content);
        System.out.println(question_id);
        List<Post> list = postService.queryByQuestion_Id(question_id);
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list, 3);
        return Msg.success().add("pageinfo", pageInfo);
    }

    /**
     * 根据帖子id删除帖子
     * @param postid
     * @return
     */
    @RequestMapping("/deletePost")
    @ResponseBody
    public Msg deletePost(int postid) {
        System.out.println(postid);
        int result = postService.deletePost(postid);
        System.out.println(result);
        return Msg.success();
    }
}
