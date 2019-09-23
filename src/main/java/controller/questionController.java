package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Question;
import entity.Question_Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.questionService;
import util.Msg;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class questionController {
    @Autowired
    private questionService questionService;

    /**
     * 得到所有试题
     * @param pn
     * @return
     */
    @RequestMapping("/getQuestionAll")
    @ResponseBody
    public Msg getAll(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,2);
        List<Question> list = questionService.getQuestionAll();
       System.out.println(list);
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 更新试题
     * @param question
     * @param question_type_str
     * @return
     */
    @RequestMapping("/updateQuestion")
    @ResponseBody
    public Msg updateQuestion(Question question,String question_type_str){
        String[] arr = question_type_str.split(" ");
        List<String> list = Arrays.asList(arr);
        int result = questionService.deleteQuestion_Type(question.getQuestion_id());
        System.out.println(result);
        List<Question_Type> list1 = new ArrayList<>();
        for(String str : list){
            Question_Type question_type = new Question_Type();
            question_type.setQuestion_id(question.getQuestion_id());
            question_type.setQuestion_type(str);
            list1.add(question_type);
        }
        int result1 = questionService.addQuestion_Type(list1);
        System.out.println(result1);
        int result2 = questionService.updateQuestion(question);
        System.out.println(result2);
        return Msg.success();
    }

    /**
     * 删除试题
     * @param question_id
     * @return
     */
    @RequestMapping("/deleteQuestion")
    @ResponseBody
    public Msg deleteQuestion(Integer question_id){
        System.out.println(question_id);
        int result = questionService.deleteQuestion(question_id);
        System.out.println(result);
        return Msg.success();
    }

    /**
     * 根据试题id查询
     * @param pn
     * @param content
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Msg queryById(@RequestParam(value = "pn",defaultValue = "1") Integer pn , String content){
        PageHelper.startPage(pn,2);
        int question_id = Integer.parseInt(content);
        Question question = questionService.queryById(question_id);
        List<Question> list = new ArrayList();
        list.add(question);
        PageInfo pageInfo  = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 根据试卷类型查询
     * @param pn
     * @param content
     * @return
     */
    @RequestMapping("/queryByType")
    @ResponseBody
    public Msg queryByType(@RequestParam(value = "pn",defaultValue = "1") Integer pn , String content){
        PageHelper.startPage(pn,2);
        List<Question> list = questionService.getQuestionByQuestion_type(content);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 增加试题
     * @param question
     * @param arr
     * @return
     */
    @RequestMapping("/addQuestion")
    @ResponseBody
    public Msg addQuestion(Question question,@RequestParam(value = "arr") List<String> arr){
        int result = questionService.addQuestion(question);
        System.out.println(result);
        int question_id = question.getQuestion_id();
        List<Question_Type> list = new ArrayList<>();
        for(String str : arr){
            Question_Type question_type = new Question_Type();
            question_type.setQuestion_id(question_id);
            question_type.setQuestion_type(str);
            list.add(question_type);
        }
        int result1 = questionService.addQuestion_Type(list);
        System.out.println(result1);
        return Msg.success();
    }
}
