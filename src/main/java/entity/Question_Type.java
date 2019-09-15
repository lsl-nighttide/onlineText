package entity;

public class Question_Type {
    private int question_type_id;
    private int question_id;
    private String question_type;

    public Question_Type() {
    }

    public Question_Type(int question_type_id, int question_id, String question_type) {
        this.question_type_id = question_type_id;
        this.question_id = question_id;
        this.question_type = question_type;
    }

    public int getQuestion_type_id() {
        return question_type_id;
    }

    public void setQuestion_type_id(int question_type_id) {
        this.question_type_id = question_type_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    @Override
    public String toString() {
        return "Question_Type{" +
                "question_type_id=" + question_type_id +
                ", question_id=" + question_id +
                ", question_type='" + question_type + '\'' +
                '}';
    }
}
