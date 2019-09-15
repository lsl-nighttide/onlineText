package service.impl;

import entity.Question;
import entity.Question_Type;
import mapper1.questionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.questionService;

import java.util.List;

@Service
public class questionServiceImpl implements questionService {
    @Autowired
    private questionMapper questionMapper;
    @Override
    public int addQuestion(Question question) {
        return questionMapper.addQuestion(question);
    }

    @Override
    public int deleteQuestion(int question_id) {
        return questionMapper.deleteQuestion(question_id);
    }

    @Override
    public int updateQuestion(Question question) {
        return questionMapper.updateQuestion(question);
    }

    @Override
    public List<Question> getQuestionAll() {
        return questionMapper.getQuestionAll();
    }

    @Override
    public List<Question> getQuestionByQuestion_type(String question_type) {
        return questionMapper.getQuestionByQuestion_type(question_type);
    }

    @Override
    public Question queryById(int question_id) {
        return questionMapper.queryById(question_id);
    }

    @Override
    public int addQuestion_Type(List<Question_Type> question_type) {
        return questionMapper.addQuestion_Type(question_type);
    }

    @Override
    public int deleteQuestion_Type(int question_id) {
        return questionMapper.deleteQuestion_Type(question_id);
    }

    @Override
    public List<Question> queryRandQuestionByQuestion_type(List<String> list) {
        return questionMapper.queryRandQuestionByQuestion_type(list);
    }
}
