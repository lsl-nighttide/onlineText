package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.*;
import util.Msg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 负责前台页面的controller
 */
@Controller
public class preController {
    @Autowired
    private userService userService;
    @Autowired
    private questionService questionService;
    @Autowired
    private examService examService;
    @Autowired
    private wrongSetService wrongSetService;
    @Autowired
    private collectionService collectionService;
    @Autowired
    private postService postService;
    @Autowired
    private commentService commentService;

    /**
     * 判断是否登录
     * @param request
     * @return
     */
    @RequestMapping("/isLogin")
    @ResponseBody
    public Msg isLogin(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println("首页的user：" + user);
        if (user != null) {
            return Msg.success().add("user", user);
        } else
            return Msg.fail();
    }

    /**
     * 更新用户信息
     * @param user
     * @param arr
     * @param request
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public Msg updateUser(User user, @RequestParam(value = "arr") List<String> arr, HttpServletRequest request) {
        System.out.println(user);
        System.out.println(arr);
        int result = userService.updateUser(user);
        System.out.println(result);
        int result1 = userService.deleteMajorType(user.getUserid());
        System.out.println(result1);
        List<Major> list = new ArrayList();
        for (String str : arr) {
            Major major = new Major();
            major.setMajorType(str);
            major.setUserid(user.getUserid());
            list.add(major);
        }
        System.out.println(list);
        int result2 = 0;
        if (list != null)
            result2 = userService.insertMajorType(list);
        System.out.println(result2);
        user = userService.queryById(user.getUserid());
        request.getSession().setAttribute("user", user);
        return Msg.success();
    }

    /**
     * 专项练习，得到10道随机试题
     * @param arr
     * @param request
     * @return
     */
    @RequestMapping("/special_practise")
    @ResponseBody
    public Msg special_practise(@RequestParam(value = "arr") List<String> arr, HttpServletRequest request) {
        System.out.println(arr);
        if (arr == null)
            return Msg.fail();
        List<Question> list = questionService.queryRandQuestionByQuestion_type(arr);
        System.out.println(list);
        request.getSession().setAttribute("select_question", list);
        return Msg.success();
    }

    /**
     * 用来得到session，存放10道题的session
     * @param request
     * @return
     */
    @RequestMapping("/getQuestionSession")
    @ResponseBody
    public Msg getSession(HttpServletRequest request) {
        List<Question> list = (List<Question>) request.getSession().getAttribute("select_question");
        System.out.println(list);
        return Msg.success().add("select_question", list);
    }

    /**
     * 判断是否被收藏
     * @param question_id
     * @return
     */
    @RequestMapping("/isCollection")
    @ResponseBody
    public Msg isCollection(Integer question_id) {
        Collection_ques collection_ques = collectionService.queryCollectionByQuestion_id(question_id);
        if (collection_ques == null)
            return Msg.fail();
        else
            return Msg.success();
    }

    /**
     * 提交试题，试卷表的增加、试卷试题表的增加、收藏表的增加、错题表的增加
     * @param checkQues
     * @param collection
     * @param request
     * @return
     */
    @RequestMapping("/submitQuestion")
    @ResponseBody
    public Msg submitQuestion(@RequestParam(value = "checkQues") List<String> checkQues, @RequestParam(value = "collection")
            List<Integer> collection, HttpServletRequest request) {
        List<Question> questions = (List<Question>) request.getSession().getAttribute("select_question");
        User user = (User) request.getSession().getAttribute("user");
        Date d = new Date();
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String completion_time = date.format(d); //得到当前时间
        int grade = 0;
        Exam exam = new Exam();
        exam.setUserid(user.getUserid());
        exam.setGrade(grade);
        exam.setCompletion_time(completion_time);
        int result = examService.addExam(exam);
        System.out.println("插入试卷结果:" + result);
        int exam_id = exam.getExam_id();
//        先插入exam,成绩后面更新,再插入exam_question,并将错题和我的答案插入到wrongSet
        List<Exam_question> list = new ArrayList<>();
        List<WrongSet> list1 = new ArrayList<>();
        for (int i = 0; i < checkQues.size(); i++) {
            Exam_question exam_question = new Exam_question();
            exam_question.setExam_id(exam_id);
            exam_question.setQuestion_id(questions.get(i).getQuestion_id());
            exam_question.setMyanswer(checkQues.get(i));
            if ((checkQues.get(i)).equals(questions.get(i).getQuestion_answer())) {//判断答案是否正确
                grade += 10;
                exam_question.setStatus(1);
            } else {
                exam_question.setStatus(0);
                WrongSet wrongSet = new WrongSet();
                wrongSet.setWrongSet_question_id(questions.get(i).getQuestion_id());
                wrongSet.setMyAnswer(checkQues.get(i));
                wrongSet.setUserid(user.getUserid());
                list1.add(wrongSet);
            }
            list.add(exam_question);

        }
        System.out.println(list);
        Exam exam1 = examService.queryExamById(exam_id);
        exam1.setGrade(grade);
        int result2 = examService.updateExam(exam1);
        System.out.println("更新试卷结果:" + result2);
        int result1 = examService.addExam_questions(list);
        System.out.println("批量插入试题结果:" + result1);
        int result3 = wrongSetService.addWrongSet(list1);
        System.out.println("批量插入错题集结果:" + result3);
//        将collection数组中的试题id传进collection对象中
        List<Collection_ques> list2 = new ArrayList<>();
        if (collection.size() != 0) {
            for (int id : collection) {
                Collection_ques collection1 = new Collection_ques();
                collection1.setQuestion_id(id);
                collection1.setUserid(user.getUserid());
                list2.add(collection1);
            }
            int result4 = collectionService.addCollection(list2);
            System.out.println("批量插入收藏题结果:" + result4);
        }
        return Msg.success().add("exam", exam1);
    }

    /**
     * 进行页面跳转，并将试卷试题用session存放
     * @param exam_id
     * @param request
     * @return
     */
    @RequestMapping("/answer_key")
    public String answer_key(Integer exam_id, HttpServletRequest request){
        Exam exam = examService.queryExamById(exam_id);
        System.out.println(exam);
        List<Exam_question> exam_questions = exam.getList();
        System.out.println("提交的试题:"+exam_questions);
        request.getSession().setAttribute("exam_questions",exam_questions);
        return "answer_keys";
    }

    /**
     * 得到存放的试卷试题session
     * @param request
     * @return
     */
    @RequestMapping("/getExam_questionsSession")
    @ResponseBody
    public Msg getExamSession(HttpServletRequest request){
        List<Exam_question> exam_questions = (List<Exam_question>) request.getSession().getAttribute("exam_questions");
        System.out.println("在解析界面:"+exam_questions);
        return Msg.success().add("exam_questions",exam_questions);
    }

    /**
     * 根据试题id得到试题
     * @param question_id
     * @return
     */
    @RequestMapping("/getQuestion")
    @ResponseBody
    public Msg getQuestion(Integer question_id){
        System.out.println(question_id);
        Question question = questionService.queryById(question_id);
        return Msg.success().add("question",question);
    }

    /**
     * 根据试题id得到帖子
     * @param pn
     * @param question_id
     * @return
     */
    @RequestMapping("/getPost")
    @ResponseBody
    public Msg getPost(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Integer question_id){
        PageHelper.startPage(pn,5);
        List<Post> list = postService.queryByQuestion_Id(question_id);
        System.out.println("帖子:"+list);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 根据帖子id得到comment
     * @param pn
     * @param postid
     * @return
     */
    @RequestMapping("/getComment")
    @ResponseBody
    public Msg getComment(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Integer postid){
        PageHelper.startPage(pn,5);
        List<Comment> list = commentService.queryByPostid(postid);
        System.out.println("评论:"+list);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 增加帖子
     * @param post
     * @return
     */
    @RequestMapping("/addPost")
    @ResponseBody
    public Msg addPost(Post post){
        System.out.println(post);
        Date d = new Date();
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String publish_time = date.format(d);
        post.setPost_creattime(publish_time);
        int result = postService.addPost(post);
        System.out.println("插入帖子结果:"+result);
        return Msg.success();
    }

    /**
     * 得到帖子数
     * @param question_id
     * @return
     */
    @RequestMapping("/getPostLength")
    @ResponseBody
    public Msg getPostLength(Integer question_id){
        List<Post> list = postService.queryByQuestion_Id(question_id);
        int size = list.size();
        System.out.println("帖子数:"+size);
        return Msg.success().add("size",size);
    }

    /**
     * 增加评论
     * @param comment
     * @return
     */
    @RequestMapping("/addComment")
    @ResponseBody
    public Msg addComment(Comment comment){
        System.out.println(comment);
        Date d = new Date();
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String publish_time = date.format(d);
        comment.setComment_creattime(publish_time);
        int result = commentService.addComment(comment);
        System.out.println(result);
        Post post = postService.queryByPostid(comment.getPostid());
        int commentnum =post.getCommentnum()+1;
        post.setCommentnum(commentnum);
        int result2 = postService.updatePost(post);
        System.out.println(result2);
        return Msg.success();
    }

    /**
     * 得到所有已做完试卷
     * @param pn
     * @param userid
     * @return
     */
    @RequestMapping("/getExamAll")
    @ResponseBody
    public Msg getExamAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userid){
        PageHelper.startPage(pn,9);
        List<Exam> list = examService.getExamAllByUserid(userid);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 得到所有收藏的试题
     * @param pn
     * @param userid
     * @return
     */
    @RequestMapping("/getCollectionAll")
    @ResponseBody
    public Msg getCollectionAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userid){
        PageHelper.startPage(pn,5);
        List<Collection_ques> list = collectionService.queryCollectionByUserid(userid);
        PageInfo pageInfo = new PageInfo(list,3);
        return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 跳转到试题详情页面，并存放试题用session
     * @param question_id
     * @param request
     * @return
     */
    @RequestMapping("/questionDetails")
    public String questionDetails(Integer question_id,HttpServletRequest request){
        System.out.println(question_id);
        Question question = questionService.queryById(question_id);
        request.getSession().setAttribute("question",question);
        return "questionDetails";
    }

    /**
     * 得到试题session
     * @param request
     * @return
     */
    @RequestMapping("/getquestionSession")
    @ResponseBody
    public Msg getquestionSession(HttpServletRequest request){
        Question question = (Question) request.getSession().getAttribute("question");
        return Msg.success().add("question",question);
    }

    /**
     * 根据试卷id，得到试卷中的试题
     * @param question_id
     * @return
     */
    @RequestMapping("getExam_question")
    @ResponseBody
    public Msg getExam_quesiton(Integer question_id){
        Exam_question exam_question = examService.queryExam_questionByQuestion_id(question_id);
        return Msg.success().add("exam_question",exam_question);
    }

    /**
     * 得到所有错题
     * @param pn
     * @param userid
     * @return
     */
    @RequestMapping("/getWrongSet")
    @ResponseBody
    public Msg getWrongSet(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String userid){
       PageHelper.startPage(pn,10);
       List<WrongSet> list = wrongSetService.queryWrongSetByUserid(userid);
       PageInfo pageInfo = new PageInfo(list,3);
       return Msg.success().add("pageinfo",pageInfo);
    }

    /**
     * 销毁user  session，达到退出登录的目的
     * @param request
     * @return
     */
    @RequestMapping("/invalidate")
    @ResponseBody
    public Msg invalidate(HttpServletRequest request){
        HttpSession session = request.getSession(true);
        session.removeAttribute("msg");
        return Msg.success();
    }
}
