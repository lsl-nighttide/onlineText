package service;

import entity.Question;
import entity.Question_Type;

import java.util.List;

public interface questionService {
    int addQuestion(Question question);
    int deleteQuestion(int question_id);
    int updateQuestion(Question question);
    List<Question> getQuestionAll();
    List<Question> getQuestionByQuestion_type(String question_type);
    Question queryById(int question_id);
    int addQuestion_Type(List<Question_Type> question_type);
    int deleteQuestion_Type(int question_id);
    List<Question> queryRandQuestionByQuestion_type(List<String> list);
}
