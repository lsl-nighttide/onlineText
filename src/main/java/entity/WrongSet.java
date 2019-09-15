package entity;

public class WrongSet {
    private int wrongSet_id;
    private int wrongSet_question_id;
    private String myAnswer;
    private String userid;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getWrongSet_id() {
        return wrongSet_id;
    }

    public void setWrongSet_id(int wrongSet_id) {
        this.wrongSet_id = wrongSet_id;
    }

    public int getWrongSet_question_id() {
        return wrongSet_question_id;
    }

    public void setWrongSet_question_id(int wrongSet_question_id) {
        this.wrongSet_question_id = wrongSet_question_id;
    }

    public String getMyAnswer() {
        return myAnswer;
    }

    public void setMyAnswer(String myAnswer) {
        this.myAnswer = myAnswer;
    }

    @Override
    public String toString() {
        return "WrongSet{" +
                "wrongSet_id=" + wrongSet_id +
                ", wrongSet_question_id=" + wrongSet_question_id +
                ", myAnswer='" + myAnswer + '\'' +
                ", userid='" + userid + '\'' +
                '}';
    }
}
