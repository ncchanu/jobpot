package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User_db {
    
    Statement st;
    void addUser(String name, String nic, String email, String tel, String uname, String pw) {
        connectToDB();
        String sql="INSERT INTO user (name,nic,email,telephone,uname,pw) VALUES('"+name+"','"+nic+"','"+email+"','"+tel+"','"+uname+"','"+pw+"')";
        try {
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    void editUser(String name, String nic, String email, String tel, String uname, String pw, String user) {
        connectToDB();
        String sql=" UPDATE user SET name='"+name+"',nic='"+nic+"',email='"+email+"',telephone='"+tel+"',uname='"+uname+"',pw='"+pw+"' WHERE id='"+user+"' ";
        try {
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void connectToDB() {
        String driver="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/jobpot";
  
        try {
            Class.forName(driver);
            Connection con=DriverManager.getConnection(url,"root","" );
            st=con.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    int check_login(String uname, String pw)
    {
        connectToDB();
        String qry="SELECT * FROM user WHERE uname='"+uname+"' ";
        int check=0;
        //List data = new ArrayList();
        
        try {
            ResultSet rs = st.executeQuery(qry);
            while(rs.next())
            {
                if(rs.getString("pw").equals(pw))
                {
                    check=Integer.parseInt(rs.getString("id"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    
}

