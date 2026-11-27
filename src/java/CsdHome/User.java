package CsdHome;

import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String fname;

    public User() {}

    public String getUsername() { return username; }
    public String getFname() { return fname; }
    public void setUsername(String username) { this.username = username; }
    public void setFname(String fname) { this.fname = fname; }
}
