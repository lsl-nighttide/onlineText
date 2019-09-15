package service.impl;

import entity.Exam;
import entity.Exam_question;
import mapper1.examMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.examService;

import java.util.List;
@Service
public class examServiceImpl implements examService {
    @Autowired
    private examMapper examMapper;
    @Override
    public int addExam(Exam exam) {
        return examMapper.addExam(exam);
    }

    @Override
    public int deleteExam(int exam_id) {
        return examMapper.deleteExam(exam_id);
    }

    @Override
    public int updateExam(Exam exam) {
        return examMapper.updateExam(exam);
    }

    @Override
    public List<Exam> getExamAll() {
        return examMapper.getExamAll();
    }

    @Override
    public Exam queryExamById(int exam_id) {
        return examMapper.queryExamById(exam_id);
    }

    @Override
    public int addExam_questions(List<Exam_question> exam_questions) {
        return examMapper.addExam_questions(exam_questions);
    }

    @Override
    public int updateExam_questions(List<Exam_question> exam_questions) {
        return examMapper.updateExam_questions(exam_questions);
    }

    @Override
    public List<Exam> getExamAllByUserid(String userid) {
        return examMapper.getExamAllByUserid(userid);
    }

    @Override
    public Exam_question queryExam_questionByQuestion_id(int question_id) {
        return examMapper.queryExam_questionByQuestion_id(question_id);
    }
}
