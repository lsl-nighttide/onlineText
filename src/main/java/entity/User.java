package entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class User {
    private String userid;
    private String username;
    private String password;
    private String sex;
    private String phone;
    private String address;
    private String introduce;
    private List<Major> majorType = new ArrayList<>();
    private String pic;
    private int permissions;

    public User() {

    }

    public User(String username, String password, String sex, String phone, String address, String introduce, List<Major> majorType, String pic, int permissions) {
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
        this.introduce = introduce;
        this.majorType = majorType;
        this.pic = pic;
        this.permissions = permissions;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public List<Major> getMajorType() {
        return majorType;
    }

    public void setMajorType(List<Major> majorType) {
        this.majorType = majorType;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getPermissions() {
        return permissions;
    }

    public void setPermissions(int permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", introduce='" + introduce + '\'' +
                ", majorType=" + majorType +
                ", pic='" + pic + '\'' +
                ", permissions=" + permissions +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return permissions == user.permissions &&
                Objects.equals(userid, user.userid) &&
                Objects.equals(username, user.username) &&
                Objects.equals(password, user.password) &&
                Objects.equals(sex, user.sex) &&
                Objects.equals(phone, user.phone) &&
                Objects.equals(address, user.address) &&
                Objects.equals(introduce, user.introduce) &&
                Objects.equals(majorType, user.majorType) &&
                Objects.equals(pic, user.pic);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userid, username, password, sex, phone, address, introduce, majorType, pic, permissions);
    }
}