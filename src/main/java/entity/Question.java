package entity;

import java.util.ArrayList;
import java.util.List;

public class Question {
    private int question_id;
    private String question_title;
    private String question_OptionA;
    private String question_OptionB;
    private String question_OptionC;
    private String question_OptionD;
    private List<Question_Type> question_type = new ArrayList<>();
    private String question_answer;
    private String question_parse;

    public Question() {
    }

    public Question(String question_title, String question_OptionA, String question_OptionB, String question_OptionC, String question_OptionD, List<Question_Type> question_type, String question_answer, String question_parse) {
        this.question_title = question_title;
        this.question_OptionA = question_OptionA;
        this.question_OptionB = question_OptionB;
        this.question_OptionC = question_OptionC;
        this.question_OptionD = question_OptionD;
        this.question_type = question_type;
        this.question_answer = question_answer;
        this.question_parse = question_parse;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getQuestion_title() {
        return question_title;
    }

    public void setQuestion_title(String question_title) {
        this.question_title = question_title;
    }

    public String getQuestion_OptionA() {
        return question_OptionA;
    }

    public void setQuestion_OptionA(String question_OptionA) {
        this.question_OptionA = question_OptionA;
    }

    public String getQuestion_OptionB() {
        return question_OptionB;
    }

    public void setQuestion_OptionB(String question_OptionB) {
        this.question_OptionB = question_OptionB;
    }

    public String getQuestion_OptionC() {
        return question_OptionC;
    }

    public void setQuestion_OptionC(String question_OptionC) {
        this.question_OptionC = question_OptionC;
    }

    public String getQuestion_OptionD() {
        return question_OptionD;
    }

    public void setQuestion_OptionD(String question_OptionD) {
        this.question_OptionD = question_OptionD;
    }

    public List<Question_Type> getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(List<Question_Type> question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_answer() {
        return question_answer;
    }

    public void setQuestion_answer(String question_answer) {
        this.question_answer = question_answer;
    }

    public String getQuestion_parse() {
        return question_parse;
    }

    public void setQuestion_parse(String question_parse) {
        this.question_parse = question_parse;
    }

    @Override
    public String toString() {
        return "Question{" +
                "question_id=" + question_id +
                ", question_title='" + question_title + '\'' +
                ", question_OptionA='" + question_OptionA + '\'' +
                ", question_OptionB='" + question_OptionB + '\'' +
                ", question_OptionC='" + question_OptionC + '\'' +
                ", question_OptionD='" + question_OptionD + '\'' +
                ", question_type=" + question_type +
                ", question_answer='" + question_answer + '\'' +
                ", question_parse='" + question_parse + '\'' +
                '}';
    }
}