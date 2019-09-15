package entity;

import java.util.Objects;

public class Major {
    private int majorid;
    private String userid;
    private String majorType;

    public Major() {
    }

    public Major(int majorid, String userid, String majorType) {
        this.majorid = majorid;
        this.userid = userid;
        this.majorType = majorType;
    }

    public int getMajorid() {
        return majorid;
    }

    public void setMajorid(int majorid) {
        this.majorid = majorid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getMajorType() {
        return majorType;
    }

    public void setMajorType(String majorType) {
        this.majorType = majorType;
    }

    @Override
    public String toString() {
        return "Major{" +
                "majorid=" + majorid +
                ", userid='" + userid + '\'' +
                ", majorType='" + majorType + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Major major = (Major) o;
        return majorid == major.majorid &&
                Objects.equals(userid, major.userid) &&
                Objects.equals(majorType, major.majorType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(majorid, userid, majorType);
    }
}