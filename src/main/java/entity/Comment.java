package entity;

public class Comment {
    private int comment_id;
    private int postid;
    private int commenter_id;
    private String comment_content;
    private String comment_creattime;
    private User user;

    public Comment() {
    }

    public Comment(int postid, int commenter_id, String comment_content, String comment_creattime, User user) {
        this.postid = postid;
        this.commenter_id = commenter_id;
        this.comment_content = comment_content;
        this.comment_creattime = comment_creattime;
        this.user = user;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getPostid() {
        return postid;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public int getCommenter_id() {
        return commenter_id;
    }

    public void setCommenter_id(int commenter_id) {
        this.commenter_id = commenter_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_creattime() {
        return comment_creattime;
    }

    public void setComment_creattime(String comment_creattime) {
        this.comment_creattime = comment_creattime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", postid=" + postid +
                ", commenter_id=" + commenter_id +
                ", comment_content='" + comment_content + '\'' +
                ", comment_creattime='" + comment_creattime + '\'' +
                ", user=" + user +
                '}';
    }
}
