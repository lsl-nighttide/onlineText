package entity;

public class Exam_question {
    private int exam_question_id;
    private int exam_id;
    private int question_id;
    private String myanswer;
    private int status;



    public int getExam_question_id() {
        return exam_question_id;
    }

    public void setExam_question_id(int exam_question_id) {
        this.exam_question_id = exam_question_id;
    }

    public int getExam_id() {
        return exam_id;
    }

    public void setExam_id(int exam_id) {
        this.exam_id = exam_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getMyanswer() {
        return myanswer;
    }

    public void setMyanswer(String myanswer) {
        this.myanswer = myanswer;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Exam_question{" +
                "exam_question_id=" + exam_question_id +
                ", exam_id=" + exam_id +
                ", question_id=" + question_id +
                ", myanswer='" + myanswer + '\'' +
                ", status=" + status +
                '}';
    }
}
