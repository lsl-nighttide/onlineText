package mapper1;

import entity.Question;
import entity.Question_Type;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface questionMapper {
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
