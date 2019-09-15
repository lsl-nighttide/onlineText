package entity;

public class Post {
    private int postid;
    private int question_id;
    private String posterid;
    private String post_content;
    private String post_creattime;
    private int commentnum;
    private User user;

    public Post() {
    }

    public Post(int question_id, String posterid, String post_content, String post_creattime, int commentnum, User user) {
        this.question_id = question_id;
        this.posterid = posterid;
        this.post_content = post_content;
        this.post_creattime = post_creattime;
        this.commentnum = commentnum;
        this.user = user;
    }

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getPosterid() {
        return posterid;
    }

    public void setPosterid(String posterid) {
        this.posterid = posterid;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    public String getPost_creattime() {
        return post_creattime;
    }

    public void setPost_creattime(String post_creattime) {
        this.post_creattime = post_creattime;
    }

    public int getCommentnum() {
        return commentnum;
    }

    public void setCommentnum(int commentnum) {
        this.commentnum = commentnum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Post{" +
                "postid=" + postid +
                ", question_id=" + question_id +
                ", posterid='" + posterid + '\'' +
                ", post_content='" + post_content + '\'' +
                ", post_creattime='" + post_creattime + '\'' +
                ", commentnum=" + commentnum +
                ", user=" + user +
                '}';
    }
}
