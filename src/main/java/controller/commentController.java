package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.commentService;
import util.Msg;

import java.util.List;

@Controller
public class commentController {
    @Autowired
    private commentService commentService;

    @RequestMapping("/getCommentAll")
    @ResponseBody
    public Msg getCommentAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn,5);
        List<Comment> list = commentService.getCommentAll();
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }
    @RequestMapping("/queryByPostid")
    @ResponseBody
    public Msg queryByPostid(@RequestParam(value = "pn",defaultValue = "1") Integer pn,String content){
        PageHelper.startPage(pn,5);
        int postid = Integer.parseInt(content);
        System.out.println(postid);
        List<Comment> list = commentService.queryByPostid(postid);
        System.out.println(list);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }
    @RequestMapping("/deleteComment")
    @ResponseBody
    public Msg deleteComment(int comment_id){
        System.out.println(comment_id);
        int result = commentService.deleteComment(comment_id);
        System.out.println(result);
        return Msg.success();
    }
}
