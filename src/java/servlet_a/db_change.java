package servlet_a;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.User_db;

public class db_change {
    Statement st;
    public void deleteAdd(String jobId) {
        connectToDB();
        String sql=" DELETE FROM jobs WHERE id='"+jobId+"' ";
        try {
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editAdd(String jobId,String title,String company,String address,String type,String salary,String description,String email,String closedate) {
        connectToDB();
        String sql=" UPDATE jobs SET title='"+title+"',company='"+company+"',address='"+address+"',type='"+type+"',salary='"+salary+"',description='"+description+"',email='"+email+"',closedate='"+closedate+"' "
                + "WHERE id='"+jobId+"' ";
        try {
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(User_db.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void connectToDB() {
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
}
