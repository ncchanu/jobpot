
package servlet_a;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.User_db;

public class add_db {
    
    Statement st;
    String title; String company; String address; String type; String salary; String description; String email; String closedate; 
    
    public add_db(bean item) { 
        title=item.getTitle();
        company=item.getCompany();
        address=item.getAddress();
        type=item.getType();
        salary=item.getSalary();
        description=item.getDescription();
        email=item.getEmail();
        closedate=item.getClosedate();
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public void addDb(int user) {
        
        connectToDB();
        
        String sql="INSERT INTO jobs (user,title,company,address,type,salary,description,email,closedate) VALUES('"+user+"','"+title+"','"+company+"','"+address+"','"+type+"','"+salary+"','"+description+"','"+email+"','"+closedate+"')";
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
