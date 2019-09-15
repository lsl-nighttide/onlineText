package service;

import entity.Exam;
import entity.Exam_question;

import java.util.List;

public interface examService {
    int addExam(Exam exam);
    int deleteExam(int exam_id);
    int updateExam(Exam exam);
    List<Exam> getExamAll();
    Exam queryExamById(int exam_id);
    int addExam_questions(List<Exam_question> exam_questions);
    int updateExam_questions(List<Exam_question> exam_questions);
    List<Exam> getExamAllByUserid(String userid);
    Exam_question queryExam_questionByQuestion_id(int question_id);
}
