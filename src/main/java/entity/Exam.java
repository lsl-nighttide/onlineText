package entity;

import java.util.ArrayList;
import java.util.List;

public class Exam {
    private int exam_id;
    private String userid;
    private int grade;
    private String completion_time;
    private List<Exam_question> exam_questions = new ArrayList<>();

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getCompletion_time() {
        return completion_time;
    }

    public void setCompletion_time(String completion_time) {
        this.completion_time = completion_time;
    }

    public List<Exam_question> getList() {
        return exam_questions;
    }

    public void setList(List<Exam_question> exam_questions) {
        this.exam_questions = exam_questions;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "exam_id=" + exam_id +
                ", userid=" + userid +
                ", grade=" + grade +
                ", completion_time='" + completion_time + '\'' +
                ", exam_questions=" + exam_questions +
                '}';
    }
}
